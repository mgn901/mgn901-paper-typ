#import "../presets/thesis.typ": type-settings, font-settings
#import "font-style.typ": font-style
#import "type-style.typ": inline-type-style, type-style

#let create-mpl(type-settings: type-settings, font-settings: font-settings) = {
  (
    type-default: type-style.with(..type-settings.default),
    type-footnote: type-style.with(..type-settings.footnote),
    type-small: type-style.with(..type-settings.small),
    type-monospace: type-style.with(..type-settings.monospace),
    itype-default: inline-type-style.with(..type-settings.default),
    itype-footnote: inline-type-style.with(..type-settings.footnote),
    itype-small: inline-type-style.with(..type-settings.small),
    itype-monospace: inline-type-style.with(..type-settings.monospace),
    font-default: font-style.with(..font-settings.default),
    font-heading: font-style.with(..font-settings.heading),
    font-footnote: font-style.with(..font-settings.footnote),
    font-small: font-style.with(..font-settings.small),
    font-monospace: font-style.with(..font-settings.monospace),
    font-strong: font-style.with(..font-settings.strong),
  )
}
