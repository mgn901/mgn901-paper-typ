#import "common-page.typ": common-page
#import "common-enum.typ": common-enum
#import "common-perpage-bibliography.typ": common-perpage-bibliography, references
#import "slide-running-head.typ": running-head-state
#import "type-style.typ": inline-type-style, type-style
#import "font-style.typ": font-style
#import "../diagram/spiro-rounded-rect.typ": spiro-rounded-rect
#import "../presets/common.typ": color-presets
#import "../presets/slide.typ": type-settings, font-settings
#import "utils.typ": q

#let slide-page(
  body,
  width: 210mm,
  height: 297mm,
  column-numbers: 1,
  column-gap: 3em,
  line-length: 36,
  line-numbers: 32,
  line-height: q(30),
  font-size: q(17),
  default-type-settings: type-settings.default,
  running-head-title-type-settings: type-settings.footnote,
  running-head-type-settings: type-settings.bibliography,
  running-head-default-font-settings: font-settings.default,
  running-head-strong-font-settings: font-settings.strong,
  bibliography-type-settings: type-settings.small,
  bibliography-font-settings: font-settings.default,
  nombre: true,
) = {
  show: common-page.with(
    width: width,
    height: height,
    column-numbers: column-numbers,
    column-gap: column-gap,
    line-length: line-length,
    line-numbers: line-numbers,
    line-height: line-height,
    font-size: font-size,
    nombre: nombre,
  )

  set page(
    foreground: context [
      #show: common-enum.with(marker-width: 2em, numbering-pattern: "[1]")

      #place(
        grid(
          rows: (1fr, auto),
          row-gutter: 0em,
          inset: (
            x: (width - font-size * line-length * column-numbers - (column-gap * (column-numbers - 1))) / 2,
            y: (page.height - line-height * (line-numbers + 1)) / 2,
          ),
          align: start + top,
          type-style(..type-settings.footnote, running-head-state.get().last().at("body")),
          [
            #type-style(
              ..type-settings.bibliography,
              range(references.get().len())
                .zip(references.get())
                .map(item => enum.item(item.at(0) + 1, cite(item.at(1), form: "full")))
                .join(),
            )
          ]
        ),
      )

      #place(
        grid(
          columns: (
            1fr,
            (width - font-size * line-length * column-numbers - (column-gap * (column-numbers - 1))) / 2,
          ),
          inset: (
            x: type-settings.bibliography.font-size,
            y: (page.height - line-height * (line-numbers - 1)) / 2,
          ),
          [],
          type-style(
            ..type-settings.bibliography,
            if running-head-state.get().slice(1).len() == 0 { } else {
              grid(
                align: center,
                row-gutter: type-settings.bibliography.line-height / 4,
                ..range(running-head-state.final().slice(1).len())
                  .zip(running-head-state.final().slice(1))
                  .map(item => {
                    if item.at(0) == running-head-state.get().slice(1).len() - 1 {
                      spiro-rounded-rect(
                        width: 100%,
                        inset: type-settings.bibliography.line-height / 4,
                        outset: 0em,
                        radius: type-settings.bibliography.line-height / 2,
                        stroke: none,
                        fill: color-presets.red.at(3),
                        font-style(
                          ..running-head-strong-font-settings,
                          color: color-presets.red.at(8),
                          item.at(1).at("abbr"),
                        ),
                      )
                    } else {
                      spiro-rounded-rect(
                        width: 100%,
                        inset: type-settings.bibliography.line-height / 4,
                        outset: 0em,
                        radius: type-settings.bibliography.line-height / 2,
                        stroke: none,
                        fill: color-presets.red.at(2),
                        font-style(
                          ..running-head-default-font-settings,
                          color: color-presets.red.at(8),
                          item.at(1).at("abbr"),
                        ),
                      )
                    }
                  })
                  .intersperse(font-style(..running-head-default-font-settings, color: color-presets.red.at(3), [▼])),
              )
            },
          ),
        ),
      )

      #place(
        grid(
          align: center,
          columns: (
            1fr,
            (width - font-size * line-length * column-numbers - (column-gap * (column-numbers - 1))) / 2,
          ),
          inset: (
            x: type-settings.bibliography.font-size,
            y: (page.height - line-height * (line-numbers + 1)) / 2,
          ),
          [],
          type-style(
            ..type-settings.small,
            font-style(
              ..bibliography-font-settings,
              color: color-presets.red.at(8),
              numbering("1", ..counter(page).get()),
            ),
          ),
        ),
      )
    ],
  )

  body
}
