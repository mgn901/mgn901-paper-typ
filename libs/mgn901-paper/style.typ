#import "@preview/tiptoe:0.2.0"
#import "utils.typ": get-style-entry, q, style-entries-from
#import "../diagram/spiro-rounded-rect.typ": spiro-rounded-rect
#import "../presets/mgn901-slide-udshingo.typ": style-tokens

#let default-text-arguments = (
  top-edge: .875em,
  bottom-edge: -.125em,
)

#let default-par-arguments = (
  linebreaks: "optimized",
)

#let stroke-value-from(style-entries) = (
  paint: get-style-entry(style-entries, "stroke-paint", auto),
  thickness: get-style-entry(style-entries, "stroke-thickness", auto),
  cap: get-style-entry(style-entries, "stroke-cap", auto),
  join: get-style-entry(style-entries, "stroke-join", auto),
  dash: get-style-entry(style-entries, "stroke-dash", auto),
  miter-limit: get-style-entry(style-entries, "stroke-miter-limit", auto),
)

#let stroke-styler(value, style-entries, it) = {
  let stroke-value = stroke-value-from(style-entries)
  set circle(stroke: stroke-value)
  set ellipse(stroke: stroke-value)
  set rect(stroke: stroke-value)
  set square(stroke: stroke-value)
  set curve(stroke: stroke-value)
  set polygon(stroke: stroke-value)
  it
}

#let block-stroke-styler(value, style-entries, it) = {
  let stroke-value = stroke-value-from(style-entries)
  set block(stroke: stroke-value)
}

#let box-stroke-styler(value, style-entries, it) = {
  let stroke-value = stroke-value-from(style-entries)
  set box(stroke: stroke-value)
}

#let stylers = (
  align: (value, style-entries, it) => {
    set grid(align: value)
    set table(align: value)
    it
  },
  gap: (value, style-entries, it) => {
    set grid(row-gutter: value, column-gutter: value)
    set table(row-gutter: value, column-gutter: value)
    it
  },
  gap-x: (value, style-entries, it) => {
    set grid(column-gutter: value)
    set table(column-gutter: value)
    it
  },
  gap-y: (value, style-entries, it) => {
    set grid(row-gutter: value)
    set table(row-gutter: value)
    it
  },
  width: (value, style-entries, it) => {
    set circle(width: value)
    set ellipse(width: value)
    set rect(width: value)
    set square(width: value)
    it
  },
  height: (value, style-entries, it) => {
    set circle(width: value)
    set ellipse(width: value)
    set rect(width: value)
    set square(width: value)
    it
  },
  fill: (value, style-entries, it) => {
    set circle(fill: value)
    set ellipse(fill: value)
    set rect(fill: value)
    set square(fill: value)
    set curve(fill: value)
    set polygon(fill: value)
    it
  },
  stroke-paint: stroke-styler,
  stroke-thickness: stroke-styler,
  stroke-cap: stroke-styler,
  stroke-join: stroke-styler,
  stroke-dash: stroke-styler,
  stroke-miter-limit: stroke-styler,
  radius: (value, style-entries, it) => {
    set circle(radius: value)
    set rect(radius: value)
    set square(radius: value)
    it
  },
  inset: (value, style-entries, it) => {
    set grid(inset: value)
    set table(inset: value)
    set circle(inset: value)
    set ellipse(inset: value)
    set rect(inset: value)
    set square(inset: value)
    it
  },
  outset: (value, style-entries, it) => {
    set circle(inset: value)
    set ellipse(inset: value)
    set rect(inset: value)
    set square(inset: value)
    it
  },
  block-above: (value, style-entries, it) => {
    set block(above: value)
    it
  },
  block-below: (value, style-entries, it) => {
    set block(below: value)
    it
  },
  block-width: (value, style-entries, it) => {
    set block(width: value)
    it
  },
  block-height: (value, style-entries, it) => {
    set block(height: value)
    it
  },
  block-fill: (value, style-entries, it) => {
    set block(fill: value)
    it
  },
  block-stroke-paint: block-stroke-styler,
  block-stroke-thickness: block-stroke-styler,
  block-stroke-cap: block-stroke-styler,
  block-stroke-join: block-stroke-styler,
  block-stroke-dash: block-stroke-styler,
  block-stroke-miter-limit: block-stroke-styler,
  block-radius: (value, style-entries, it) => {
    set block(radius: value)
    it
  },
  block-inset: (value, style-entries, it) => {
    set block(inset: value)
    it
  },
  block-outset: (value, style-entries, it) => {
    set block(outset: value)
    it
  },
  box-width: (value, style-entries, it) => {
    set box(width: value)
    it
  },
  box-height: (value, style-entries, it) => {
    set box(height: value)
    it
  },
  box-fill: (value, style-entries, it) => {
    set box(fill: value)
    it
  },
  box-stroke-paint: box-stroke-styler,
  box-stroke-thickness: box-stroke-styler,
  box-stroke-cap: box-stroke-styler,
  box-stroke-join: box-stroke-styler,
  box-stroke-dash: box-stroke-styler,
  box-stroke-miter-limit: box-stroke-styler,
  box-radius: (value, style-entries, it) => {
    set box(radius: value)
    it
  },
  box-inset: (value, style-entries, it) => {
    set box(inset: value)
    it
  },
  box-outset: (value, style-entries, it) => {
    set box(outset: value)
    it
  },
  grid-fill: (value, style-entries, it) => {
    set table(fill: value)
    set grid(fill: value)
    it
  },
  grid-stroke: (value, style-entries, it) => {
    set table(stroke: value)
    set grid(stroke: value)
    it
  },
  grid-inset: (value, style-entries, it) => {
    set table(inset: value)
    set grid(inset: value)
    it
  },
  font-family: (value, style-entries, it) => {
    set text(
      ..default-text-arguments,
      font: (..value.latin.map(item => (name: item, covers: "latin-in-cjk")), ..value.cjk),
    )
    it
  },
  font-weight: (value, style-entries, it) => {
    set text(..default-text-arguments, weight: value)
    it
  },
  font-features: (value, style-entries, it) => {
    set text(..default-text-arguments, features: value)
    it
  },
  text-size: (value, style-entries, it) => {
    set text(..default-text-arguments, size: value)
    it
  },
  text-fill: (value, style-entries, it) => {
    set text(..default-text-arguments, fill: value)
    it
  },
  text-stroke: (value, style-entries, it) => {
    set text(..default-text-arguments, stroke: value)
    it
  },
  line-justify: (value, style-entries, it) => {
    set par(..default-par-arguments, justify: value)
    it
  },
  line-spacing: (value, style-entries, it) => {
    set par(..default-par-arguments, spacing: value, leading: value)
    it
  },
  line-first-indent: (value, style-entries, it) => {
    set par(
      ..default-par-arguments,
      first-line-indent: (
        amount: value,
        all: true,
      ),
    )
    it
  },
  line-hanging-indent: (value, style-entries, it) => {
    set par(..default-par-arguments, hanging-indent: value)
    it
  },
)

