#include "DistCalculator.hpp"
#include <chrono>
#include <cstdlib>
#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <unordered_map>
#include <unordered_set>
#include <queue>
#include <bitset>

using namespace std;

DistCalculator::DistCalculator(std::string edgeListFile)
{
    // Hardcoded, precomputed values, from original dataset
    this->num_actors = 1971696 + 1;
    this->num_movies = 1151758 + 1;

    this->actor_to_movies.reserve(this->num_actors);
    this->movie_to_actors.reserve(this->num_movies);

    ifstream edges_input(edgeListFile);
    edges_input.ignore(999, '\n');  // ignore first line
    Node actor, movie;
    while (! edges_input.eof()) {
        if (edges_input.peek() < 0 or edges_input.peek() == '\n') break;
        edges_input >> actor;
        edges_input.ignore(1, ',');   // ignore ,
        edges_input >> movie;
        edges_input.ignore(1, '\n');

        actor_to_movies[actor].push_back(movie);
        movie_to_actors[movie].push_back(actor);
    }
    edges_input.close();
}

/**
 * Shortest path between node a and b
 * @param a an actor
 * @param b another actor
 * @return shortest (co-working) path between provided actors
 */
int64_t DistCalculator::dist(Node a, Node b) const
{
    vector<int64_t> actor_distance(this->num_actors, numeric_limits<int64_t>::max());
    vector<bool> movie_visited(this->num_movies, false);
    queue<Node> actors_queue;

    actors_queue.push(a);
    actor_distance[a] = 0;

    while (not actors_queue.empty()) {
        Node curr_actor = actors_queue.front(); actors_queue.pop();
        if (curr_actor == b) return actor_distance[curr_actor];

        for (auto& mov : actor_to_movies[curr_actor]) {
            if (movie_visited[mov]) continue;
            movie_visited[mov] = true;

            for (auto& act : movie_to_actors[mov]) {
                if (actor_distance[curr_actor] + 1 < actor_distance[act]) {
                    actor_distance[act] = actor_distance[curr_actor] + 1;
                    actors_queue.push(act);
                }
            }
        }
    }

    return -1;
}

///**
// * Implementation of the Dijkstra shortest-path algorithm
// * @param source
// * @param target
// * @return shortest distance between nodes
// */
//int64_t DistCalculator::dijkstra(Node source, Node target) const {
//    priority_queue<pair<int64_t, Node>> pq;
//    vector<bool> visited(this->num_nodes, false);
//    vector<int64_t> distance(this->num_nodes, numeric_limits<int64_t>::max());
//
//    distance[source] = 0;
//    pq.push(make_pair(0, source));
//    int64_t curr_dist; Node curr_actor;
//    while (! pq.empty()) {
//        auto p = pq.top(); pq.pop();
//        curr_dist = p.first;
//        curr_actor = p.second;
//
//        if (visited[curr_actor]) {
//            cerr << "Trying to visit same node twice... '" << curr_actor << "'" << endl;
//            continue;
//        }
//        visited[curr_actor] = true;
//        if (curr_actor == target) return curr_dist;
//
//        auto it_range = actor_to_actor.equal_range(curr_actor);
//        for (auto it = it_range.first; it != it_range.second; ++it) {
//            Node coworker = it->second;
//            if ((not visited[coworker]) and curr_dist + 1 < distance[coworker]) {
//                distance[coworker] = curr_dist + 1;
//                pq.push(make_pair(distance[coworker], coworker));
//            }
//        }
//    }
//
//    return -1; // No path found
//}

