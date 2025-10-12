#let common-bibliography(
  body,
  bibliography-styler: it => it,
) = {
  show bibliography: it => {
    show regex(
      "([,.:] | [:] )[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]+?|(\(.*?[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]+?.*?\)([,.:] )?)",
    ): it => it
      .text
      .replace("), ", "），")
      .replace("): ", "）：")
      .replace("). ", "）．")
      .replace(", ", "，")
      .replace(". ", "．")
      .replace(" : ", "：")
      .replace(": ", "：")
      .replace(" (", "（")
      .replace("(", "（")
      .replace(") ", "）")
      .replace(")", "）")

    [#metadata(true)<mgn901-paper.inside-of-bibliography>]
    bibliography-styler[#it]
    [#metadata(false)<mgn901-paper.inside-of-bibliography>]
  }

  body
}
