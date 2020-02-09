import org.apache.spark.sql.SparkSession
import org.apache.spark.SparkContext
import org.apache.spark.SparkContext._
import org.apache.spark.SparkConf
import org.apache.spark.sql.types._
import org.apache.spark.sql.functions._
import org.apache.spark.sql.Column
import org.apache.spark.sql.Dataset
import org.apache.spark.sql.Row

import scala.math

object ReturnTrips {
  val EARTH_RADIUS = 6371000; // in meters

  /**
   * @trips the input dataset of taxi rides
   * @dist  the maximum distance between dropoff and pickup locations for a trip to be considered a "return trip"
   * @spark the Spark session
   */
  def compute(trips : Dataset[Row], dist : Double, spark : SparkSession) : Dataset[Row] = {
    import spark.implicits._

    val tripsProcessed = trips
      .withColumn("uniqueID", monotonicallyIncreasingId)
      .withColumn("pickup_longitude", toRadians("pickup_longitude"))
      .withColumn("pickup_latitude", toRadians("pickup_latitude"))
      .withColumn("dropoff_longitude", toRadians("dropoff_longitude"))
      .withColumn("dropoff_latitude", toRadians("dropoff_latitude"))
      .withColumn("pickup_datetime", unix_timestamp($"tpep_pickup_datetime"))
      .withColumn("dropoff_datetime", unix_timestamp($"tpep_dropoff_datetime"))

    val tripsSelectedData = tripsProcessed
      .select(
        "uniqueID",
        "pickup_datetime",
        "dropoff_datetime",
        "pickup_longitude",
        "pickup_latitude",
        "dropoff_longitude",
        "dropoff_latitude"
      )

    // angle (in rads) corresponding to the provided distance (size of buckets)
    val hedgingFactor = 1.5 // constant needed for hedging dist angle over latitude/longitude
    val angBukRange = hedgingFactor * dist / EARTH_RADIUS
    val timeBukRange = 8.0 * 60 * 60  // 8 * 60 * 60

    // Selected buckets
    val tripsWithBuks = tripsSelectedData
      .withColumn("pickup_time_buk", floor($"pickup_datetime" / timeBukRange))
      .withColumn("dropoff_time_buk", floor($"dropoff_datetime" / timeBukRange))
      .withColumn("pickup_lat_buk", floor($"pickup_latitude" / angBukRange))
      .withColumn("dropoff_lat_buk", floor($"dropoff_latitude" / angBukRange))

    // table grows by a factor of 3^#explodes in this step
    val tripsExpl = tripsWithBuks
      .withColumn("pickup_lat_buk", explode(array($"pickup_lat_buk" - 1, $"pickup_lat_buk", $"pickup_lat_buk" + 1)))
      .withColumn("dropoff_lat_buk", explode(array($"dropoff_lat_buk" - 1, $"dropoff_lat_buk", $"dropoff_lat_buk" + 1)))
      .withColumn("pickup_time_buk", explode(array($"pickup_time_buk" - 1, $"pickup_time_buk")))
      // .withColumn("dropoff_time_buk", explode(array($"dropoff_time_buk" - 1, $"dropoff_time_buk", $"dropoff_time_buk" + 1)))

    // NOTE
    // Filtering over latitude seems to be more strict
    // And pickup time only needs to be compared to previous drop-offs
    // |tripsExpl| = |trips| * 3 * 3 * 2

    val tripsEqual = tripsWithBuks.as("a")
      .join(tripsExpl.as("b"),
        $"a.dropoff_time_buk" === $"b.pickup_time_buk" and
        $"a.pickup_lat_buk" === $"b.dropoff_lat_buk" and
        $"b.pickup_lat_buk" === $"a.dropoff_lat_buk"
      )
      .where(
        $"a.dropoff_datetime" < $"b.pickup_datetime" and
        $"b.pickup_datetime" - $"a.dropoff_datetime" < 28800 and
        distanceRadOnColumns($"a.pickup_longitude", $"a.pickup_latitude", $"b.dropoff_longitude", $"b.dropoff_latitude") < dist and
        distanceRadOnColumns($"a.dropoff_longitude", $"a.dropoff_latitude", $"b.pickup_longitude", $"b.pickup_latitude") < dist
      )

    tripsEqual

    // tripsWithRads.as("a")
    //   .join(tripsWithRads.as("b"),
    //     unix_timestamp($"b.tpep_pickup_datetime") - unix_timestamp($"a.tpep_dropoff_datetime") < 28800 and
    //     $"a.tpep_dropoff_datetime" < $"b.tpep_pickup_datetime" and
    //     distanceRadOnColumns($"a.pickup_lon_rad", $"a.pickup_lat_rad", $"b.dropoff_lon_rad", $"b.dropoff_lat_rad") < dist and
    //     distanceRadOnColumns($"b.pickup_lon_rad", $"b.pickup_lat_rad", $"a.dropoff_lon_rad", $"a.dropoff_lat_rad") < dist)
  }

  // See: https://en.wikipedia.org/wiki/Great-circle_distance#Formulae
  def distanceRadOnColumns(a_lon_col: Column, a_lat_col: Column, b_lon_col: Column, b_lat_col: Column): Column = {
    val tmp = pow(sin(abs(a_lat_col - b_lat_col) / 2), 2) + cos(a_lat_col) * cos(b_lat_col) * pow(sin(abs(a_lon_col - b_lon_col) / 2), 2)
    asin(sqrt(tmp)) * lit(12742000) // EARTH_RADIUS * 2
  }

}
