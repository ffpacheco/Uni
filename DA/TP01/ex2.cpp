#include <iostream>
#include "../data_structures/Graph.h"
#include <unordered_map>
using namespace std;

/*                                                                          \
 * Performs a topological sorting of the vertices of a graph.               \
 * Returns a vector with the contents of the vertices by topological order. \
 * If the graph has cycles, returns an empty vector.                        \
 */                                                                         \
#include<iostream>
#include <vector>
#include "../data_structures/Graph.h"

using namespace std;

template <typename T>
bool dfs(Vertex<T> *v, vector<T> &result, unordered_map<Vertex<T> *, bool> &visited, unordered_map<Vertex<T> *, bool> &inStack)
{

    if (inStack[v])
    {
        return false;
    }

    if (visited[v])
    {
        return true;
    }

    inStack[v] = true;

    for (Edge<T> *edge : v->getAdj())
    {
        Vertex<T> *child = edge->getDest();

        if (!dfs(child, result, visited, inStack)) // cycle
        { 
            return false;
        }
    }

    inStack[v] = false;
    visited[v] = true;

    result.push_back(v->getInfo());
    return true;
}

template <typename T>
vector<T> topsort(Graph<T> *g)
{
    vector<T> result;
    unordered_map<Vertex<T> *, bool> visited;
    unordered_map<Vertex<T> *, bool> inStack;

    for (Vertex<T> *v : g->getVertexSet())
    {
        if (!visited[v])
        {
            if (!dfs(v, result, visited, inStack)) // cycle
            { 
                return {};
            }
        }
    }

    reverse(result.begin(), result.end());
    return result;
}
