#let common-enum(
  body,
  numbering-pattern: "(1)",
  marker-width: 2em,
) = {
  set enum(
    numbering: n => [#box(width: marker-width, numbering(numbering-pattern, n))],
    body-indent: 0em,
    number-align: left,
  )

  body
}
