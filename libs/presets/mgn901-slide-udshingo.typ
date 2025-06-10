#import "../mgn901-paper/utils.typ": q
#import "common.typ": color-presets

#let page-settings = (
  width: 451.56mm,
  height: 254mm,
  column-numbers: 1,
  column-gap: 3em,
  line-length: 30,
  line-numbers: 14,
  nombre: false,
)

#let type-settings = (
  default: (
    font-size: q(50),
    line-height: q(62),
  ),
  footnote: (
    font-size: q(38),
    line-height: q(44),
  ),
  small: (
    font-size: q(32),
    line-height: q(38),
  ),
  bibliography: (
    font-size: q(24),
    line-height: q(28),
  ),
  monospace: (
    font-size: 1em / 0.8,
    line-height: q(62),
  ),
  frontmatter-title: (
    font-size: q(70),
    line-height: q(80),
  ),
  frontmatter-default: (
    font-size: q(56),
    line-height: q(62),
  ),
  frontmatter-small: (
    font-size: q(50),
    line-height: q(62),
  ),
)

#let heading-type-settings = (
  (
    font-size: q(62),
    line-height: q(70),
    spacing-par: 0em,
    spacing-heading: 0em,
    line-feeding: 2,
    padding-top: 0em,
    padding-bottom: 0em,
  ),
  (
    font-size: q(56),
    line-height: q(62),
    spacing-par: 0em,
    spacing-heading: 0em,
    line-feeding: 1.5,
    padding-top: 0em,
    padding-bottom: 0em,
  ),
  (
    font-size: q(50),
    line-height: q(62),
    spacing-par: 0em,
    spacing-heading: 0em,
    line-feeding: 1,
    padding-top: 0em,
    padding-bottom: 0em,
  ),
)

#let font-settings-presets = (
  serif: (
    font-family: (
      latin: ("Inter",),
      cjk: (
        "A P-OTF UD Shin Go Pr6N L",
        "Source Han Sans JP",
      ),
    ),
    font-weight: 300,
    font-features: (ss01: 1, ss02: 1, ss03: 1, zero: 1, tnum: 1),
  ),
  sans: (
    font-family: (
      latin: ("Inter",),
      cjk: (
        "A P-OTF UD Shin Go Pr6N M",
        "Source Han Sans JP",
      ),
    ),
    font-weight: 500,
    font-features: (ss01: 1, ss02: 1, ss03: 1, zero: 1, tnum: 1, palt: 0),
  ),
  heading: (
    font-family: (
      latin: ("Inter",),
      cjk: (
        "A P-OTF UD Shin Go Pr6N DB",
        "Source Han Sans JP",
      ),
    ),
    font-weight: 600,
    font-features: (ss01: 1, ss02: 1, ss03: 1, zero: 1, tnum: 1, palt: 1),
  ),
  monospace: (
    font-family: (
      latin: ("Roboto Mono",),
      cjk: (
        // "A P-OTF UD Shin Go Pr6N L",
        "Source Han Sans JP",
      ),
    ),
    font-weight: 400,
    font-features: (:),
  ),
)

#let font-settings = (
  default: (..font-settings-presets.serif, color: color-presets.gray1.at(8)),
  heading: font-settings-presets.heading,
  footnote: font-settings-presets.serif,
  small: font-settings-presets.serif,
  monospace: font-settings-presets.monospace,
  strong: font-settings-presets.sans,
)
