struct edge{
	int from, to;
}

vector <edge> edges;
\\edges[2k] и edges[2k + 1] -- две половинки одного неориентированного ребра
\\ удобно получать вторую половинку ребра, беря ind^1
vector <bool> used \\used[e] -- использовано ли ребро
vector <int> ptr; \\"указатель" на следующее неиспользованное ребро
vector <vector <int> > g; \\наш граф в виде списков смежности, но уже с ориентированными ребрами

void euler(int v) {
	while(ptr[v] != g[v].size()) {
		int e = g[v][ptr[v]]; \\g[v] -- список номеров ребер
		if (used[e]){++ptr[v]; continue;}
		int u = edges[e].to;
		used[e] = used[e^1] = true;
		++ptr[v];
		euler(u);
	}
	cout << v << " ";
}