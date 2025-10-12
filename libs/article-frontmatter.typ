#import "mgn901-paper/paper-auto-line-feed.typ": paper-auto-line-feed
#import "mgn901-paper/utils.typ": q

#let article-frontmatter(
  title: "表題",
  subtitle: "副題",
  author: "著者氏名",
  date: "日付",
  text-base-token: (text-size: q(13), line-spacing: q(20 - 13)),
  title-styler: it => it,
  subtitle-styler: it => it,
  author-styler: it => it,
) = {
  place(
    alignment.top,
    clearance: text-base-token.line-spacing,
    float: true,
    scope: "parent",
    paper-auto-line-feed(
      line-spacing: text-base-token.line-spacing,
      text-size: text-base-token.text-size,
      scope: "parent",
      align(
        alignment.center,
        block(
          width: 100%,
          [
            #title-styler[#title]
            #v(text-base-token.line-spacing, weak: true)
            #subtitle-styler[#subtitle]

            #show: author-styler.with()

            #v(text-base-token.line-spacing, weak: true)

            #author
            #v(-text-base-token.line-spacing / 2, weak: false)
            #date

            #v((text-base-token.line-spacing + text-base-token.text-size) / 2)
          ],
        ),
      ),
    ),
  )
}
