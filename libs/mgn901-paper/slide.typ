#import "../presets/common.typ": color-presets
#import "../presets/slide.typ": font-settings, font-settings, page-settings, type-settings, heading-type-settings
#import "common-perpage-bibliography.typ": common-perpage-bibliography
#import "common-enum.typ": common-enum
#import "common-list.typ": common-list
#import "common-list.typ": common-list
#import "common-terms.typ": common-terms
#import "font-style.typ": font-style
#import "mpl.typ": create-mpl
#import "paper-figure.typ": paper-figure
#import "paper-footnote.typ": paper-footnote
#import "paper-heading.typ": paper-heading
#import "paper-math.typ": paper-math
#import "paper-table.typ": paper-table
#import "slide-page.typ": slide-page
#import "state.typ": update-dist-from-heading
#import "type-style.typ": type-style, inline-type-style
#import "utils.typ": q

#let slide(
  document-settings: (lang: "ja"),
  page-settings: page-settings,
  font-settings: font-settings,
  type-settings: type-settings,
  heading-font-settings: (font-settings.heading,),
  heading-type-settings: heading-type-settings,
  heading-settings: (
    (numbering: "第1章", label-width: 4em, break-before: true),
    (numbering: "1.1.", label-width: auto, break-before: false),
  ),
  body,
) = {
  let mpl = create-mpl(font-settings: font-settings, type-settings: type-settings)

  context {
    show: it => array
      .range(calc.max(heading-font-settings.len(), heading-type-settings.len(), heading-settings.len()))
      .fold(
        it,
        (it, i) => {
          let type-setting = heading-type-settings.at(calc.min(i, heading-type-settings.len() - 1))
          let font-setting = heading-font-settings.at(calc.min(i, heading-font-settings.len() - 1))
          let heading-setting = heading-settings.at(calc.min(i, heading-settings.len() - 1))
          show heading.where(level: i + 1): paper-heading.with(
            default-type-settings: type-settings.default,
            heading-type-settings: type-setting,
            font-heading: mpl.font-heading,
            type-heading: type-style.with(font-size: type-setting.font-size, line-height: type-setting.line-height),
            label-width: heading-setting.label-width,
            break-before: heading-setting.break-before,
          )
          show heading.where(level: i + 1): set heading(numbering: heading-setting.numbering)
          it
        },
      )
    show: type-style.with(..type-settings.default, lang: document-settings.lang)
    show: font-style.with(..font-settings.default)
    show raw: font-style.with(..font-settings.monospace)
    show raw: inline-type-style.with(..type-settings.monospace)
    show raw.where(block: true): set par(justify: false)
    show strong: font-style.with(..font-settings.strong)
    set strong(delta: 0)
    set box(baseline: .125em)

    show: common-enum.with(marker-width: 1em, numbering-pattern: "1.")
    show: common-list.with(marker-width: 1em)
    show: slide-page.with(
      ..page-settings,
      line-height: type-settings.default.line-height,
      font-size: type-settings.default.font-size,
      default-type-settings: type-settings.default,
      running-head-title-type-settings: type-settings.footnote,
      running-head-type-settings: type-settings.bibliography,
      bibliography-type-settings: type-settings.small,
      running-head-default-font-settings: font-settings.default,
      running-head-strong-font-settings: font-settings.strong,
      bibliography-font-settings: font-settings.default,
      nombre: false,
    )
    show: common-perpage-bibliography.with()
    show: common-terms.with(separator-width: 1em, hanging-indent: 2em)
    show: update-dist-from-heading.with()
    show: paper-figure.with(
      column-numbers: page-settings.column-numbers,
      line-length: page-settings.line-length,
      column-gap: page-settings.column-gap,
      default-type-settings: type-settings.default,
      type-footnote: mpl.type-footnote,
      font-footnote: mpl.font-footnote,
      font-strong: mpl.font-strong,
      auto-line-feed: false,
    )
    show: paper-math.with(
      type-settings: type-settings.default,
      line-length: page-settings.line-length,
      column-numbers: page-settings.column-numbers,
      column-gap: page-settings.column-gap,
      auto-line-feed: false,
    )
    show: paper-table.with(type-settings: type-settings.small, type-table: mpl.type-small, font-table: mpl.font-small)
    show: paper-footnote.with(
      default-type-settings: type-settings.default,
      footnote-type-settings: type-settings.footnote,
      font-footnote: mpl.font-footnote,
    )

    show ref: it => {
      if query(heading).contains(it.element) {
        link(
          it.target,
          numbering(it.element.numbering, ..counter(it.element.func()).at(it.element.location())),
        )
      } else if query(figure).contains(it.element) {
        font-style(
          ..font-settings.strong,
          it,
        )
      } else {
        it
      }
    }

    body
  }
}
