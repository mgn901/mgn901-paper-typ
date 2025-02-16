#import "../presets/thesis.typ": page-settings, type-settings
#import "paper-auto-line-feed.typ": paper-auto-line-feed

#let paper-math(
  body,
  type-settings: type-settings.default,
  line-length: page-settings.line-length,
  column-numbers: page-settings.column-numbers,
  column-gap: page-settings.column-gap,
  auto-line-feed: true,
) = {
  show math.equation.where(block: true): it => {
    if auto-line-feed == true {
      paper-auto-line-feed(
        it,
        type-settings: type-settings,
        scope: "column",
        line-length: line-length,
        column-numbers: column-numbers,
        column-gap: column-gap,
      )
    } else {
      it
    }
  }

  body
}
