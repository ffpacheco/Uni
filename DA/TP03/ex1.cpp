template <typename T>
std::vector<Vertex<T> *> prim(Graph<T> *g)
{

    std::vector<Vertex<T> *> res;

    MutablePriorityQueue<Vertex<T>> q;
    for (Vertex<T> *v : g->getVertexSet())
    {
        v->setVisited(false);
        v->setDist(std::numeric_limits<double>::infinity());
        v->setPath(nullptr);
        q.insert(v);
    }

    Vertex<T> *start = g->getVertexSet()[0];
    start->setDist(0);

    while (!q.empty())
    {
        Vertex<T> *u = q.extractMin();
        u->setVisited(true);
        res.push_back(u);

        for (Edge<T> *e : u->getAdj())
        {
            Vertex<T> *v = e->getDest();
            double weight = e->getWeight();

            if (v->isVisited() == false && weight < v->getDist())
            {
                v->setDist(weight);
                v->setPath(e);
                q.decreaseKey(v);
            }
        }
    }
    return res;
}