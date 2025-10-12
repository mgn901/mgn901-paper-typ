#import "@preview/tiptoe:0.2.0"
#import "../mgn901-paper/utils.typ": q
#import "../presets/common.typ": color-presets

#let node-layout = state("mgn901-paper.node-layout", (:))

#let port-pos(
  x: 0em,
  y: 0em,
  width: 0em,
  height: 0em,
  sep: .25em,
  port: center + horizon,
  rev: false,
) = {
  let factor_rev = if rev { -1 } else { 1 }

  let return_x = if port.x == alignment.left {
    x - sep * factor_rev
  } else if port.x == alignment.right {
    x + sep * factor_rev + width * factor_rev
  } else {
    x + width / 2 * factor_rev
  }

  let return_y = if port.y == alignment.top {
    y - sep * factor_rev
  } else if port.y == alignment.bottom {
    y + sep * factor_rev + height * factor_rev
  } else {
    y + height / 2 * factor_rev
  }

  (x: return_x, y: return_y)
}

#let select-port(direction) = {
  if direction == "tb" {
    (bottom + center, top + center)
  } else if direction == "bt" {
    (top + center, bottom + center)
  } else if direction == "lr" {
    (right + horizon, left + horizon)
  } else if direction == "rl" {
    (left + horizon, right + horizon)
  } else {
    (center + horizon, center + horizon)
  }
}

#let straight(
  length: 3pt + 450%,
  width: auto,
  rev: false,
  stroke: auto,
  line: stroke(),
) = {
  let processed-stroke = tiptoe.utility.process-stroke(line, stroke)
  let alpha = calc.atan(width / 2 / length)
  let tip-length = processed-stroke.thickness / 2 / calc.sin(alpha)

  let mark = place(
    curve(
      curve.move((-length - tip-length, 0.5 * width)),
      curve.line((0pt - tip-length, 0pt)),
      curve.line((-length - tip-length, -0.5 * width)),
      stroke: std.stroke(
        thickness: processed-stroke.thickness,
        paint: tiptoe.utility.if-auto(processed-stroke.paint, black),
        dash: processed-stroke.dash,
        miter-limit: 7,
        cap: "butt",
      ),
    ),
  )


  if rev {
    mark = scale(x: -100%, place(mark, dx: length))
  }

  (
    mark: mark,
    end: if rev { length - tip-length } else { tip-length },
  )
}

#let node(label, body) = {
  box[
    #layout(size => context {
      let measurement = measure(
        body,
        width: size.width,
        height: size.height,
      )
      let position = here().position()
      node-layout.update(old => {
        old.insert(
          str(label),
          (measurement: measurement, position: position),
        )
        old
      })
      [#body]
    })
  ]
}

#let edge(
  label1,
  label2,
  body,
  direction: "lr",
  start-sep: .25em,
  end-sep: .25em,
  label-sep: .25em,
  label-pos: center + horizon,
  path-func: tiptoe.path.with(tip: straight.with(width: .5em, length: .25em)),
) = context {
  let (port1, port2) = select-port(direction)

  let layout1 = node-layout.get().at(str(label1))
  let layout2 = node-layout.get().at(str(label2))
  let measurement = measure(body)

  let (x: x1, y: y1) = port-pos(
    x: layout1.position.x,
    y: layout1.position.y,
    width: layout1.measurement.width,
    height: layout1.measurement.height,
    sep: start-sep,
    port: port1,
  )
  let (x: port-x2, y: port-y2) = port-pos(
    x: layout2.position.x,
    y: layout2.position.y,
    width: layout2.measurement.width,
    height: layout2.measurement.height,
    sep: end-sep,
    port: port2,
  )
  let x2 = if direction == "tb" or direction == "bt" { x1 } else { port-x2 }
  let y2 = if direction == "lr" or direction == "rl" { y1 } else { port-y2 }
  let (x: x3, y: y3) = port-pos(
    x: x1 + (x2 - x1) / 2,
    y: y1 + (y2 - y1) / 2,
    width: measurement.width,
    height: measurement.height,
    sep: label-sep,
    port: label-pos,
    rev: true,
  )

  place(
    alignment.top + alignment.left,
    dx: x1 - page.margin.left,
    dy: y1 - page.margin.top,
    path-func(
      (0em, 0em),
      (x2 - x1, y2 - y1),
    ),
  )
  place(
    alignment.top + alignment.left,
    dx: x3 - page.margin.left,
    dy: y3 - page.margin.top,
    body,
  )
}

#let annotation-node(
  label,
  from,
  body,
  x: 0em,
  y: 0em,
  direction: auto,
  start-sep: 0em,
  path-func: tiptoe.path.with(toe: tiptoe.circle.with(align: end, width: 300%, length: 300%)),
) = {
  layout(size => {
    let measurement = measure(
      body,
      width: size.width,
      height: size.height,
    )

    context {
      let layout1 = node-layout.get().at(str(from))
      let (x: x1, y: y1) = port-pos(
        x: layout1.position.x,
        y: layout1.position.y,
        width: layout1.measurement.width,
        height: layout1.measurement.height,
        sep: start-sep,
        port: select-port(direction).at(0),
      )
      let (x: port-x2, y: port-y2) = port-pos(
        x: x + page.margin.left,
        y: y + page.margin.top,
        width: 0em,
        height: 0em,
        sep: 0em,
        port: select-port(direction).at(1),
      )
      let x2 = if direction == "tb" or direction == "bt" { x1 } else { port-x2 }
      let y2 = if direction == "lr" or direction == "rl" { y1 } else { port-y2 }
      let (x: x3, y: y3) = port-pos(
        x: x2,
        y: y2,
        width: measurement.width,
        height: measurement.height,
        sep: 0em,
        port: select-port(direction).at(1),
        rev: true,
      )

      place(
        alignment.top + alignment.left,
        dx: x3 - here().position().x,
        dy: y3 - here().position().y,
        box(node(label, body)),
      )
    }
  })
  edge(from, label, direction: direction, start-sep: start-sep, end-sep: 0em, path-func: path-func, [])
}
