#import "../presets/slide.typ": type-settings, font-settings
#import "../mgn901-paper/font-style.typ": font-style
#import "../mgn901-paper/type-style.typ": type-style

#let line-spacing = type-settings.default.line-height - type-settings.default.font-size

#let to-inset(inset) = {
  if type(inset) == length {
    (top: inset, right: inset, bottom: inset, left: inset)
  } else {
    (
      top: if inset.keys().contains("y") {
        inset.at("y")
      } else if inset.keys().contains("top") {
        inset.at("top")
      } else {
        0em
      },
      right: if inset.keys().contains("x") {
        inset.at("x")
      } else if inset.keys().contains("right") {
        inset.at("right")
      } else {
        0em
      },
      bottom: if inset.keys().contains("y") {
        inset.at("y")
      } else if inset.keys().contains("bottom") {
        inset.at("bottom")
      } else {
        0em
      },
      left: if inset.keys().contains("x") {
        inset.at("x")
      } else if inset.keys().contains("left") {
        inset.at("left")
      } else {
        0em
      },
    )
  }
}

#let to-radius(radius) = {
  if type(radius) == length {
    (top-left: radius, top-right: radius, bottom-right: radius, bottom-left: radius)
  } else {
    (
      top-left: if radius.keys().contains("top") {
        radius.at("top")
      } else if radius.keys().contains("left") {
        radius.at("left")
      } else if radius.keys().contains("top-left") {
        radius.at("top-left")
      } else { 0em },
      top-right: if radius.keys().contains("top") {
        radius.at("top")
      } else if radius.keys().contains("right") {
        radius.at("right")
      } else if radius.keys().contains("top-right") {
        radius.at("top-right")
      } else { 0em },
      bottom-right: if radius.keys().contains("bottom") {
        radius.at("bottom")
      } else if radius.keys().contains("right") {
        radius.at("right")
      } else if radius.keys().contains("bottom-right") {
        radius.at("bottom-right")
      } else { 0em },
      bottom-left: if radius.keys().contains("bottom") {
        radius.at("bottom")
      } else if radius.keys().contains("left") {
        radius.at("left")
      } else if radius.keys().contains("bottom-left") {
        radius.at("bottom-left")
      } else { 0em },
    )
  }
}

#let spiro-rounded-rect-vertices(
  radius: line-spacing * 2,
  offset-x: 0pt,
  offset-y: 0pt,
  direction-x: 1,
  direction-y: 1,
) = {
  return (
    (1 * radius * direction-x + offset-x, 0 * radius * direction-y + offset-y),
    (.86229169 * radius * direction-x + offset-x, 0 * radius * direction-y + offset-y),
    (.72310817 * radius * direction-x + offset-x, .001871757 * radius * direction-y + offset-y),
    (.58952678 * radius * direction-x + offset-x, .035332154 * radius * direction-y + offset-y),
    (.45594539 * radius * direction-x + offset-x, .068792552 * radius * direction-y + offset-y),
    (.32942907 * radius * direction-x + offset-x, .13468007 * radius * direction-y + offset-y),
    (.23205457 * radius * direction-x + offset-x, .23205457 * radius * direction-y + offset-y),
    (.13468007 * radius * direction-x + offset-x, .32942907 * radius * direction-y + offset-y),
    (.068792552 * radius * direction-x + offset-x, .45594539 * radius * direction-y + offset-y),
    (.035332154 * radius * direction-x + offset-x, .58952678 * radius * direction-y + offset-y),
    (.001871757 * radius * direction-x + offset-x, .72310817 * radius * direction-y + offset-y),
    (0 * radius * direction-x + offset-x, .86229169 * radius * direction-y + offset-y),
    (0 * radius * direction-x + offset-x, 1 * radius * direction-y + offset-y),
  )
}

#let spiro-rounded-corner-components(
  vertices: (),
) = {
  return (
    curve.cubic(vertices.at(1), vertices.at(2), vertices.at(3)),
    curve.cubic(vertices.at(4), vertices.at(5), vertices.at(6)),
    curve.cubic(vertices.at(7), vertices.at(8), vertices.at(9)),
    curve.cubic(vertices.at(10), vertices.at(11), vertices.at(12)),
  )
}

#let spiro-rounded-rect-components(
  width: line-spacing * 4,
  height: line-spacing * 4,
  radius: line-spacing * 2,
) = {
  let vertices = spiro-rounded-rect-vertices.with(radius: radius)
  let tl = vertices(offset-x: 0em, offset-y: 0em, direction-x: 1, direction-y: 1)
  let bl = vertices(offset-x: 0em, offset-y: height, direction-x: 1, direction-y: -1).rev()
  let br = vertices(offset-x: width, offset-y: height, direction-x: -1, direction-y: -1)
  let tr = vertices(offset-x: width, offset-y: 0em, direction-x: -1, direction-y: 1).rev()

  return (
    curve.move(tl.at(0)),
    ..spiro-rounded-corner-components(vertices: tl),
    curve.line(bl.at(0)),
    ..spiro-rounded-corner-components(vertices: bl),
    curve.line(br.at(0)),
    ..spiro-rounded-corner-components(vertices: br),
    curve.line(tr.at(0)),
    ..spiro-rounded-corner-components(vertices: tr),
    curve.close(mode: "straight"),
  )
}

#let spiro-rounded-rect(
  width: auto,
  height: auto,
  fill: none,
  stroke: auto,
  radius: line-spacing * 2,
  inset: line-spacing * 1.5,
  outset: (:),
  body,
) = {
  layout(size => {
    let measurement = measure(
      body,
      width: size.width - to-inset(inset).left - to-inset(inset).right,
      height: size.height,
    )

    let calculated-width = if width == auto {
      (
        measurement.width
          + to-inset(inset).left
          + to-inset(inset).right
          + to-inset(outset).left
          + to-inset(outset).right
          + .0000000000001pt
      )
    } else {
      width + to-inset(outset).left + to-inset(outset).right + .0000000000001pt
    }
    let calculated-height = if height == auto {
      (
        measurement.height
          + to-inset(inset).top
          + to-inset(inset).bottom
          + to-inset(outset).top
          + to-inset(outset).bottom
          + .0000000000001pt
      )
    } else {
      height + to-inset(outset).top + to-inset(outset).bottom + .0000000000001pt
    }

    block[
      #place(
        alignment.top + alignment.left,
        dx: to-inset(outset).left * -1,
        dy: to-inset(outset).top * -1,
        curve(
          fill: fill,
          stroke: stroke,
          ..spiro-rounded-rect-components(
            width: calculated-width,
            height: calculated-height,
            radius: radius,
          ),
        ),
      )
      #block(
        width: calculated-width - to-inset(outset).left - to-inset(outset).right,
        height: calculated-height - to-inset(outset).top - to-inset(outset).bottom,
        inset: inset,
        body,
      )
    ]
  })
}
