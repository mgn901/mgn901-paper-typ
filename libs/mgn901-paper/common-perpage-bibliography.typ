#let references = state("mgn901-paper.multiple-bibliography.references", ())

#let common-perpage-bibliography(body) = {
  show pagebreak: it => {
    context {
      it

      references.update(())
    }
  }

  show bibliography: it => { }

  body
}

#let cite(label) = {
  references.update(old => {
    old.push(label)

    old
  })

  context {
    let length = references.get().len()
    numbering("[1]", length)
  }
}
