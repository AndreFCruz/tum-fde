#include <string>
#include <vector>

class DistCalculator {
public:
    using Node = uint64_t;
    DistCalculator(std::string edgeListFile);
    int64_t dist(Node a, Node b) const;

private:
    Node num_actors;
    Node num_movies;

    std::vector< std::vector<Node> > actor_to_movies;
    std::vector< std::vector<Node> > movie_to_actors;
};
