#import "../presets/thesis.typ": font-settings, type-settings
#import "mpl.typ": create-mpl
#import "utils.typ": q

#let mpl = create-mpl(font-settings: font-settings, type-settings: type-settings)

#let paper-footnote(
  body,
  default-type-settings: type-settings.default,
  footnote-type-settings: type-settings.footnote,
  type-footnote: mpl.type-footnote,
  font-footnote: mpl.font-footnote,
) = {
  let footnote-line-spacing = footnote-type-settings.line-height - footnote-type-settings.font-size
  let default-line-spacing = default-type-settings.line-height - default-type-settings.font-size

  show footnote: set super(baseline: 0em, size: 1em)

  set footnote(
    numbering: n => box(height: 1em, baseline: .125em)[
      #text(size: .75em, numbering((..nums) => "*" + nums.pos().map(str).join("."), n))
    ],
  )

  set footnote.entry(
    separator: line(length: 100% / 3, stroke: (thickness: q(0.5))),
    gap: footnote-line-spacing,
    clearance: default-line-spacing + default-type-settings.font-size / 2,
  )

  show footnote.entry: it => {
    type-footnote(
      font-footnote(
        grid(
          columns: (2em, 1fr),
          rows: 1,
          gutter: 0em,
          numbering(it.note.numbering, ..counter(footnote).at(it.note.location())), it.note.body,
        ),
      ),
    )
  }

  body
}
