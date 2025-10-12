#import "paper-auto-line-feed.typ": paper-auto-line-feed
#import "utils.typ": q

#let paper-math(
  body,
  line-spacing: q(28 - 16),
  text-size: q(16),
  auto-line-feed: true,
) = {
  show math.equation.where(block: true): it => if auto-line-feed == true {
    paper-auto-line-feed(it, line-spacing: line-spacing, text-size: text-size, scope: "column")
  } else {
    it
  }

  body
}
