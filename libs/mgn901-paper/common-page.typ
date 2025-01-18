#import "../mgn901-paper/utils.typ": q

#let common-page(
  body,
  width: 210mm,
  height: 297mm,
  column-numbers: 1,
  column-gap: 3em,
  line-length: 36,
  line-numbers: 32,
  line-height: q(30),
  font-size: q(17),
  nombre: true,
) = {
  let translate-for-nombre = if nombre == true { 1 } else { 0 }
  let line-spacing = line-height - font-size

  set page(
    width: width,
    height: height,
    columns: column-numbers,
    margin: (
      x: (width - font-size * line-length * column-numbers - (column-gap * (column-numbers - 1))) / 2,
      top: (height - (line-height * (line-numbers + translate-for-nombre) - line-spacing)) / 2,
      bottom: (height - (line-height * (line-numbers - translate-for-nombre) - line-spacing)) / 2,
    ),
    numbering: if nombre == true { "1" } else { none },
    footer-descent: line-spacing + line-height,
  )

  set columns(gutter: column-gap)

  body
}
