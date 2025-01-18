#let q(number) = number * 1mm / 4

#let marker(body, width: 2em) = context {
  let adjust = (width - measure(body).width) / 2

  box([#h(adjust)#body#h(adjust)])
}
