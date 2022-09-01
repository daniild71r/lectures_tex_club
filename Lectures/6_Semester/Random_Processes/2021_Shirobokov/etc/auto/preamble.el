(TeX-add-style-hook
 "preamble"
 (lambda ()
   (TeX-run-style-hooks
    "xifthen"
    "multicol"
    "amsmath"
    "amssymb"
    "tikz"
    "graphicx"
    "placeins")
   (TeX-add-symbols
    '("cent" 1)
    '("tosk" 1)
    '("LIM" 1)
    '("ket" 1)
    '("bra" 1)
    '("To" 1)
    '("fig" 2)
    '("figL" 3)
    '("question" 2)
    '("lecture" 2)
    "os"
    "us"
    "oL"
    "uL"
    "dst"
    "GCD"
    "IID"
    "cov"
    "Real"
    "Img")
   (LaTeX-add-labels
    "fig:#3")
   (LaTeX-add-environments
    "theorem"
    "Prop"
    "lemma"
    "sug"
    "Note"
    "Def"
    "corollary"
    "problem"))
 :latex)

