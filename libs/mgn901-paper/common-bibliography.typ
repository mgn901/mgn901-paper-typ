#import "../presets/thesis.typ": font-settings, type-settings, heading-type-settings
#import "mpl.typ": create-mpl
#import "paper-heading.typ": paper-heading
#import "state.typ": inside-of-bibliography

#let mpl = create-mpl(font-settings: font-settings, type-settings: type-settings)

#let common-bibliography(
  body,
  font-bibliography: mpl.font-small,
  type-bibliography: mpl.type-small,
) = {
  show bibliography: it => {
    inside-of-bibliography.update(true)

    show regex("([,.:] | [:] )[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]+?|(\(.*?[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]+?.*?\)([,.:] )?)"): it => {
      it
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
    }

    type-bibliography(font-bibliography(it))

    inside-of-bibliography.update(false)
  }

  body
}
