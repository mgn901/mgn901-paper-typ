#import "../mgn901-paper/utils.typ": q
#import "common.typ": font-settings-presets-paper as font-settings

#let page-settings = (
  width: 210mm,
  height: 297mm,
  column-numbers: 2,
  column-gap: 3em,
  line-length: 26,
  line-numbers: 50,
  nombre: true,
)

#let type-settings = (
  default: (
    font-size: q(13),
    line-height: q(20),
  ),
  footnote: (
    font-size: q(11),
    line-height: q(14),
  ),
  small: (
    font-size: q(9),
    line-height: q(12),
  ),
  monospace: (
    font-size: 1em / 0.8,
    line-height: q(20),
  ),
  frontmatter-title: (
    font-size: q(20),
    line-height: q(20),
  ),
  frontmatter-default: (
    font-size: q(16),
    line-height: q(20),
  ),
  frontmatter-small: (
    font-size: q(15),
    line-height: q(20),
  ),
)

#let heading-type-settings = (
  (
    font-size: q(16),
    line-height: q(20),
    spacing-par: 0em,
    spacing-heading: 0em,
    line-feeding: 2,
    padding-top: 0em,
    padding-bottom: 0em,
  ),
  (
    font-size: q(13),
    line-height: q(20),
    spacing-par: q(20),
    spacing-heading: 0em,
    line-feeding: 1,
    padding-top: 0em,
    padding-bottom: 0em,
  ),
  (
    font-size: q(13),
    line-height: q(20),
    spacing-par: 0em,
    spacing-heading: 0em,
    line-feeding: 1,
    padding-top: 0em,
    padding-bottom: 0em,
  ),
)
