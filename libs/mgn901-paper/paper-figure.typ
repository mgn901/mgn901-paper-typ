#import "paper-auto-line-feed.typ": paper-auto-line-feed
#import "utils.typ": q

#let paper-figure(
  body,
  line-spacing: q(28 - 16),
  text-size: q(16),
  caption-styler: it => { it },
  caption-label-styler: it => { it },
  auto-line-feed: true,
) = {
  show figure.caption: it => context {
    caption-styler[
      #grid(
        columns: (auto, auto),
        rows: 1,
        gutter: 1em,
        caption-label-styler[#it.supplement #numbering(it.numbering, ..it.counter.at(here()))],
        align(alignment.start, it.body),
      )
    ]
  }

  show figure: it => {
    let spacer = v(line-spacing, weak: true)

    let content-with-caption(jt) = {
      if it.kind == table [#it.caption#spacer#jt] else [#jt#spacer#it.caption]
    }

    let line-feed-styler(jt) = if auto-line-feed == true {
      paper-auto-line-feed(
        line-spacing: line-spacing,
        text-size: text-size,
        scope: it.scope,
        jt,
      )
    } else { jt }

    let placement-styler(jt) = if (
      it.placement == alignment.top or it.placement == alignment.bottom
    ) {
      place(
        it.placement + alignment.center,
        scope: it.scope,
        float: true,
        clearance: line-spacing * 2 + text-size,
        jt,
      )
    } else if it.placement == auto {
      place(
        auto,
        scope: it.scope,
        float: true,
        clearance: line-spacing * 2 + text-size,
        jt,
      )
    } else {
      jt
    }

    placement-styler(line-feed-styler(content-with-caption(it.body)))
  }

  body
}
