#import "mgn901-paper/style.typ": style
#let thesis-outline(
  title: "目次",
  styler: it => it,
  strong-styler: it => it,
) = context {
  let fill_gap = measure([0]).width - measure([.]).width

  show outline: styler.with()
  show outline.entry.where(level: 1): strong-styler.with()
  show heading.where(level: 1): set heading(numbering: none)
  show "\n": ""

  set outline.entry(
    fill: grid(
      columns: 2,
      styler[
        #move(dy: (-.875em + .25em) / 2)[
          #align(alignment.end)[
            #repeat(gap: fill_gap, justify: false)[.]
          ]
        ]
      ],
      h(fill_gap),
    ),
  )

  outline()
}
