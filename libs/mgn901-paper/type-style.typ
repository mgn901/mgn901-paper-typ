#import "../mgn901-paper/utils.typ": *
#import "font-style.typ": *
#import "state.typ": inside-of-bibliography

#let type-style(
  body,
  font-size: q(16),
  line-height: q(28),
  lang: "ja",
  first-line-indent: 0em,
  justify: true,
  hanging-indent: 0em,
  linebreaks: "optimized",
) = {
  set par(
    leading: line-height - font-size,
    spacing: line-height - font-size,
    first-line-indent: (all: true, amount: first-line-indent),
    justify: justify,
    hanging-indent: hanging-indent,
    linebreaks: "optimized",
  )

  context {
    show: text.with(
      size: font-size,
      lang: if inside-of-bibliography.get() == false { lang } else { "en" },
      top-edge: .875em,
      bottom-edge: -.125em,
      costs: (
        widow: 0%,
        orphan: 0%,
      ),
    )

    body
  }
}

#let inline-type-style(
  body,
  font-size: q(16),
  line-height: q(28),
  lang: "ja",
  first-line-indent: 1em,
  justify: true,
  hanging-indent: 0em,
  linebreaks: "optimized",
) = {
  context {
    show: text.with(
      size: font-size,
      lang: if inside-of-bibliography.get() == false { lang } else { "en" },
      top-edge: .875em,
      bottom-edge: -.125em,
      costs: (
        widow: 0%,
        orphan: 0%,
      ),
    )

    body
  }
}
