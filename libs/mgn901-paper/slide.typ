#import "../presets/slide.typ": (
  heading-token-params as slide-heading-tokens-params, page-settings, slide-page-tokens,
  style-tokens as slide-style-tokens,
)
#import "common-enum.typ": common-enum
#import "common-list.typ": common-list
#import "common-terms.typ": common-terms
#import "common-page.typ": common-page
#import "paper-table.typ": paper-table
#import "paper-figure.typ": paper-figure
#import "paper-footnote.typ": paper-footnote
#import "paper-math.typ": paper-math
#import "slide-page.typ": slide-page
#import "style.typ": spiro-rounded-rect, style
#import "utils.typ": adjust-latin-text-size as adjust-latin-text-size-func, heading-tokens-from, q, set-lang

#let slide(
  document-settings: (lang: "ja"),
  style-tokens: slide-style-tokens,
  heading-tokens-params: slide-heading-tokens-params,
  page-settings: page-settings,
  slide-page-tokens: slide-page-tokens,
  adjust-latin-text-size: true,
  body,
) = {
  let s = style-tokens

  show: text.with(lang: document-settings.lang)
  show: set-lang.with(document-settings.lang, set-indent: false)

  show: common-enum.with(numbering-pattern: "1.", marker-width: 1em)
  show: common-list.with(marker-width: 1em)
  show: common-page.with(
    ..page-settings,
    line-spacing: s.text-base.line-spacing,
    text-size: s.text-base.text-size,
  )
  show: common-terms.with(separator-width: 1em, hanging-indent: 2em)
  show: paper-figure.with(
    line-spacing: s.text-base.line-spacing,
    text-size: s.text-base.text-size,
    caption-styler: style.with((s.text-sm,)),
    caption-label-styler: style.with((s.font-sans, s.font-semibold)),
  )
  show: paper-footnote.with(
    footnote-clearance: s.text-base.line-spacing + s.text-base.text-size / 2,
    footnote-gap: s.text-sm.line-spacing,
    footnote-styler: style.with((s.text-sm,)),
  )
  show: paper-math.with(
    line-spacing: s.text-base.line-spacing,
    text-size: s.text-base.text-size,
  )
  show: paper-table.with()
  show: slide-page.with(
    text-base-token: s.text-base,
    section-title-styler: style.with(slide-page-tokens.section-title-style-tokens),
    bibliography-styler: style.with(slide-page-tokens.bibliography-style-tokens),
    running-head-width: 3em,
    nombre-current-styler: style.with(slide-page-tokens.nombre-current-style-tokens),
    nombre-total-styler: style.with(slide-page-tokens.nombre-total-style-tokens),
    running-head-item-styler: it => style(
      (slide-page-tokens.running-head-item-style-tokens),
      (f, _) => { (f.spiro-rounded-rect)(width: s.text-base.text-size * 3)[#it] },
    ),
    running-head-current-item-styler: it => style(
      (slide-page-tokens.running-head-current-item-style-tokens),
      (f, _) => { (f.spiro-rounded-rect)(width: s.text-base.text-size * 3)[#it] },
    ),
    running-head-intersperce: style(slide-page-tokens.running-head-intersperce-style-tokens)[
      #align(center + horizon)[#box(width: s.text-base.text-size * 3)[▼]]
    ],
  )
  show: adjust-latin-text-size-func.with()

  show: style.with((
    s.font-normal,
    s.font-serif,
    s.text-base,
    s.text-g0-800,
    (line-justify: true),
  ))

  show bibliography: it => []

  set box(baseline: .125em)

  show raw: style.with((s.font-medium, s.font-mono, (text-size: 1em)))
  show raw.where(block: true): style.with(((line-justify: false),))

  show strong: style.with((s.font-sans, s.font-semibold))
  set strong(delta: 0)

  show table: style.with((s.text-xs,))
  set table(
    inset: (
      x: s.text-xs.text-size / 2,
      y: s.text-xs.line-spacing,
    ),
  )

  show ref: it => {
    show: style.with(
      if it.element != none and (heading, figure, table).contains(it.element.func()) {
        (s.font-sans, s.font-semibold)
      } else {
        ()
      },
    )
    it
  }

  show heading: it => {
    it
    [#metadata("heading")<mgn901-paper.par-types>]
  }
  show parbreak: it => {
    it
    [#metadata("par")<mgn901-paper.par-types>]
  }

  context {
    let headings = query(heading)

    show: it => heading-tokens-params
      .enumerate(start: 0)
      .fold(it, (prev, v) => {
        let i = v.at(0)
        let param = v.at(1)
        show heading.where(level: i + 1): iu => {
          style((
            ..heading-tokens-from(
              iu.location(),
              base-tokens: s.text-base,
              heading-tokens: param.heading-tokens,
              lines-before: param.lines-before,
              lines-after: param.lines-after,
              line-feed: param.line-feed,
            ),
          ))[#iu]
        }
        prev
      })

    show heading.where(level: 1): it => {
      colbreak(weak: true)
      it
    }

    body
  }
}
