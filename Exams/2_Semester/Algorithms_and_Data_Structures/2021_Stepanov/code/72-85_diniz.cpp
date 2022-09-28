int findMaxFlow() {
    int maxFlow = 0;
    while (true) {
        bfs(); // строим слоистую сеть
        if (noPath(s, t)) break; // если t недостижимо из s то выходим из алгоритма
        flow = dfs(s, inf);
        while (flow > 0) { // иначе пока поток проталкивается
            maxFlow += flow; // добавляем его к общему потоку
            flow = dfs(s, inf); // пытаемся протолкнуть поток по другому пути
        }
    }
    return maxFlow;
}

