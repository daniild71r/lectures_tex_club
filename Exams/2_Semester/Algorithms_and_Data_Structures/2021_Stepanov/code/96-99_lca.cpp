int lca(int u, int v) {
  if (ancestor(u, v)) return u;
  for(int k = kmax - 1; k>=0; --k) {
    // пытаемся прыгнуть вверх, не перескочив общего предка
    if (!ancestor(shifts[k][u], v)) u = shifts[k][u];
  }
  // мы всегда находимся ниже, чем LCA, но так как последний k = 0, то
  // мы находимся ниже только на один слой, поэтому достаточно вернуть parent'а
  return parent[u];
}