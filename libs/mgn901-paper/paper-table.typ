#import "utils.typ": q

#let paper-table(body) = {
  set table(
    align: alignment.top + alignment.start,
    stroke: (
      top: (thickness: q(0.5)),
      left: none,
      bottom: (thickness: q(0.5)),
      right: none,
    ),
  )

  body
}
