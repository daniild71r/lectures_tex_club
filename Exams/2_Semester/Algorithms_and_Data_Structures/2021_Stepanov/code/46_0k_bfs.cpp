vector <int> dist(n, inf)
vector <bool> used(n, false)
dist[s] = 0
q[0].push(s)
for (int d = 0; d <= kn; ++d){
	while(!q[d].empty()){
		int v = q[d].front();
		q[d].pop(); if (used[v]) continue;
		used[v] = true;
		for (edge &e : g[v]) {
			int to = e.to;
			if (dist[to] <= dist[v] + e.w) continue;
			dist[to] = dist[v] + e.w;
			q[dist[to]].push(to);
		}
	}
}