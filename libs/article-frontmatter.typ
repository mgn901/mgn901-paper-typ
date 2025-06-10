#import "mgn901-paper/paper-auto-line-feed.typ": paper-auto-line-feed
#import "mgn901-paper/type-style.typ": type-style
#import "mgn901-paper/font-style.typ": font-style
#import "presets/article.typ": font-settings, page-settings, type-settings

#let article-frontmatter(
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
    paper-auto-line-feed(
      type-settings: default-type-settings,
      line-length: line-length,
      column-numbers: column-numbers,
      column-gap: column-gap,
      scope: "parent",
      align(
        alignment.center,
        block(
          width: 100%,
          [
            #type-style(..title-type-settings, justify: false, font-style(..title-font-settings, title))

            #v(line-spacing * 1.25, weak: true)

            #type-style(..subtitle-type-settings, justify: false, font-style(..subtitle-font-settings, subtitle))

            #show: type-style.with(..author-type-settings, justify: false)
            #show: font-style.with(..author-font-settings)

            #v(line-spacing * 1.25, weak: true)

            #author

            #date
          ],
        ),
      ),
    ),
  )
}
