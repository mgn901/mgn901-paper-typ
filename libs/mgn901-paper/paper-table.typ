#import "../mgn901-paper/utils.typ": q
#import "font-style.typ": font-style
#import "../presets/thesis.typ": font-settings, type-settings
#import "type-style.typ": type-style

#let paper-table(
  body,
  type-settings: type-settings.small,
  font-settings: font-settings.small,
) = {
  let line-spacing = type-settings.line-height - type-settings.font-size
  show table: type-style.with(..type-settings)
  show table: font-style.with(..font-settings)
  show table: it => {
    line(length: 100%, stroke: (thickness: q(0.5)))
    v(line-spacing * 2 / 3, weak: true)
    it
  }

  set table(
    inset: (
      x: type-settings.font-size / 2,
      y: line-spacing,
    ),
    align: alignment.top + alignment.start,
    stroke: (
      top: (thickness: q(0.5)),
      left: none,
      bottom: (thickness: q(0.5)),
      right: none,
    ),
  )

  body
}
