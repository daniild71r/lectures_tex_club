#include <unordered_map>
struct Tree {
    static const int n = INT_MAX / 2;
    std::unordered_map<int, int> t;

    int change( int v, int vl, int vr, int i, int x ) { // [vl, vr)
        if (i < vl || vr <= i)
            return t[v];
        if (vr - vl == 1)
            return t[v] = x;
        int vm = (vl + vr) / 2;
        t[v] = change(2 * v, vl, vm, i, x) + change(2 * v + 1, vm, vr, i, x)
        return t[v];
    }

    void change( int i, int x ) {
        change(1, 0, n, i, x);
    }

    int get( int v, int vl, int vr, int l, int r ) { // [vl, vr) [l, r)
        if (t.find(v) == t.end()) { //если эти вершины не были созданы
            return 0; //сумма на этом отрезке 0
        }
        if (r <= vl || vr <= l)
            return 0;
        if (l <= vl && vr <= r)
            return t[v];
        int vm = (vl + vr) / 2;
        return get(2 * v, vl, vm, l, r) + get(2 * v + 1, vm, vr, l, r);
    }

    int get( int l, int r ) { // [l, r)
        return get(1, 0, n, l, r);
    }
};