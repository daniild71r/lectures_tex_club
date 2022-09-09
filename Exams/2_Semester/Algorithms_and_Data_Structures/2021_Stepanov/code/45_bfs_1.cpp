vector <vector <int> > g;
vector <int> dist;
dist.assign(n, inf);
dist[s] = 0;
queue <int> q;
q.push(s);

while(!q.empty()) {
	int v = q.front();
	q.pop();
	for(int to : g[v]) {
		if (dist[to] != inf) continue;
		dist[to] = dist[v] + 1;
		q.push(to);
	}
}