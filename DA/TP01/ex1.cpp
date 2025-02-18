#include <iostream>
#include "../data_structures/Graph.h"

using namespace std;

/****************** DFS ********************/
/*
 * Performs a depth-first search (dfs) in a graph from the source node.
 * Returns a vector with the contents of the vertices by dfs order.
 */
template <class T>
vector<T> dfs(Graph<T> *g, const T &source)
{
    vector<int> res;

    Vertex<T> *start = g->findVertex(source);
    if (start == nullptr)
    {
        return res;
    }

    for (auto v : g->getVertexSet())
    {
        v->setVisited(false);
    }

    dfsVisit(start, res);

    return res;
}

/*
 * Auxiliary function that visits a vertex (v) and its adjacent, recursively.
 * Updates a parameter with the list of visited node contents.
 */
template <class T>
void dfsVisit(Vertex<T> *v, vector<T> &res)
{
    v->setVisited(true);
    res.push_back(v->getInfo());

    for (Edge<T> *e : v->getAdj())
    {
        Vertex<T> *u = e->getDest();
        if (u->isVisited() == false)
        {
            dfsVisit(u, res);
        }
    }
}

/****************** BFS ********************/
/*
 * Performs a breadth-first search (bfs) in a graph, starting
 * from the vertex with the given source contents (source).
 * Returns a vector with the contents of the vertices by bfs order.
 */
template <typename T>

vector<T> bfs(Graph<T> *g, const T &source)
{

    vector<int> res;

    Vertex<T> *start = g->findVertex(source);
    if (start == nullptr)
        return res;

    for (auto v : g->getVertexSet())
    {
        v->setVisited(false);
    }

    start->setVisited(true);

    queue<Vertex<T> *> q;
    q.push(start);

    while (!q.empty())
    {
        Vertex<T> *v = q.front();
        q.pop();
        res.push_back(v->getInfo());

        for (Edge<T> *e : v->getAdj())
        {
            Vertex<T> *u = e->getDest();
            if (u->isVisited() == false)
            {
                u->setVisited(true);
                q.push(u);
            }
        }
    }

    return res;
}