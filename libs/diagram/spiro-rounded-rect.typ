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

#let reverse-if-needed(array, corner) = {
  if corner == "tl" or corner == "br" { array.rev() } else { array }
}

#let spiro-rounded-corner-vertices(
  corner: "tl",
  width: line-spacing * 4,
  height: line-spacing * 4,
  radius: line-spacing * 2,
) = {
  let (factor_cnt_x, factor_cnt_y) = (
    tl: (-1, 1),
    tr: (-1, -1),
    br: (1, -1),
    bl: (1, 1),
  ).at(corner)

  let (factor_vrt_x, factor_vrt_y) = (
    tl: (1, 1),
    tr: (-1, 1),
    br: (-1, -1),
    bl: (1, -1),
  ).at(corner)

  let (dx, dy) = (
    tl: (0%, 0%),
    tr: (width, 0%),
    br: (width, height),
    bl: (0%, height),
  ).at(corner)

  return reverse-if-needed(
    (
      ((dx + radius * factor_vrt_x, dy),),
      (
        (dx + 0.589518233 * radius * factor_vrt_x, dy + 0.03531901 * radius * factor_vrt_y),
        (0.133581259 * radius * factor_cnt_x, 0.033460363 * radius * factor_cnt_y),
      ),
      (
        (dx + 0.23209635 * radius * factor_vrt_x, dy + 0.23209635 * radius * factor_vrt_y),
        (0.097374408 * radius * factor_cnt_x, 0.097374408 * radius * factor_cnt_y),
      ),
      (
        (dx + 0.03531901 * radius * factor_vrt_x, dy + 0.589518233 * radius * factor_vrt_y),
        (0.033460363 * radius * factor_cnt_x, 0.133581259 * radius * factor_cnt_y),
      ),
      ((dx, dy + radius * factor_vrt_y),),
    ),
    corner,
  )
}

#let spiro-rounded-rect-vertices(
  width: line-spacing * 4,
  height: line-spacing * 4,
  radius: line-spacing * 2,
) = {
  (
    ..spiro-rounded-corner-vertices(corner: "tl", width: width, height: height, radius: to-radius(radius).top-left),
    ..spiro-rounded-corner-vertices(corner: "tr", width: width, height: height, radius: to-radius(radius).top-right),
    ..spiro-rounded-corner-vertices(corner: "br", width: width, height: height, radius: to-radius(radius).bottom-right),
    ..spiro-rounded-corner-vertices(corner: "bl", width: width, height: height, radius: to-radius(radius).bottom-left),
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
      width: size.width,
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
        path(
          fill: fill,
          stroke: stroke,
          ..spiro-rounded-rect-vertices(
            width: calculated-width,
            height: calculated-height,
            radius: radius,
          ),
          closed: true,
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
