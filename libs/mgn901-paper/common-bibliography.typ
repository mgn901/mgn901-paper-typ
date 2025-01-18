#import "type-style.typ": type-style, inline-type-style
#import "paper-heading.typ": paper-heading
#import "../presets/thesis.typ": type-settings, heading-type-settings
#import "state.typ": inside-of-bibliography

#let common-bibliography(
  body,
  heading-type-settings: heading-type-settings.at(1),
  default-type-settings: type-settings.default,
  bibliotgraphy-type-settings: type-settings.default,
) = {
  show bibliography: it => {
    inside-of-bibliography.update(true)

    show heading.where(level: 1): paper-heading.with(
      default-type-settings: default-type-settings,
      heading-type-settings: heading-type-settings,
    )
    show: type-style.with(..bibliotgraphy-type-settings)

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

    it

    inside-of-bibliography.update(false)
  }

  body
}
