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
  title-styler: it => it,
  subtitle-styler: it => it,
  author-styler: it => it,
  small-styler: it => it,
) = {
  set page(numbering: none)

  align(center)[
    #v(1.5fr)

    #author-styler[#type]
    #linebreak()
    #linebreak()
    #title-styler[#title]
    #linebreak()
    #subtitle-styler[#subtitle]

    #show: author-styler.with()

    #v(1fr)

    #align(
      alignment.center,
      [
        #small-styler[#teacher_title_before]

        #author-styler[
          #if lang == "ja" [
            #teacher #teacher_title_after
          ] else [
            #teacher_title_after #teacher
          ]
        ]
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
