#include "../data_structures/Graph.h"
#include "stack"
using namespace std;

template <typename T>
vector<vector<T>> sccTarjan(Graph<T> *g)
{
    vector<vector<T>> res;
    for (Vertex<T> *v : g->getVertexSet())
    {
        v->setVisited(false);
        v->setLow(-1);
        v->setLow(-1);
    }

    stack<Vertex<T> *> s;
    int time = 0;
    for (Vertex<T> *v : g->getVertexSet())
    {
        if (v->getNum() == -1)
        {
            dfsT(v, res, s, time);
        }
    }
    return res;
}

template <typename T>
void dfsT(Vertex<T> *v, vector<vector<T>> &res, stack<Vertex<T> *> &s, int &time)
{
    v->setNum(time);
    v->setLow(time);
    time++;
    s.push(v);
    v->setProcessing(true);

    for (Edge<T> *e : v->getAdj())
    {
        Vertex<T> *u = e->getDest();
        if (u->getNum() == -1)
        {
            dfsT(u, res, s, time);
            v->setLow(min(v->getLow(), u->getLow()));
        }
        else if (u->isProcessing())
        {
            v->setLow(min(v->getLow(), u->getNum()));
        }
    }
    if (v->getLow() == v->getNum())
    {
        vector<T> component;
        Vertex<T> *w;
        do
        {
            w = s.top();
            s.pop();
            w->setProcessing(false);
            component.push_back(w->getInfo());
        } while (w != v);
        res.push_back(component);
    }
}