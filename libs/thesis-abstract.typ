#import "mgn901-paper/utils.typ": set-lang

#let thesis-abstract(..abstract-list, set-page: true) = {
  show heading.where(level: 1): set heading(numbering: none)

  if set-page {
    set page(numbering: "i")
    counter(page).update(1)
  }

  for entry in abstract-list.pos().enumerate() {
    show: set-lang.with(entry.at(1).lang)
    heading(entry.at(1).heading, outlined: entry.at(0) == 0)
    parbreak()
    entry.at(1).body
    parbreak()
  }
}
