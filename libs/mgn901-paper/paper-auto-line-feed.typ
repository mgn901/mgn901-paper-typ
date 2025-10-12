#import "utils.typ": q

#let paper-auto-line-feed(
  body,
  line-spacing: q(28 - 16),
  text-size: q(14),
  scope: "column",
) = {
  layout(size => {
    let height = (
      measure(
        width: if scope == "parent" {
          page.width - page.margin.left.length - page.margin.right.length
        } else {
          size.width
        },
        body,
      ).height
    )
    let new-height = (
      calc.floor(height / (line-spacing + text-size) + 1) * (line-spacing + text-size) - line-spacing
    )

    block(height: new-height, spacing: auto, body)
  })
}
