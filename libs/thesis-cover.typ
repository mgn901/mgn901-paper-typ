#import "./mgn901-paper/font-style.typ": font-style
#import "./mgn901-paper/type-style.typ": type-style
#import "./presets/thesis.typ": font-settings, font-settings, type-settings

#let thesis-cover(
  type: "卒業論文",
  title: "表題",
  subtitle: "副題",
  author_affiliation: "所属学校名・学科・専攻",
  author_student_number: "学籍番号",
  author: "著者氏名",
  teacher: "指導教員氏名",
  teacher_title_before: "指導教員",
  teacher_title_after: "教授",
  lang: "ja",
  title-type-settings: type-settings.frontmatter-title,
  title-font-settings: font-settings.heading,
  subtitle-font-settings: font-settings.default,
  author-type-settings: type-settings.frontmatter-default,
  author-font-settings: font-settings.default,
  small-type-settings: type-settings.frontmatter-small,
) = {
  set page(numbering: none)

  align(center)[
    #v(1.5fr)
    #type-style(..author-type-settings, font-style(..author-font-settings, type))
    #v(author-type-settings.line-height + author-type-settings.font-size)
    #type-style(..title-type-settings, font-style(..title-font-settings, title))
    #v(title-type-settings.font-size)
    #type-style(..author-type-settings, font-style(..subtitle-font-settings, subtitle))
    #v(1fr)

    #show: type-style.with(..author-type-settings)
    #show: font-style.with(..author-font-settings)

    #align(
      alignment.center,
      [
        #type-style(..small-type-settings, teacher_title_before)

        #type-style(
          ..author-type-settings,
          if lang == "ja" [
            #teacher #teacher_title_after
          ] else [
            #teacher_title_after #teacher
          ],
        )
      ],
    )
    #v(1fr)
    #align(
      alignment.center,
      [#author_affiliation#linebreak()#author_student_number #author],
    )
    #v(1fr)
  ]
}
