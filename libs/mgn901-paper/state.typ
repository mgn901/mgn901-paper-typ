#let dist-from-heading = state("mgn901-paper.next-of-heading", 0)
#let inside-of-heading = state("mgn901-paper.inside-of-heading", false)
#let inside-of-bibliography = state("mgn901-paper.inside-of-bibliography", false)

#let update-dist-from-heading(body) = {
  show selector(parbreak): it => {
    context {
      if inside-of-heading.get() == false {
        dist-from-heading.update(dist-from-heading.get() + 1)
      }
    }
    it
  }

  body
}
