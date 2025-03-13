
#include <queue>  

template <class T>
void unweightedShortestPath(Graph<T> * g, const int &origin) {
    for (Vertex<T> *v : g->getVertexSet() ) {
        v->setVisited(false);
        v->setPath(nullptr);
        v->setDist(INF);
    }

    std::queue<Vertex<T> *> q;
    Vertex<T>* src= g->findVertex(origin);
    src->setVisited(true);
    src->setPath(nullptr);
    src->setDist(0);

    q.push(src);

    while (!q.empty()) {
        Vertex<T> *v = q.front();
        q.pop();
        for (Edge<T> *e : v->getAdj()) {
            Vertex<T> *u = e->getDest();
            if (u->isVisited() == false) {
                u->setVisited(true);
                u->setPath(e);
                u->setDist(v->getDist()+1);
                q.push(u);
            }
        }
    }
}

template <class T>
static std::vector<T> getPath(Graph<T> * g, const int &origin, const int &dest) {
    std::vector<T> res;

    Vertex<T> *v = g->findVertex(dest);

        while (v->getInfo() != origin) {
            res.push_back(v->getInfo());
            v=v->getPath()->getOrig();
        }
    res.push_back(origin);

    std::reverse(res.begin(), res.end());
    return res;
}