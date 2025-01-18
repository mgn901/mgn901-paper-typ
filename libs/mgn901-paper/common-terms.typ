#let common-terms(
  body,
  separator-width: 1em,
  hanging-indent: 2em,
) = {
  set terms(separator: [#h(separator-width, weak: true)], hanging-indent: hanging-indent)

  body
}
