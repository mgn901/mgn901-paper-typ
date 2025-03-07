#let font-style(
  body,
  font-family: (
    latin: ("Nimbus Roman",),
    cjk: ("Source Han Serif JP",),
  ),
  font-weight: 400,
  font-features: (:),
  color: auto,
) = {
  if color == auto {
    set text(
      font: (..font-family.latin.map(item => { (name: item, covers: "latin-in-cjk") }), ..font-family.cjk),
      // font: (..font-family.latin, ..font-family.cjk),
      weight: font-weight,
      features: font-features,
    )

    body
  } else {
    set text(
      font: (..font-family.latin, ..font-family.cjk),
      weight: font-weight,
      features: font-features,
      fill: color,
    )

    body
  }
}
