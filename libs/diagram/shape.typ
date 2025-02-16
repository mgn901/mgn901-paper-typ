#import "../mgn901-paper/font-style.typ": font-style
#import "../mgn901-paper/type-style.typ": type-style
#import "../presets/common.typ": color-presets
#import "../presets/slide.typ": font-settings, type-settings
#import "spiro-rounded-rect.typ": spiro-rounded-rect

#let create-mpl-bubble(type-settings: type-settings.default, font-settings: font-settings.strong) = {
  let underlying(rect-color: color-presets.blue.at(2), text-color: color-presets.blue.at(8), body) = {
    spiro-rounded-rect(
      inset: (type-settings.line-height - type-settings.font-size) * 1.5,
      radius: (type-settings.line-height - type-settings.font-size) * 2,
      fill: rect-color,
    )[#font-style(..font-settings, color: text-color)[#body]]
  }

  let inline-underlying(rect-color: color-presets.blue.at(2), text-color: color-presets.blue.at(8), body) = {
    h(.125em)
    box[
      #spiro-rounded-rect(
        inset: (x: (type-settings.line-height - type-settings.font-size) * 1),
        outset: (y: (type-settings.line-height - type-settings.font-size) * .25),
        radius: (type-settings.line-height - type-settings.font-size) * 2,
        fill: rect-color,
      )[#font-style(..font-settings, color: text-color)[#body]]
    ]
    h(.125em)
  }

  let block-underlying(
    rect-color: color-presets.blue.at(2),
    text-color: color-presets.blue.at(8),
    height: auto,
    body,
  ) = {
    spiro-rounded-rect(
      width: 100%,
      height: height,
      inset: (type-settings.line-height - type-settings.font-size) * 1.5,
      radius: (type-settings.line-height - type-settings.font-size) * 2,
      fill: rect-color,
    )[#font-style(..font-settings, color: text-color)[#body]]
  }

  return (
    default: underlying.with(
      rect-color: color-presets.gray1.at(2),
      text-color: color-presets.gray1.at(8),
    ),
    emph: underlying.with(
      rect-color: color-presets.blue.at(2),
      text-color: color-presets.blue.at(8),
    ),
    strong: underlying.with(
      rect-color: color-presets.blue.at(6),
      text-color: color-presets.blue.at(0),
    ),
    structural: underlying.with(
      rect-color: color-presets.red.at(2),
      text-color: color-presets.red.at(8),
    ),
    inline-default: inline-underlying.with(
      rect-color: color-presets.gray1.at(2),
      text-color: color-presets.gray1.at(8),
    ),
    inline-emph: inline-underlying.with(
      rect-color: color-presets.blue.at(2),
      text-color: color-presets.blue.at(8),
    ),
    inline-strong: inline-underlying.with(
      rect-color: color-presets.blue.at(6),
      text-color: color-presets.blue.at(0),
    ),
    inline-structural: inline-underlying.with(
      rect-color: color-presets.red.at(2),
      text-color: color-presets.red.at(8),
    ),
    block-default: block-underlying.with(
      rect-color: color-presets.gray1.at(2),
      text-color: color-presets.gray1.at(8),
    ),
    block-emph: block-underlying.with(
      rect-color: color-presets.blue.at(2),
      text-color: color-presets.blue.at(8),
    ),
    block-strong: block-underlying.with(
      rect-color: color-presets.blue.at(6),
      text-color: color-presets.blue.at(0),
    ),
    block-structural: block-underlying.with(
      rect-color: color-presets.red.at(2),
      text-color: color-presets.red.at(8),
    ),
    edge-default: font-style.with(..font-settings, color: color-presets.blue.at(8)),
    edge-structural: font-style.with(..font-settings, color: color-presets.red.at(8)),
  )
}
