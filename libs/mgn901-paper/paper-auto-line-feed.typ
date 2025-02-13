#import "../presets/thesis.typ": page-settings, type-settings

#let paper-auto-line-feed(
  body,
  line-length: page-settings.line-length,
  column-numbers: page-settings.column-numbers,
  column-gap: page-settings.column-gap,
  type-settings: type-settings.default,
  scope: "column",
) = {
  context {
    let line-spacing = type-settings.line-height - type-settings.font-size
    let width = if scope != "parent" {
      type-settings.font-size * line-length
    } else {
      type-settings.font-size * line-length * column-numbers + column-gap * (column-numbers - 1)
    }
    let height = (
      measure(width: width, body).height
    )
    let new-height = (
      calc.floor(height / type-settings.line-height + 1) * type-settings.line-height - line-spacing
    )

    block(height: new-height, spacing: auto, body)
  }
}
