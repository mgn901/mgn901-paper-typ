#import "../presets/thesis.typ": font-settings, type-settings, heading-type-settings
#import "state.typ": dist-from-heading, inside-of-heading
#import "mpl.typ": create-mpl
#import "type-style.typ": type-style
#import "utils.typ": q

#let mpl = create-mpl(font-settings: font-settings, type-settings: type-settings)

#let paper-heading(
  body,
  default-type-settings: type-settings.default,
  heading-type-settings: heading-type-settings.at(0),
  label-width: auto,
  break-before: false,
  line-feeding: 1,
  type-heading: type-style.with(
    font-size: heading-type-settings.at(0).font-size,
    line-height: heading-type-settings.at(0).line-height,
    first-line-indent: heading-type-settings.at(0).first-line-indent,
    justify: false,
  ),
  font-heading: mpl.font-heading,
) = {
  show heading: it => {
    inside-of-heading.update(true)

    if break-before == true {
      pagebreak()
    }

    type-heading(
      font-heading[
        #v(
          heading-type-settings.line-height - default-type-settings.font-size,
          weak: true,
        ) // 前の段落と見出し段落の間隔（デフォルトを上書き）
        #context if dist-from-heading.get() < 2 {
          v(heading-type-settings.spacing-heading) // 連続する見出しの間隔
        } else {
          v(heading-type-settings.spacing-par)
        }
        #block(breakable: false, sticky: true, width: 100%)[
          #let new-label-width = if label-width == auto { it.level * 1em } else { label-width }
          #let centerize = heading-type-settings.font-size - default-type-settings.font-size
          #let line-feeding-height = (heading-type-settings.line-feeding - 1) * heading-type-settings.line-height
          #v((
            default-type-settings.font-size - heading-type-settings.font-size
          )) // blockの大きさを通常段落行に合わせる（文字が大きくなって行が太る分を吸収する）
          #v(heading-type-settings.padding-top)
          #v((line-feeding-height + centerize) / 2) // n+1行取り見出しにする
          #if it.numbering != none {
            par(hanging-indent: new-label-width + 1em)[
              #box(width: new-label-width + 1em)[
                #numbering(it.numbering, ..counter(it.func()).at(it.location()))
              ]#it.body
            ]
          } else {
            it.body
          }
          #v((line-feeding-height - centerize) / 2) // n+1行取り見出しにする
          #v(heading-type-settings.padding-bottom)
        ]
        #v(
          heading-type-settings.line-height - default-type-settings.font-size,
          weak: true,
        ) // 後の段落と見出し段落の間隔
      ],
    )

    dist-from-heading.update(0)
    inside-of-heading.update(false)
  }

  body
}
