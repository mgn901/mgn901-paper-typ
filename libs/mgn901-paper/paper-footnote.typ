#import "utils.typ": q

#let paper-footnote(
  body,
  footnote-clearance: q(28 - 16 + 16 / 2),
  footnote-gap: q(20 - 14),
  footnote-styler: it => it,
) = {
  show footnote: set super(baseline: 0em, size: 1em)

  set footnote(
    numbering: n => box(height: 1em, baseline: .125em)[
      #text(size: .75em, numbering((..nums) => "*" + nums.pos().map(str).join("."), n))
    ],
  )

  set footnote.entry(
    separator: line(length: 100% / 3, stroke: (thickness: q(0.5))),
    clearance: footnote-clearance,
    gap: footnote-gap,
  )

  show footnote.entry: it => footnote-styler[
    #grid(
      columns: (2em, 1fr),
      rows: 1,
      gutter: 0em,
      numbering(it.note.numbering, ..counter(footnote).at(it.note.location())), it.note.body,
    )
  ]

  body
}
