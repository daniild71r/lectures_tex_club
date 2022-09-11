dist.assign(n, inf)
dist[s] = 0
while( есть неиспользованные вершины) {
	v - неисп. вершина с min dist[v]
	раскрываем v : dist[to] = min(dist[to], dist[v] + cost(v, to))
	помечаем v использованной
}