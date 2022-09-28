#include <iostream>
#include <vector>

class FenwickTree {
private:
    std::vector<int> T;

    int pref(int r)  {
        int result = 0;
        while (r >= 0) {
            result += T[r];
            r = (int)f(r) - 1;
        }
        return result;
    }

    static unsigned int f(unsigned int i) {
        return i & (i + 1);
    }
    static unsigned int g(unsigned int i) {
        return i | (i + 1);
    }
public:
    FenwickTree(size_t n) {
        T.assign(n, 0);
    }
    FenwickTree(std::vector<int>& a) : FenwickTree(a.size()) {
        for (size_t i = 0; i < a.size(); i++)
            update(i, a[i]);
    }
    ~FenwickTree()=default;

    void update(int pos, int val) {
        while(pos < T.size()) {
            T[pos] += val;
            pos = (int)g(pos);
        }
    }
    int sum(int l, int r) {
        if (r < l) return 0;
        if (l == 0) return pref(r);
        return pref(r) - pref(l-1);
    }
};