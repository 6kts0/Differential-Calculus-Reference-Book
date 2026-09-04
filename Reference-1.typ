#import "@preview/eqalc:0.1.4": math-to-func
#import "@preview/cetz:0.4.0"
#import "@preview/cetz-plot:0.1.2": plot

#set text(
  size: 11pt
)

#set page(
  numbering: "1",
  number-align: right + bottom
)

#align(right)[#text(size:8pt)[*Faba kouyate*]]
#align(right)[#text(size:8pt)[*(619) 215-3789*]]

#align(center)[#text(size:15pt)[*Calculus 1 Reference*]]

#line(length: 100%)

#text(size:13pt)[*Sec 2.1* A Preview of Calculus]

#text(fill:rgb("#7d1e1e"),size:15pt)[*The Tangent Problem and Differential Calculus*]

#set figure(
  supplement: [Fig.],
  numbering: n => numbering("1.1", counter(heading).get().first(), n),
)

#show heading.where(level: 1): it => {
  counter(figure.where(kind: image)).update()
  it
}

#figure(
  image("Assets/Graph-img-1.jpg", width:55%),
  caption: [
    The rate of change of a linear function is constant in each of these three graphs, with the constant determined by the slope.
  ],
)

As we move from left to right along the of $f(x) = -2x - 3$, we see that the graph decreases at a constant rate. For every 1 unit we move to the right along the x-axis, the y-coordinate decreases by 2 units. 
