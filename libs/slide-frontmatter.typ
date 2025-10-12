#import "mgn901-paper/utils.typ": q

#let slide-frontmatter(
  title: "表題",
  subtitle: "副題",
  author: "著者氏名",
  date: "日付",
  text-base-token: (text-size: q(38), line-spacing: q(44 - 38)),
  title-styler: it => it,
  subtitle-styler: it => it,
  author-styler: it => it,
) = {
  place(
    alignment.top,
    clearance: text-base-token.line-spacing,
    float: true,
    scope: "parent",
    block(
      width: 100%,
      [
        #v(text-base-token.text-size + text-base-token.line-spacing)
        #title-styler[#title]
        #v(text-base-token.text-size + text-base-token.line-spacing)
        #subtitle-styler[#subtitle]

        #show: author-styler.with()

        #v(1fr)

        #author
        #v(text-base-token.text-size + text-base-token.line-spacing)
        #date
      ],
    ),
  )
}
