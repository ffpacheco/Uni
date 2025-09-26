using namespace std;

template <class T>
bool relax(Edge<T> *edge)
{ // d[u] + w(u,v) < d[v]
    Vertex<T> *origin = edge->getOrig();
    Vertex<T> *dest = edge->getDest();
    if (dest->getDist() > origin->getDist() + edge->getWeight())
    {
        dest->setDist(origin->getDist() + edge->getWeight());
        dest->setPath(edge);
        return true;
    }
    return false;
}

template <class T>
void dijkstra(Graph<T> *g, const int &origin)
{
    MutablePriorityQueue<Vertex<T>> q;
    for (Vertex<T> *v : g->getVertexSet())
    {
        v->setVisited(false);
        v->setDist(INF);
        v->setPath(nullptr);
        q.insert(v);
    }
    Vertex<T> *src = g->findVertex(origin);
    src->setVisited(true);
    src->setDist(0);
    q.decreaseKey(src);

    while (!q.empty())
    {
        Vertex<T> *v = q.extractMin();
        for (Edge<T> *e : v->getAdj())
        {
            if (relax(e))
                q.decreaseKey(e->getDest());
        }
    }
}

template <class T>
static std::vector<T> getPath(Graph<T> *g, const int &origin, const int &dest)
{
    std::vector<T> res;

    Vertex<T> *v = g->findVertex(dest);

    while (v->getInfo() != origin)
    {
        res.push_back(v->getInfo());
        v = v->getPath()->getOrig();
    }
    res.push_back(origin);
    reverse(res.begin(), res.end());
    return res;
}
