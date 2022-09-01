used.assign(n, false);
for (int s = 0; s < n; ++s)
    if (!used[s])
        dfs(s);
// p - список вершин в порядке убывания tout
// можно получить его например добавив в конец dfs строчку
// p.pushback(v)
// (только потом надо реверснуть весь массив)
used.assign(n, false);
for (int v: p)
    if (!used[s])
        reversed_dfs(s); // dfs в графе, где все ребра инвертированы
// каждое дерево обхода обратного dfs будет являться КСС
