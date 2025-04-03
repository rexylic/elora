// Utilities

#let coalesce(..args) = {
  for arg in args.pos() {
    if arg != none {
      return arg
    }
  }
  return none
}

#let columnar(
  l,
  col-count: 3,
  col-gutter: 2em,
  row-gutter: 1em,
) = {
  let count = l.len()
  if count == 0 {
    return []
  }
  let row-count = calc.div-euclid(count, col-count)
  let cutoff = col-count * row-count
  return {
    set text(1em + 3pt)
    if row-count > 0 {
      grid(
        columns: (1fr,) * col-count,
        rows: row-count,
        column-gutter: col-gutter,
        row-gutter: row-gutter,
        ..l.slice(0, cutoff)
      )
    }
    if count - cutoff > 0 {
      grid(
        columns: (1fr,) * (count - cutoff),
        rows: 1,
        column-gutter: col-gutter,
        row-gutter: row-gutter,
        ..l.slice(cutoff)
      )
    }
  }
}
