// Лекция 6. Дерево доминаторов

#import "../preamble/template.typ": *
#import "@preview/cetz:0.5.2"

= Дерево доминаторов

#let dom = math.op("dom")
#let idom = math.op("idom")
#let sdom = math.op("sdom")
#let anc = math.attach(math.arrow.r.long, t: box(height: 0.2em, math.bullet))
#let panc = math.attach(math.arrow.r.long, t: box(height: 0.2em, math.plus))

#definition[
  *Граф потока управления (Flow graph)*: $G = (V, E, r)$ -- ориентированный граф, где $r$ -- корень, из $r$ доступны все вершины $v in V$.
]

#definition[
  Пусть $u,w in V$. Тогда $v$ *доминирует* над $w$ ($v dom w$), если $v != w$ и любой путь от $r$ до $w$ содержит $v$.
]

#proposition[
  Если $u dom v$ и $v dom w$, то $u dom w$
]

#proposition[
  Если $u != v$, $u dom w$ и $v dom w$, то $u dom v$ или $v dom u$.
]

#corollary[
  $forall w in V \\ {r} exists! v:$
  + $v dom w$
  + $forall u in V, u dom w: u = v or u dom v$
]

#definition[
  Такая вершина $v$ из предыдущего следствия называется *непосредственным доминатором* $idom(v)$.
]

#definition[
  *Дерево доминаторов* графа потока управления $G = (V, E, r)$ -- это $(V, E_(idom))$, где $E_(idom) := {(idom(w), w) | w in V \\ {r}}$.
]

#note[
  Предполагаем, что в графе только #text(blue)[прямые ребра] и ребра дерева DFS.
]

#definition[
  *Полудоминатор* вершины $w$:
  $ sdom(w) := argmin{timeIn[v] | (v, w) in E - "прямое или дерева DFS"} $
]

#proposition[

  Пусть путь от $sdom(w)$ до $w$ по ребрам дерева DFS выглядит как $sdom(w), v_1, v_2, ..., v_k = w$.

  Пусть $v_i := argmin{timeIn[sdom(v_j)] | j in {1, 2, ..., k}}$, а $u_i := sdom(v_i)$.

  Тогда:
  + Если $timeIn[u_i] >= timeIn[sdom(w)]$, то $idom(w) = sdom(w)$
  + Иначе $idom(w) = idom(v_i)$
]

#note[
  Отменяем предположение про #text(blue)[прямые ребра], теперь в графе могут быть любые ребра.
]

#notation[
  Будем писать, что $v anc w$, если $v$ -- предок $w$, и $v panc w$ если $v$ -- собственный предок $w$.
]

