#let cite(label) = {
  [#metadata(label)<mgn901-paper.refs>]

  context {
    let references = query(selector(<mgn901-paper.refs>).before(here()))
    let first-occured-at = references.map(md => md.value).dedup().position(l => l == label)

    numbering("[1]", first-occured-at + 1)
  }
}
