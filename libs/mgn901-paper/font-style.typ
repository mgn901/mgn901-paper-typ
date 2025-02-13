#let font-style(
  body,
  font-family: (
    latin: ("Nimbus Roman",),
    cjk: ("Source Han Serif JP",),
  ),
  font-weight: 400,
  font-features: (:),
  color: black,
) = {
  set text(
    font: (..font-family.latin, ..font-family.cjk),
    weight: font-weight,
    features: font-features,
    fill: color,
  )

  body
}
