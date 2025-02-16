#import "mgn901-paper/paper-auto-line-feed.typ": paper-auto-line-feed
#import "mgn901-paper/type-style.typ": type-style
#import "mgn901-paper/font-style.typ": font-style
#import "presets/article.typ": font-settings, page-settings, type-settings

#let slide-frontmatter(
  title: "表題",
  subtitle: "副題",
  author: "著者氏名",
  date: "日付",
  line-length: page-settings.line-length,
  column-numbers: page-settings.column-numbers,
  column-gap: page-settings.column-gap,
  title-font-settings: font-settings.heading,
  title-type-settings: type-settings.frontmatter-title,
  subtitle-font-settings: font-settings.default,
  subtitle-type-settings: type-settings.frontmatter-default,
  author-font-settings: font-settings.default,
  author-type-settings: type-settings.frontmatter-default,
  default-type-settings: type-settings.default,
) = {
  let line-spacing = default-type-settings.line-height - default-type-settings.font-size

  place(
    alignment.top,
    clearance: line-spacing,
    float: true,
    scope: "parent",
    block(
      width: 100%,
      [
        #v(title-type-settings.line-height, weak: false)

        #type-style(..title-type-settings, justify: false, font-style(..title-font-settings, title))

        #v(title-type-settings.font-size / 2, weak: false)

        #type-style(
          ..subtitle-type-settings,
          justify: false,
          first-line-indent: 0em,
          font-style(..subtitle-font-settings, subtitle),
        )

        #show: type-style.with(..author-type-settings, justify: false, first-line-indent: 0em)
        #show: font-style.with(..author-font-settings)

        #v(1fr)

        #author

        #v(author-type-settings.font-size / 2, weak: false)

        #date
      ],
    ),
  )
}
