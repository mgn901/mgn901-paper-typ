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
  radius: 0em,
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
  vertices.slice(1).chunks(3).map(chunk => curve.cubic(chunk.at(0), chunk.at(1), chunk.at(2)))
}

#let spiro-rounded-rect-components(
  width: 1em,
  height: 1em,
  radius: 0em,
  outset: (top: 0em, left: 0em, right: 0em, bottom: 0em),
) = {
  let vertices = spiro-rounded-rect-vertices.with(radius: radius)
  let tl = vertices(offset-x: -outset.left, offset-y: -outset.top, direction-x: 1, direction-y: 1)
  let bl = vertices(offset-x: -outset.left, offset-y: height + outset.bottom, direction-x: 1, direction-y: -1).rev()
  let br = vertices(offset-x: width + outset.right, offset-y: height + outset.bottom, direction-x: -1, direction-y: -1)
  let tr = vertices(offset-x: width + outset.right, offset-y: -outset.top, direction-x: -1, direction-y: 1).rev()

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
  radius: 0em,
  inset: (:),
  outset: (:),
  body,
) = {
  let wrappedBody = rect(
    width: width,
    height: height,
    inset: inset,
    outset: outset,
    fill: none,
    stroke: none,
    radius: (:),
    body,
  )

  layout(size => {
    let calculated-size = measure(wrappedBody, width: size.width, height: size.height)

    rect(
      width: calculated-size.width,
      height: calculated-size.height,
      inset: 0em,
      outset: 0em,
      fill: none,
      stroke: none,
      radius: (:),
    )[
      #place(curve(
        fill: fill,
        stroke: stroke,
        ..spiro-rounded-rect-components(
          width: calculated-size.width,
          height: calculated-size.height,
          radius: radius,
          outset: to-inset(outset),
        ),
      ))
      #wrappedBody
    ]
  })
}
