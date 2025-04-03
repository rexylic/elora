// Package entry point

#import "@preview/lovelace:0.3.0": *
#import "alias.typ": *
#import "box.typ": *
#import "draw.typ": *
#import "sym.typ": *
// #import "thm.typ": *
#import "utils.typ": *

#let title-page(
  abstract: none,
  author: none,
  title: none,
  date: datetime.today(),
) = {
  set page(margin: 15%)
  set page(footer: h(1fr) + date.display() + h(1fr)) if date != none
  set par(justify: false)
  place(center + horizon)[
    #context {
      text(
        coalesce(title, document.title),
        size: 1em + 10pt,
        weight: 600,
      )
      columnar(document.author)
    }
    #v(20%)
    #if abstract != none {
      align(center)[
        #smallcaps("Abstract")
        #parbreak()
        #text(1em - 1pt, abstract)
      ]
    }
  ]
  pagebreak(weak: true)
}

#let toc = {
  set page(numbering: "i", margin: 15%)
  counter(page).update(1)
  show outline.entry.where(level: 1): set block(above: 1em)
  outline()
  pagebreak(weak: true)
}

#let main(
  doc,
  alpha-numbering: false,
) = {
  // par format
  set par(
    first-line-indent: 2em,
    spacing: 1.2em,
    justify: true,
  )

  // set body
  set page(numbering: "1")
  counter(page).update(1)

  // numbering
  set heading(numbering: "1.1.1.") if not alpha-numbering
  set heading(numbering: "1ai") if alpha-numbering

  // styling
  set block(breakable: true)
  set enum(indent: 1em)
  set list(indent: 1em)
  show figure: set align(center)
  show figure.caption: set text(1em - 2pt, style: "italic")
  show heading: set block(above: 2em, below: 1.2em)
  show table: set align(center)
  show figure: set block(breakable: true)
  show math.equation: set block(breakable: true)

  // referencing boxes
  show ref: it => {
    let el = it.element
    if (
      el != none and el.func() == figure and el.body.children.at(1).value != []
    ) {
      link(
        el.location(),
        el.body.children.at(1).value,
      )
    } else {
      it
    }
  }

  // content
  doc
}
