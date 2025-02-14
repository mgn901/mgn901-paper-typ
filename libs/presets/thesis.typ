#import "../mgn901-paper/utils.typ": q
#import "common.typ": font-settings-presets-paper as font-settings

#let page-settings = (
  width: 210mm,
  height: 297mm,
  column-numbers: 1,
  column-gap: 3em,
  line-length: 38,
  line-numbers: 33,
)

#let type-settings = (
  default: (
    font-size: q(16),
    line-height: q(28),
    first-line-indent: 1em,
  ),
  footnote: (
    font-size: q(14),
    line-height: q(20),
  ),
  small: (
    font-size: q(13),
    line-height: q(18),
  ),
  monospace: (
    font-size: 1em / 0.8,
    line-height: q(28),
  ),
  frontmatter-title: (
    font-size: q(36),
    line-height: q(50),
  ),
  frontmatter-default: (
    font-size: q(26),
    line-height: q(40),
  ),
  frontmatter-small: (
    font-size: q(22),
    line-height: q(36),
  ),
)

#let heading-type-settings = (
  (
    font-size: q(28),
    line-height: q(28),
    first-line-indent: 0em,
    justify: false,
    spacing-par: 0em,
    spacing-heading: 0em,
    line-feeding: 4,
    padding-top: 0em,
    padding-bottom: 0em,
  ),
  (
    font-size: q(24),
    line-height: q(28),
    first-line-indent: 0em,
    justify: false,
    spacing-par: q(28),
    spacing-heading: 0em,
    line-feeding: 3,
    padding-top: 0em,
    padding-bottom: 0em,
  ),
  (
    font-size: q(20),
    line-height: q(28),
    first-line-indent: 0em,
    justify: false,
    spacing-par: q(28),
    spacing-heading: 0em,
    line-feeding: 2,
    padding-top: 0em,
    padding-bottom: 0em,
  ),
  (
    font-size: q(18),
    line-height: q(28),
    first-line-indent: 0em,
    justify: false,
    spacing-par: q(28),
    spacing-heading: 0em,
    line-feeding: 1,
    padding-top: 0em,
    padding-bottom: 0em,
  ),
  (
    font-size: q(16),
    line-height: q(28),
    first-line-indent: 0em,
    justify: false,
    spacing-par: q(28),
    spacing-heading: 0em,
    line-feeding: 1,
    padding-top: 0em,
    padding-bottom: 0em,
  ),
)
