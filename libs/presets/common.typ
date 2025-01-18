#import "../mgn901-paper/utils.typ": q

#let font-settings-presets = (
  serif: (
    font-family: (
      latin: ("Nimbus Roman", "Times New Roman", "Century", "Libertinus Serif", "New Computer Modern"),
      cjk: (
        "Source Han Serif JP",
        "Noto Serif CJK JP",
        "Hiragino Mincho Pr6N",
        "Hiragino Mincho ProN",
        "YuMincho",
        "Yu Mincho",
        "MS Mincho",
      ),
    ),
    font-weight: 400,
    font-features: (:),
  ),
  sans: (
    font-family: (
      latin: ("Helvetica Neue", "Helvetica", "Arial"),
      cjk: (
        "Source Han Sans JP",
        "Noto Sans CJK JP",
        "Hiragino Sans",
        "YuGothic",
        "Yu Gothic",
        "MS Gothic",
      ),
    ),
    font-weight: 500,
    font-features: (:),
  ),
  heading: (
    font-family: (
      latin: ("Helvetica Neue", "Helvetica", "Arial"),
      cjk: (
        "Source Han Sans JP",
        "Noto Sans CJK JP",
        "Hiragino Sans",
        "YuGothic",
        "Yu Gothic",
        "MS Gothic",
      ),
    ),
    font-weight: 700,
    font-features: (:),
  ),
  monospace: (
    font-family: (
      latin: ("Courier New", "Dejavu Sans Mono"),
      cjk: (
        "Source Han Sans JP",
        "Noto Sans CJK JP",
        "Hiragino Sans",
        "YuGothic",
        "Yu Gothic",
        "MS Gothic",
      ),
    ),
    font-weight: 400,
    font-features: (:),
  ),
)

#let font-settings-presets-paper = (
  default: font-settings-presets.serif,
  heading: font-settings-presets.heading,
  footnote: font-settings-presets.serif,
  small: font-settings-presets.serif,
  monospace: font-settings-presets.monospace,
  strong: font-settings-presets.sans,
)
