#import "../mgn901-paper/font-style.typ": font-style

#let icon(body) = {
  box(
    baseline: .125em,
    height: .75em,
    width: 1em,
  )[
    #align(horizon)[
      #font-style(
        font-family: (latin: ("Material Symbols Outlined",), cjk: ("Material Symbols Outlined",)),
        font-features: (liga: 1),
      )[#body]
    ]
  ]
}
