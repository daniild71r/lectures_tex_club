void make_set(int v) {
	parent[v] = v;
	rank[v] = 0;
}
 
int find_set(int v) {
	if (parent[v] == -1) return v;
	return parent[v] = find_set(parent[v]);
}
 
void union_sets(int a, int b) {
	a = find_set(a);
	b = find_set(b);
	if (a != b) {
		if (rank[a] < rank[b])
			swap (a, b);
		parent[b] = a;
		if (rank[a] == rank[b]) ++rank[a];
	}
}

sort(edges.begin(), edges.end(), cmp)
\\edges -- массив ребер, сортируем его в порядке неубывания длин ребер
for (auto e : edges) {
	if (find_set(e.u) != find_set(e.v)) {
		union_sets(e.u, e.v);
	}
}
