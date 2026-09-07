// Шаблон для лекций на Typst (LTC MIPT style)

#import "@preview/ctheorems:1.1.3": *

#let project(
  title: "",
  course-name: "",
  semester: "",
  lecturer: "",
  author: "",
  date: "",
  vk-link: "",
  github-link: "",
  logo: none,
  body,
) = {
  // Настройка документа
  set document(title: title, author: author)

  // Настройка страницы
  set page(
    paper: "a4",
    margin: (top: 25mm, bottom: 30mm, left: 20mm, right: 20mm),
    header: context {
      let page-num = counter(page).get().first()

      // Не показывать хедер на первой странице (титульнике)
      if page-num == 1 { return }

      block(width: 100%, inset: (bottom: 8pt), stroke: (bottom: 0.4pt + gray))[
        #grid(
          columns: (1fr, auto),
          align(left)[#text(size: 9pt, fill: rgb("#333333"))[#course-name]],
          align(right)[#text(size: 9pt, fill: rgb("#0066cc"))[#link(label("intro"))[Назад к содержанию]]],
        )
      ]
    },
    footer: context {
      let page-num = counter(page).get().first()

      // Не показывать футер на первой странице (титульнике)
      if page-num == 1 { return }

      block(width: 100%, inset: (top: 8pt), stroke: (top: 0.4pt + gray))[
        #grid(
          columns: (1fr, auto),
          align(left)[#text(size: 9pt, fill: rgb("#555555"))[ФПМИ МФТИ, #date]],
          align(right)[#text(size: 9pt, fill: rgb("#333333"))[#counter(page).display("1")]],
        )
      ]
    },
  )

  // Настройка шрифта и текста
  set text(
    font: "Liberation Serif",
    size: 12pt,
    lang: "ru",
  )

  // Межстрочный интервал
  set par(
    justify: true,
    leading: 0.8em,
    first-line-indent: 15pt,
  )

  // Настройка списков
  // set list(marker: ([#text(fill: rgb("#0066cc"))[‣]],))
  set enum(indent: 10pt)

  // Настройка заголовков
  set heading(numbering: "1.1")

  show: thmrules.with(qed-symbol: $square$)

  // show heading: it => {
  //   set text(font: "Liberation Sans", weight: "bold")
  //   if it.level == 1 {
  //     block(
  //       width: 100%,
  //       above: 2em,
  //       below: 1em,
  //       breakable: false,
  //     )[
  //       #text(size: 18pt, fill: rgb("#111111"))[#it]
  //     ]
  //   } else if it.level == 2 {
  //     block(
  //       above: 1.5em,
  //       below: 0.8em,
  //       breakable: false,
  //     )[
  //       #text(size: 14pt, fill: rgb("#222222"))[#it]
  //     ]
  //   } else {
  //     block(
  //       above: 1.2em,
  //       below: 0.6em,
  //       breakable: false,
  //     )[
  //       #text(size: 12pt, fill: rgb("#333333"))[#it]
  //     ]
  //   }
  // }

  // --- ТИТУЛЬНЫЙ ЛИСТ ---
  align(center)[
    #text(
      size: 13pt,
      weight: "bold",
    )[Московский физико-технический институт \ Физтех-школа прикладной математики и информатики]

    #v(16.5em)
    #text(size: 22pt, weight: "bold", fill: rgb("#1a1a1a"))[#title]

    #text(size: 14pt, weight: "medium")[#semester СЕМЕСТР]

    #text(size: 12pt)[Лектор: #emph[#lecturer]]

    #if logo != none {
      image(logo, width: 40%)
    }

    #align(right)[
      Автор: #link(vk-link)[#underline(author)] \
      #link(github-link)[_Проект на GitHub_]
    ]

    #v(1fr)
    #text(size: 11pt)[#date]
  ]

  pagebreak()

  // Содержание
  align(center)[
    #heading(level: 1, numbering: none, outlined: false)[Содержание]
    #label("intro")
  ]

  // Настройка отступа первой строки в TOC (в Typst это делается через кастомный аутлайн)
  outline(title: none, depth: 3, indent: 1.5em)

  pagebreak()

  body
}

// --- СТИЛИЗОВАННЫЕ ОКРУЖЕНИЯ (Теоремы, леммы, определения и т.д.) ---

// --- ТЕОРЕМЫ ---
#let theorem = thmbox("theorem", "Теорема", base_level: 1, inset: (bottom: 0em))
#let lemma = thmbox("lemma", "Лемма", base_level: 1, inset: (bottom: 0em))
#let proposition = thmbox("proposition", "Утверждение", base_level: 1, inset: (bottom: 0em))

// --- ЗАДАЧИ ---
#let exercise = thmbox("exercise", "Упражнение", inset: (bottom: 0em)).with(numbering: none)
#let problem = thmbox("problem", "Задача", inset: (bottom: 0em)).with(numbering: none)

// --- ОПРЕДЕЛЕНИЯ ---
#let definition = thmbox("definition", "Определение", base_level: 1, inset: (bottom: 0em))
#let notation = thmbox("notation", "Обозначение", inset: (bottom: 0em)).with(numbering: none)
#let invariant = thmbox("invariant", "Инвариант")

// Без нумерации
#let corollary = thmbox("corollary", "Следствие", inset: (bottom: 0em)).with(numbering: none)
#let note = thmbox("note", "Замечание", inset: (bottom: 0em)).with(numbering: none)
#let reminder = thmplain("reminder", "Напоминание").with(numbering: none)
#let example = thmplain("example", "Пример").with(numbering: none)
#let joke = thmplain("joke", "Анекдот").with(numbering: none)

// --- ЗАМЕЧАНИЯ И ДОКАЗАТЕЛЬСТВА ---
#let solution = thmproof("solution", "Решение")
#let proof = thmproof("proof", "Доказательство")

// --- МАТЕМАТИЧЕСКИЕ МАКРОСЫ ---
#let sgn = math.op("sgn")
#let Ker = math.op("Ker")
#let Im = math.op("Im")
#let Re = math.op("Re")
#let mex = math.op("mex", limits: true)
#let argmin = math.op("argmin", limits: true)
#let timeIn = math.op("timeIn")
#let timeOut = math.op("timeOut")
#let timeSeg = math.op("timeSeg")
#let upTime = math.op("upTime")
#let dp = math.op("dp")

#let nim = math.class("normal", math.ast)

#let N = $NN$
#let Z = $ZZ$
#let Q = $QQ$
#let R = $RR$
#let Cm = $CC$
#let F = $FF$
#let id = $upright("id")$

#let Lra = $<=>$
#let lra = $<->$
#let Ra = $=>$
#let ra = $->$
#let La = $arrow.l.double$
#let la = $<-$
#let emb = $arrow.r.hook$

// Система уравнений (упрощенная)
#let System(body) = math.cases(body)
