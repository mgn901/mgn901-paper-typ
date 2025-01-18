#import "./mgn901-paper/font-style.typ": font-style
#import "./presets/thesis.typ": font-settings, type-settings
#import "./mgn901-paper/type-style.typ": type-style

#let thesis-outline(
  title: "目次",
  font-settings: font-settings.default,
  strong-font-settings: font-settings.strong,
  type-settings: type-settings.default,
) = {
  let line-spacing = type-settings.line-height - type-settings.font-size

  show: type-style.with(..type-settings, justify: false, linebreaks: "optimized")

  context {
    let items = query(
      heading
        .where(outlined: true)
        .and(heading.where(depth: 1).or(heading.where(depth: 2)).or(heading.where(depth: 3))),
    )
    let fill_gap = measure([0]).width - measure([.]).width
    show "\n": ""

    for (i, item) in items.enumerate() {
      let item-font-settings = if item.level == 1 { strong-font-settings } else { font-settings }
      if item.level == 1 and i != 0 { v(type-settings.line-height) }
      block(
        breakable: false,
        link(item.location())[
          #grid(
            columns: (
              (if item.level == 1 { 3em } else { (item.level - 1) * 1em }) + item.level * 1em,
              auto,
              auto,
            ),
            rows: 1,
            gutter: (1em, .5em),
            [
              #h((item.level - 1) * 1em)
              #if item.numbering != none {
                font-style(..item-font-settings, numbering(item.numbering, ..counter(heading).at(item.location())))
              }
            ],
            [
              #font-style(..item-font-settings, item.body)
              #h(fill_gap, weak: true)
              #box(
                width: 1fr,
                height: 0em,
                move(dy: -type-settings.line-height + type-settings.font-size * .5 + .1em)[
                  #align(alignment.end)[
                    #repeat(gap: fill_gap, justify: false)[.]
                  ]
                ],
              )
              #h(fill_gap, weak: true)
            ],
            align(bottom, numbering(item.location().page-numbering(), ..counter(page).at(item.location()))),
          )
        ],
      )
    }
  }
}
