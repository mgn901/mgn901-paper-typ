#import "../presets/thesis.typ": font-settings, type-settings
#import "mpl.typ": create-mpl
#import "paper-auto-line-feed.typ": paper-auto-line-feed
#import "utils.typ": q

#let mpl = create-mpl(font-settings: font-settings, type-settings: type-settings)

#let paper-figure(
  body,
  column-numbers: 1,
  column-gap: 3em,
  line-length: 36,
  default-type-settings: type-settings.default,
  type-footnote: mpl.type-footnote,
  font-footnote: mpl.font-footnote,
  font-strong: mpl.font-strong,
  auto-line-feed: true,
) = {
  show figure.caption: it => {
    type-footnote(
      font-footnote(context {
        grid(
          columns: (auto, auto),
          rows: 1,
          gutter: 1em,
          font-strong[#it.supplement #numbering(it.numbering, ..it.counter.get())], align(alignment.start, it.body),
        )
      }),
    )
  }

  show figure: it => {
    context {
      let line-spacing = default-type-settings.line-height - default-type-settings.font-size
      let spacer = v(line-spacing, weak: true)

      let original-content = [
        #if it.kind == table { type-footnote[#it.caption#spacer] }
        #it.body
        #if it.kind != table { type-footnote[#spacer#it.caption] }
      ]

      let content = if auto-line-feed == true {
        paper-auto-line-feed(
          column-numbers: column-numbers,
          column-gap: column-gap,
          line-length: line-length,
          type-settings: default-type-settings,
          scope: it.scope,
          original-content,
        )
      } else {
        original-content
      }

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