#proposition[
  Пусть $v panc w$. Тогда

  $v "НЕ" dom w <==> exists "путь" (a_0, a_1, a_2, ..., a_k), "т.ч.":$
  + $r anc a_0 panc v panc a_k anc w$;
  + $a_i cancel(anc) w, thick i = 1, 2, ..., k-1$.
  При этом в любом таком пути верно: $timeIn[a_i] > timeIn[a_k], i = 1,2,...,k-1$ 
]
#proof[
  $v "НЕ" dom w <==>$ существует #text(rgb("9e2a2b"))[коричневый] обходной путь
  #cetz.canvas({
    import cetz.draw: *

    // Базовые константы и стили
    let dot-radius = 0.08
    let main-axis-pos = 0.0

    // Вертикальная главная ось (стрелка от u к w)
    line((main-axis-pos, 4.0), (main-axis-pos, -4.0), mark: (end: ">"), name: "axis")

    // Математические метки на оси
    content((main-axis-pos, 4.2), $r$)
    content((main-axis-pos, 1.2), $v$, anchor: "east", padding: 0.1em)
    content((main-axis-pos, -4.3), $w$)

    // Центральная вершина v
    circle((main-axis-pos, 1.2), radius: 0.04, fill: black)

    // --- Правая выделенная траектория (красный путь через hobby) ---
    hobby(
      (main-axis-pos, 3.2),
      (0.8, 3.4),
      (1.8, 3.2),
      (2.3, 2.3),
      (1.5, 1.3),
      (2.1, 0.5),
      (1.7, -0.5),
      (2.0, -1.2),
      (1.5, -2.2),
      (main-axis-pos, -2.3),
      stroke: 1.5pt + rgb("9e2a2b"),
    )

    // --- Явная отрисовка ключевых точек графа и их подписей ---
    // Точка a_0
    circle((0.0, 3.2), radius: dot-radius, fill: rgb("9e2a2b"), stroke: none)
    content((0.0, 3.2), $a_0$, anchor: "south-west", padding: 0.1em)

    // Точка a_1
    circle((0.8, 3.4), radius: dot-radius, fill: rgb("9e2a2b"), stroke: none)
    content((0.8, 3.4), $a_1$, anchor: "south-west", padding: 0.1em)

    // Точка a_2
    circle((1.8, 3.2), radius: dot-radius, fill: rgb("9e2a2b"), stroke: none)
    content((1.8, 3.2), $a_2$, anchor: "south-west", padding: 0.1em)

    // Точка a_3
    circle((2.3, 2.3), radius: dot-radius, fill: rgb("9e2a2b"), stroke: none)
    content((2.3, 2.3), $a_3$, anchor: "south-west", padding: 0.1em)

    // Промежуточные неразмеченные вершины (изгибы пути)
    circle((1.5, 1.3), radius: dot-radius, fill: rgb("9e2a2b"), stroke: none)
    circle((2.1, 0.5), radius: dot-radius, fill: rgb("9e2a2b"), stroke: none)
    circle((1.7, -0.5), radius: dot-radius, fill: rgb("9e2a2b"), stroke: none)
    circle((2.0, -1.2), radius: dot-radius, fill: rgb("9e2a2b"), stroke: none)

    // Точка a_{k-1}
    circle((1.5, -2.2), radius: dot-radius, fill: rgb("9e2a2b"), stroke: none)
    content((1.5, -2.2), $a_(k-1)$, anchor: "north-west", padding: 0.1em)

    // Конечная точка поддерева a_k
    circle((0.0, -2.3), radius: dot-radius, fill: rgb("9e2a2b"), stroke: none)
    content((0.0, -2.3), $a_k$, anchor: "north-east", padding: 0.1em)
  })
]

#definition[
  Пусть $w != r$. Тогда *полудоминатор* вершины $w$: $ sdom(w) := argmin_(a_0 in V) {timeIn[a_0] | exists "путь" (a_0,a_1,a_2,...,a_k=w), "т.ч." \ timeIn[a_i] > timeIn[w], i=1,2,3,...,k-1} $
]

#proposition[
  $sdom(w) panc w$
]
#proof[
  + $timeIn[sdom(w)] < timeIn[w]$, т.к. кандидатом на $a_0$ является родитель $w$.
  + Применяем Утв. 3.14 и получаем, что на минимальном пути из определения $sdom$ $(sdom(w)=a_0,a_1,a_2,...,a_k=w)$ лежит какой-то общий предок $p$ вершин $sdom(w)$ и $w$.
  + Пусть $sdom(w) cancel(panc) w$, тогда:
    - $p != sdom(w)$
    - $p != a_i, i=1,2,3,...,k-1$, т.к. $timeIn[a_i] >^"sdom" timeIn[w] >=^(p anc w) timeIn[p]$
    - $p != w$, иначе $timeIn[sdom(w)] > timeIn[w] = timeIn[p]$ -- противоречие п.1
    Получили противоречие п.2 $=>$ $sdom(w) panc w$. #qedhere
]

#proposition[
  $sdom(w) = argmin{timeIn[v] | v in S_1(w) union S_2(w)}$, где:
  - $S_1(w) := {v | (v,w) - "прямое или дерева DFS"}$
  - $S_2(w) := {sdom(u) | (v,w) - "перекрестное или обратное", timeIn[u] > timeIn[w], u anc v}$
]

#proposition[
  Поиск $idom(w)$ аналогичен поиску $idom$ в Утв. 4.3.
]