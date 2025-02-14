#import "../presets/thesis.typ": font-settings, type-settings
#import "utils.typ": q
#import "mpl.typ": create-mpl

#let mpl = create-mpl(font-settings: font-settings, type-settings: type-settings)

#let paper-table(
  body,
  type-settings: type-settings.small,
  type-table: mpl.type-small,
  font-table: mpl.type-small,
) = {
  let line-spacing = type-settings.line-height - type-settings.font-size
  show table: it => {
    type-table(font-table(it))
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
