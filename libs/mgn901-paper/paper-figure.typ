#import "paper-auto-line-feed.typ": paper-auto-line-feed
#import "utils.typ": q
#import "font-style.typ": font-style
#import "../presets/thesis.typ": font-settings, type-settings
#import "type-style.typ": type-style

#let paper-figure(
  body,
  column-numbers: 1,
  column-gap: 3em,
  line-length: 36,
  default-type-settings: type-settings.default,
  footnote-type-settings: type-settings.footnote,
  strong-font-settings: font-settings.strong,
  footnote-font-settings: font-settings.footnote,
) = {
  show figure.caption: it => {
    show: type-style.with(..footnote-type-settings)
    show: font-style.with(..footnote-font-settings)
    context {
      grid(
        columns: (auto, auto),
        rows: 1,
        gutter: 1em,
        font-style(..strong-font-settings, [#it.supplement #numbering(it.numbering, ..it.counter.get())]),
        align(alignment.start, it.body),
      )
    }
  }

  show figure: it => {
    context {
      let line-spacing = default-type-settings.line-height - default-type-settings.font-size
      let spacer = v(line-spacing, weak: true)

      let original-content = [
        #if it.kind == table {
          type-style(..footnote-type-settings, [#it.caption#spacer])
        }
        #it.body
        #if it.kind != table {
          type-style(..footnote-type-settings, [#spacer#it.caption])
        }
      ]

      let content = paper-auto-line-feed(
        column-numbers: column-numbers,
        column-gap: column-gap,
        line-length: line-length,
        type-settings: default-type-settings,
        scope: it.scope,
        original-content,
      )

      if it.placement == alignment.top or it.placement == alignment.bottom {
        place(
          it.placement + alignment.center,
          scope: it.scope,
          float: true,
          clearance: default-type-settings.line-height + line-spacing,
          content,
        )
      } else if it.placement == auto {
        place(
          auto,
          scope: it.scope,
          float: true,
          clearance: default-type-settings.line-height + line-spacing,
          content,
        )
      } else {
        content
      }
    }
  }

  body
}
