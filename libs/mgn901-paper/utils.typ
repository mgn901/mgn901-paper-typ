#let q(number) = number * 1mm / 4

#let marker(it, width: 2em) = context {
  let adjust = (width - measure(it).width) / 2

  box([#h(adjust)#it#h(adjust)])
}

#let is-after-heading = (
  loc => {
    let query-results = query(selector(<mgn901-paper.par-types>).before(loc))
    if query-results.len() == 2 { false } else { query-results.map(md => md.value).slice(-2).contains("heading") }
  }
)

#let get-style-entry(style-entries, key, default-value) = {
  let entry = style-entries.find(entry => entry.at(0) == key)
  if (entry != none and entry.at(1) != none) { entry.at(1) } else { default-value }
}

#let style-entries-from(rule-stack) = {
  rule-stack.flatten().rev().map(rule => rule.pairs()).fold((), (prev, rule) => (..prev, ..rule))
}

#let heading-tokens-from(
  base-tokens: ((text-size: q(16), line-spacing: q(28 - 16)),),
  heading-tokens: ((text-size: q(28), line-spacing: q(28 - 28)),),
  lines-before: 2,
  lines-after: 1,
  line-feed: 1,
  loc,
) = {
  let heading-style-entries = style-entries-from((heading-tokens,))
  let base-style-entries = style-entries-from((base-tokens,))
  let base-line-spacing = get-style-entry(base-style-entries, "line-spacing", q(28 - 16))
  let base-text-size = get-style-entry(base-style-entries, "text-size", q(16))
  let heading-text-size = get-style-entry(heading-style-entries, "text-size", q(16))

  (
    ..heading-tokens,
    (
      block-above: if is-after-heading(loc) { 0em } else {
        base-line-spacing * (lines-before + 1) + base-text-size * lines-before
      },
      block-below: base-line-spacing * (lines-after + 1) + base-text-size * lines-after,
      block-inset: (
        top: (base-text-size - heading-text-size) / 2 + (base-line-spacing + base-text-size) * (line-feed - 1) / 2,
        bottom: (base-text-size - heading-text-size) / 2 + (base-line-spacing + base-text-size) * (line-feed - 1) / 2,
      ),
      block-outset: (
        top: (heading-text-size - base-text-size) / 2,
        bottom: (heading-text-size - base-text-size) / 2,
      ),
      line-justify: false,
    ),
  )
}

#let set-lang(lang, set-indent: true, it) = context {
  set text(
    costs: if ("ja", "kr", "zh").contains(lang) {
      (widow: 0%, orphan: 0%)
    } else {
      (hyphenation: 100%, runt: 100%, widow: 100%, orphan: 100%)
    },
  )

  set par(
    ..(
      if set-indent {
        (
          first-line-indent: if ("ja", "kr", "zh").contains(lang) {
            (amount: 1em, all: true)
          } else {
            (amount: 1em + par.leading * 2, all: false)
          },
        )
      }
    ),
  )

  it
}

#let adjust-latin-text-size(it) = {
  show regex("[\u0000-\u2dff]+"): set text(
    size: 1em / .9375,
    top-edge: .875em * .9375,
    bottom-edge: -.125em * .9375,
    baseline: .03125em,
  )
  it
}

#let reset-latin-text-size(it) = {
  show regex("[\u0000-\u2dff]+"): set text(
    size: 1em * .9375,
    top-edge: .875em * .9375,
    bottom-edge: -.125em * .9375,
    baseline: -.03125em,
  )
  it
}
