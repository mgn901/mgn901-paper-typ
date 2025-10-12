#import "@preview/tiptoe:0.2.0"
#import "../mgn901-paper/style.typ": style
#import "node-edge.typ": annotation-node, edge, node, straight
#import "spiro-rounded-rect.typ": spiro-rounded-rect

#let themed-shape(
  node-style-tokens: (),
  edge-style-tokens: (),
  annotation-node-style-tokens: (),
) = {
  (
    node: (..args, body, style-tokens: ()) => style(
      (..node-style-tokens, ..style-tokens),
      (f, _) => (f.spiro-rounded-rect)(..args, body),
    ),
    edge: (..args, body, style-tokens: ()) => style(
      (..edge-style-tokens, ..style-tokens),
      (f, _) => edge(
        ..args,
        body,
        path-func: f.tiptoe-path.with(tip: straight.with(width: .75em, length: .375em)),
      ),
    ),
    annotation-node: (..args, body, style-tokens: ()) => style(
      (..edge-style-tokens, ..style-tokens),
      (f, _) => annotation-node(
        ..args,
        style(
          (..annotation-node-style-tokens, ..style-tokens),
          (f, _) => (f.spiro-rounded-rect)(body),
        ),
        path-func: f.tiptoe-path.with(
          toe: tiptoe.circle.with(align: end, width: 400%, length: 400%),
        ),
      ),
    ),
  )
}
