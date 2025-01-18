#import "../mgn901-paper/utils.typ": q

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
    font-features: (ss01: 1, ss02: 1, ss03: 1, zero: 1, tnum: 1),
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
  default: font-settings-presets.serif,
  heading: font-settings-presets.heading,
  footnote: font-settings-presets.serif,
  small: font-settings-presets.serif,
  monospace: font-settings-presets.monospace,
  strong: font-settings-presets.sans,
)
