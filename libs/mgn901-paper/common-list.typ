#import "../mgn901-paper/utils.typ": marker

#let common-list(
  body,
  markers: ([$bullet$], [$dash$], [$ast$], [$dot$]),
  marker-width: 2em,
) = {
  set list(
    body-indent: 0em,
    indent: 0em,
    marker: markers.map(m => marker(m, width: marker-width)),
  )

  body
}
