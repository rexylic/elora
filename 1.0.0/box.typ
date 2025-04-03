// Theorem boxes

#import "@preview/showybox:2.0.4": showybox as box
#import "utils.typ": coalesce

#let colored-box(..args, color: black) = box(
  frame: (
    title-color: white,
    border-color: color,
    footer-color: white,
    radius: 0pt,
    thickness: (left: 1.2pt),
    title-inset: (left: 1em, right: 0.3em, top: 0.5em, bottom: 0.7em),
    body-inset: (left: 1em, right: 0.3em, top: 0.5em, bottom: 0.5em),
    footer-inset: (left: 1em, right: 0.3em, top: 0.7em, bottom: 0.5em),
  ),
  title-style: (
    color: color,
    weight: "medium",
    sep-thickness: 0pt,
  ),
  footer-style: (
    color: color,
    sep-thickness: 0pt,
    align: end,
  ),
  spacing: 0pt,
  breakable: true,
  ..args,
)

#let color-from(i) = if i < 0 {
  luma(40%)
} else {
  oklch(60%, 35%, i * 36deg)
}

#let mybox(
  ..args,
  index: 0,
  name: "Theorem",
  ident: "thm",
  numbering: "1.1",
  qed: false,
) = {
  let argv = args.pos()
  let argc = argv.len()
  if argc == 0 or argc > 3 { panic("invalid number of positional arguments passed to mybox") }
  let body = if argc == 1 { argv.at(0) } else { argv.at(1) }
  if qed { body += h(1fr) + math.qed }
  let title-base = if numbering == none {
    name
  } else {
    name + " " + context counter(figure.where(kind: ident)).display(numbering)
  }
  let title = if argc == 1 {
    title-base
  } else if qed {
    argv.at(0)
  } else {
    title-base + h(1em) + argv.at(0)
  }
  let box-named-args = if argc > 2 {
    (title: title, footer: argv.at(2))
  } else {
    (title: title)
  }
  let meta = if argc > 1 and argv.at(0) != [] {
    argv.at(0)
  } else []
  figure(
    kind: ident,
    numbering: numbering,
    supplement: name,
    [
      #metadata(meta)
      #colored-box(
        color: color-from(index),
        body,
        ..box-named-args,
      )
    ],
  )
}

#let thm = mybox.with(name: "Theorem", ident: "thm", index: 6)
#let lem = mybox.with(name: "Lemma", ident: "thm", index: 2)
#let cor = mybox.with(name: "Corollary", ident: "thm", index: 3)
#let def = mybox.with(name: "Definition", ident: "def", index: 4)
#let axm = mybox.with(name: "Axiom", ident: "axm", index: 5)
#let conj = mybox.with(name: "Conjecture", ident: "axm", index: 1)
#let prop = mybox.with(name: "Proposition", ident: "thm", index: 7)
#let rmk = mybox.with(name: "Remark", ident: "eg", index: 8, numbering: none)
#let eg = mybox.with(name: "Example", ident: "eg", index: 9, numbering: none)
#let pf = mybox.with(name: "Proof", ident: "pf", index: -1, numbering: none, qed: true)

#let quest(..args) = {
  pagebreak(weak: true)
  mybox(name: "Question", ident: "q", index: 299, ..args)
}
