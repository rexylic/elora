// Theorem Environments

#import "@preview/ctheorems:1.1.3": *

#let ennea(it) = color.hsl(it * 40deg, 100%, 95%)

#let thm = thmbox(
  "thm",
  "Theorem",
  base_level: 0,
  fill: ennea(0),
  supplement: smallcaps("Thm"),
)
#let lem = thmbox(
  "thm",
  "Lemma",
  base_level: 0,
  fill: ennea(1),
  supplement: smallcaps("Lem"),
)
#let cor = thmbox(
  "thm",
  "Corollary",
  base_level: 0,
  fill: ennea(2),
  supplement: smallcaps("Cor"),
)
#let prop = thmbox(
  "prop",
  "Proposition",
  base_level: 0,
  fill: ennea(3),
  supplement: smallcaps("Prop"),
)
#let rmk = thmbox(
  "prop",
  "Remark",
  base_level: 0,
  fill: ennea(4),
)
#let conj = thmbox(
  "conj",
  "Conjecture",
  base_level: 0,
  fill: ennea(8),
)
#let def = thmbox(
  "def",
  "Definition",
  base_level: 0,
  fill: ennea(6),
  supplement: smallcaps("Def"),
)
#let ques = thmbox(
  "que",
  "Question",
  base_level: 0,
  fill: ennea(5),
)
#let part = thmbox(
  "part",
  "Part",
  base: "que",
  fill: ennea(7),
).with(numbering: "1a")
#let subpart = thmbox(
  "subpart",
  "Subpart",
  base: "part",
  fill: ennea(8),
).with(numbering: "1ai")
#let pf = thmproof(
  "pf",
  "Proof",
)
#let question(..args) = {
  pagebreak(weak: true)
  ques(..args)
}
