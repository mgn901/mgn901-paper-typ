#import "common-page.typ": common-page
#import "common-enum.typ": common-enum
#import "utils.typ": q

#let slide-page(
  body,
  text-base-token: (text-size: q(32), line-spacing: q(38 - 32)),
  section-title-styler: it => it,
  bibliography-styler: it => it,
  nombre-current-styler: it => it,
  nombre-total-styler: it => it,
  running-head-width: 3em,
  running-head-item-styler: it => it,
  running-head-current-item-styler: it => it,
  running-head-intersperce: [],
) = {
  set page(
    numbering: "1",
    footer: [],
    background: context {
      let section-title = (
        () => {
          let query-results = query(selector(<mgn901-paper.sections>)).filter(md => (
            md.location().page() <= here().page()
          ))
          if query-results.len() == 0 [] else { query-results.last().value.title }
        }
      )()
      place(
        top + start,
        dx: page.margin.left,
        dy: page.margin.top - 1em,
        section-title-styler[#section-title],
      )

      let references = query(<mgn901-paper.refs>)
      let references-deduped = references.map(md => md.value).dedup()
      let references-on-page = (
        references.filter(md => md.location().page() == here().page()).map(md => md.value).dedup()
      )
      let per-page-bibliography = for l in references-on-page [
        #enum.item(
          references-deduped.position(m => l == m) + 1,
          cite(l, form: "full"),
        )
      ]
      place(
        bottom + start,
        dx: page.margin.left,
        dy: -page.margin.bottom + 1em,
        block(width: 100% - page.margin.left - page.margin.right)[
          #show: common-enum.with(marker-width: 2em, numbering-pattern: "[1]")
          #align(top + start)[#bibliography-styler[#per-page-bibliography]]
        ],
      )

      place(
        top + right,
        dx: (page.margin.right - running-head-width) / -2,
        dy: page.margin.top - 1em,
        [
          #nombre-current-styler[#numbering(
            page.numbering,
            ..counter(page).get(),
          )]#nombre-total-styler[ \/ #numbering(
              page.numbering,
              ..counter(page).final(),
            )]
        ],
      )

      let sections = query(<mgn901-paper.sections>)
      if here().page() != 1 {
        place(
          top + right,
          dx: (page.margin.right - running-head-width) / -2,
          dy: page.margin.top,
          for (i, md) in sections.intersperse(running-head-intersperce).enumerate() [
            #let next = if i / 2 < sections.len() - 1 { sections.at(calc.floor(i / 2) + 1) } else { none }
            #if calc.rem(i, 2) == 1 [
              #running-head-intersperce
            ] else if (
              here().page() >= md.location().page() and (next == none or here().page() < next.location().page())
            ) [
              #running-head-current-item-styler[#align(horizon + center)[#md.value.abbr]]
            ] else [
              #running-head-item-styler[#align(horizon + center)[#md.value.abbr]]
            ]
          ],
        )
      }
    },
  )

  body
}
