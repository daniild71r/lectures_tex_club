// Лекция 4. Вершинная двусвязность, КСС

#import "../preamble/template.typ": *

#proposition[
  Пусть $e_1$ и $e_2$ -- ребра дерева DFS, принадлежащие одной компоненте вершинной двусвязности. Тогда все ребра пути в дереве DFS, соединяющем $e_1$ и $e_2$, также лежат в этой компоненте.
]
#proof[
  Рассмотрим 2 случая:
  + $e_1$ и $e_2$ в одном поддереве
  + $e_1$ и $e_2$ в разных поддеревьях
]

#corollary[
  Ребра дерева DFS, лежащие в одной компоненте вершинной двусвязности, образуют связное подвешенное дерево, у корня которого ровно 1 ребенок.
]

#proposition[
  Ребро $(u, v)$ дерева DFS, где $u$ -- родитель и $v$ -- ребенок, является корневым в своей компоненте вершинной двусвязности $<=>$ $upTime[v] >= timeIn[u]$.
]

#corollary[
  Алгоритм поиска компонент вершинной двусвязности:
  ```cpp
  vector<int> timeIn, timeOut, upTime;
  vector<EDFSColor> colors;
  stack<Edge> ST;
  vector<vector<Edge>> graph;

  void dfs(int v, int parentId) {
      colors[v] = EDFS_GRAY;
      timeIn[v] = currentTime++;
      upTime[v] = INF;

      for (Edge e : graph[v]) {
          if (e.id == parentId)
              continue;
          int nv = e.finish;
          if (colors[nv] == EDFS_WHITE) {
              ST.push(e);
              dfs(nv, e.id);
              upTime[v] = min(upTime[v], upTime[nv]);
              if (upTime[nv] >= timeIn[v]) {
                  vector<Edge> comp;
                  do {
                      comp.push_back(ST.top());
                      ST.pop();
                  } while (comp.back().id != e.id);
                  // сохранить comp как компоненту вершинной двусвязности
              }
          } else if (colors[nv] == EDFS_GRAY) {
              upTime[v] = min(upTime[v], timeIn[nv]);
              ST.push(e);
          }
      }
      colors[v] = EDFS_BLACK;
      timeOut[v] = currentTime++;
  }
  ```
]

== Ориентированные графы

#note[
  Далее рассматриваем *ориентированный* граф $G = (V, E)$
]

#proposition[
  Пусть $timeIn[u] < timeIn[v]$. Тогда любой путь от $u$ до $v$ содержит какого-то общего предка $u$ и $v$ в дереве DFS.
]

#definition[
  Вершины $u$ и $v$ *сильно связаны*, если $exists$ путь от $u$ до $v$ и от $v$ до $u$.
]

#proposition[
  Сильная связность -- отношение эквивалентности на вершинах.
]

#definition[
  *Компонента сильной связности (КСС)* -- класс эквивалентности относительно сильной связности.
]

#proposition[
  Вершины одной КСС образуют в дереве DFS связное подвешенное дерево.
]

#definition[
  Введем новый цвет вершины -- #text(purple)[фиолетовый (EDFS_PURPLE)].
]

#definition[
  Новое определение $upTime$:
  $
    upTime[v] := min_(u,w in V) {timeIn[w] | (u,w) - "обратное или перекрестное ребро", \ u - "потомок" v "в дереве DFS", w - "не фиолетовая при обработке" u "DFS-ом"}
  $
]

#note[
  Код DFS для поиска КСС:
  ```cpp
    void dfs(int v) {
        colors[v] = EDFS_GRAY;
        timeIn, timeOut = ...
        upTime = ...
        ST.push(v);
        for (auto e : graph[v]) {
            int nv = e.finish;
            if (colors[nv] == EDFS_WHITE) {
                dfs(nv);
                upTime[v] = min(upTime[v], upTime[nv]);
            } else if (colors[nv] != EDFS_PURPLE) {
                upTime[v] = min(upTime[v], timeIn[nv]);
            }
        }
        colors[v] = EDFS_BLACK;

        if (v - КОРЕНЬ СВОЕЙ КСС) { // проверяем через следующее утверждение
            do {
                int u = ST.top(); ST.pop();
                comp.push_back(u);
                colors[u] = EDFS_PURPLE;
            } while (comp.back() != v);
        }
    }
  ```
]

#proposition[
  $v$ -- корень КСС $<=>$ $upTime[v] >= timeIn[v]$.
]

#proposition[
  Алгоритм Косарайю для поиска КСС:
  + dfs1 находит топологическую сортировку по возрастанию timeOut: $v_1, v_2, ..., v_n$.
  + Развернуть все ребра графа
  + Запускаем dfs2 от каждой вершины по убыванию timeOut: $v_n, v_(n-1), ..., v_1$
  Тогда каждый запуск dfs2 обойдет все вершины ровно одной КСС и только их.
]

#note[
  Задачу 2-SAT можно решить за линейное время сведением к задаче о нахождения КСС. 
]