#let styled-functions-from(style-entries) = {
  let width = get-style-entry(style-entries, "width", auto)
  let height = get-style-entry(style-entries, "height", auto)
  let fill = get-style-entry(style-entries, "fill", none)
  let stroke = (
    paint: get-style-entry(style-entries, "stroke-paint", auto),
    thickness: get-style-entry(style-entries, "stroke-thickness", auto),
  )
  let radius = get-style-entry(style-entries, "radius", 0em)
  let inset = get-style-entry(style-entries, "inset", (:))
  let outset = get-style-entry(style-entries, "outset", (:))

  (
    spiro-rounded-rect: spiro-rounded-rect.with(
      width: width,
      height: height,
      fill: fill,
      stroke: stroke,
      radius: radius,
      inset: inset,
      outset: outset,
    ),
    tiptoe-path: tiptoe.path.with(
      stroke: stroke,
    ),
  )
}

#let style(
  rules,
  body,
) = {
  assert(type(rules) == array, message: "argument must be an array")

  for rule in rules {
    for style in rule.pairs() {
      assert(
        stylers.keys().any(key => style.at(0) == key),
        message: "unknown style property: `" + style.at(0) + "`",
      )
    }
  }

  context {
    let current-ops = query(selector(<mgn901-paper.rules-stack-ops>).before(here())).map(md => md.value)

    let current-rules-stack = current-ops.fold((), (prev, op) => {
      if op.type == "push" { prev.push(op.rules) } else { prev.pop() }
      return prev
    })
    let current-rules-stack-par-style-ommited = current-rules-stack.map(
      rules => rules.map(
        rule => rule.pairs().filter(entry => not entry.at(0).starts-with("line-")).to-dict(),
      ),
    )
    let inner-style-entries = style-entries-from((..current-rules-stack-par-style-ommited, rules))
    let inner-functions = styled-functions-from(inner-style-entries)

    [#metadata((type: "push", rules: rules))<mgn901-paper.rules-stack-ops>]
    inner-style-entries.fold(
      if type(body) == function { body(inner-functions, inner-style-entries) } else { [#body] },
      (prev, entry) => stylers.at(entry.at(0))(entry.at(1), inner-style-entries, prev),
    )
    [#metadata((type: "pop"))<mgn901-paper.rules-stack-ops>]
  }
}

#let s = style-tokens

#style(((text-size: q(20), fill: color.red),))[
  あいうえお
  #block[aaaa]

  #style(((text-size: q(25)),))[かきくけこ]

  #style(((text-size: q(30)),))[さしすせそ]

  たちつてと
]

#style(
  (s.font-normal, s.font-sans, s.bg-t1b7-600, s.rounded-xs, s.inset-10, s.text-4xs, s.border-1, s.border-r7y1-600),
  [
    #style((s.border-8,), (f, s) => [
      aiueo
      #box(baseline: .125em)[
        #(f.spiro-rounded-rect)[
          東京学芸大学

          東京学芸大学
        ]
      ]
    ])
  ],
)
