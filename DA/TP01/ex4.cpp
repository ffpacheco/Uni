#include "../data_structures/Graph.h"
#include "stack"
using namespace std;

template <typename T>
void dfs1(Vertex<T> *v, stack<T> &s)
{
    v->setVisited(true);
    for (Edge<T> *e : v->getAdj())
    {
        Vertex<T> *u = e->getDest();
        if (u->isVisited() == false)
        {
            dfs1(u, s);
        }
    }
    s.push(v->getInfo());
}
template <typename T>
void dfsScc(Vertex<T> *v, vector<T> &component)
{
    v->setVisited(true);
    component.push_back(v->getInfo());

    for (Edge<T> *e : v->getAdj())
    {
        Vertex<T> *u = e->getDest();
        if (u->isVisited() == false)
        {
            dfsScc(u, component);
        }
    }
}

// Kosaraju-Sharir algorithm
template <typename T>
vector<vector<T>> SCCkosaraju(Graph<T> *g)
{
    vector<vector<T>> sccs;

    for (Vertex<T> *v : g->getVertexSet())
    {
        v->setVisited(false);
    }

    stack<T> ordered;

    for (Vertex<T> *v : g->getVertexSet())
    {
        if (v->isVisited() == false)
        {
            dfs1(v, ordered);
        }
    }

    Graph<T> *transposed = new Graph<T>();

    for (Vertex<T> *v : g->getVertexSet())
    {
        transposed->addVertex(v->getInfo());
    }

    for (Vertex<T> *v : g->getVertexSet())
    {
        for (Edge<T> *e : v->getAdj())
        {
            transposed->addEdge(e->getDest()->getInfo(), v->getInfo(), e->getWeight());
        }
    }

    for (Vertex<T> *v : transposed->getVertexSet())
    {
        v->setVisited(false);
    }

    while (!ordered.empty())
    {
        auto vInfo = ordered.top();
        ordered.pop();
        Vertex<T> *v = transposed->findVertex(vInfo);

        if (v->isVisited() == false)
        {
            vector<T> component;
            dfsScc(v, component);
            sccs.push_back(component);
        }
    }

    return sccs;
}
