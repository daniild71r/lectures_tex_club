// процедура проверки, что u - предок v
bool ancestor(int u, int v) {
  // вспомним, как мы это находили при помощи DFS
  // и порядка, в котором мы обрабатывали вершины:
  return (tin[u] <= tin[v]) and (tout[u] >= tout[v]);
}