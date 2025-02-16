#let running-head-state = state("mgn901-paper.running-head", ((body: [], abbr: []),))

#let running-head(body, abbr) = {
  running-head-state.update(old => {
    old.push((body: body, abbr: abbr))
    old
  })
}
