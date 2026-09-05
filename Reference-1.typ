#import "@preview/eqalc:0.1.4": math-to-func
#import "@preview/cetz:0.4.0"
#import "@preview/cetz-plot:0.1.2": plot

#let accent = rgb("#7d1e1e")

#set page(
  fill: rgb("#50635b44"),
  numbering: "1",
  number-align: right + bottom
)
#set figure.caption(separator: [])
#set figure(
  supplement: [Figure],
  numbering: n => {
    let ch = counter(heading).get().at(1, default: 1)
    if ch == 0 { numbering("1", n) } else { numbering("1.1", ch, n) }
  },
)

// Header, Contact-info, title
#align(right)[#text(size:8pt)[*Faba kouyate*]]
#align(right)[#text(size:8pt)[*(619) 215-3789*]]
#align(center)[#text(size:15pt)[*Reference for Differential Calculus*]]
#line(length: 100%)
#text(size:13pt)[*Sec 2.1* *A Preview of Calculus*]
#text(fill:rgb("#7d1e1e"),size:13pt)[*The Tangent Problem and Differential Calculus*]

// Auto updating figure number
#show heading.where(level: 1): it => {
  counter(figure.where(kind: image)).update()
}
#show figure.caption: it => context [
  #text(fill: rgb("#7d1e1e"), size: 9pt, weight: "bold")[
    #it.supplement #it.counter.display(it.numbering)#it.separator
  ]#it.body
]

#show figure.caption: it => align(left, it)
#figure(
  image("Assets/constGraph.jpg", width:88%),
  caption: [
    #text(fill:rgb("#7d1e1e"), size: 9pt)[The rate of change of a linear function is constant in each of these three graphs, with the constant determined by the slope.]
    ],
) <constant-functions>

#text(fill: rgb("#000000"), size: 9pt)[As we move from left to right along the graph of $f(x) = -2x - 3$, we see that the graph decreases at a constant rate. For every 1 unit we move to the right along the x-axis, the y-coordinate decreases by 2 units. Similarily, the slope of $1/2$ in the function $g(x)$ tells us that for every change in $x$ of 1 unit there is a corresponding change in $y$ of $1/2$.

Compare the graphs of the functions from @constant-functions with the graph of $k(x) = x^2$. (@non-constant-functions) The graph of $k(x) = x^2$ starts from the left by decreasing rapidly, flattens aproaching $(0,0)$, then increases vertically to the right rapidly. Unlike a linear function, no single number represents the rate of change for this function.]

\
#show figure.caption: it => align(left, it)
#figure(
  image("Assets/non-constGraph.jpg", width: 40%),
  caption: [
    #text(fill: rgb("#7d1e1e"), size: 9pt)[The function $k(x) = x^2$ does not have a constant rate of change.]
  ],
) <non-constant-functions>

\
\
\
\
\ 

// Secant lines etc
#text(fill:rgb("#7d1e1e"),size:13pt)[*Approximating Rates of Change*]

#text(fill: rgb("#000000"), size: 9pt)[We can approximate the rate of change of a function $f(x)$ at a point on its graph by taking another point on the graph of $f(x)$, drawing a line through the two points, and calculating the slope of the resulting line. Such a line is called a *secant* line. @secant-function shows a secant line to a function $f(x)$ at a point $(a, f(a))$.]

#show figure.caption: it => align(left, it)
#figure(
  image("Assets/secantGraph.jpg", width: 40%),
  caption: [
    #text(fill: rgb("#7d1e1e"), size: 9pt)[The slope of a secant line through a point $(a, f(a))$ estimates the rate of change of the function at the point $(a, f(a))$.]
  ],
) <secant-function>

#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt
)[*Definition* \
    #line(length:100%, stroke: (thickness: 0.1pt))
    The *secant* to the function $f(x)$ through the points $(a, f(a))$ and $(x, f(x))$ is the line passing through these points.

    #align(center)[$m_sec = (f(x) - f(a))/(x - a)$]
]

#text(fill: rgb(0,0,0), size: 9pt)[
  The accuracy of approximating the rate of change of the function with a secant line depends on how close $x$ is to $a$. In @secant-slope you can see if $x$ is closer to $a$, the slope of the secant line is a better measure of the rate change of $f(x)$ at $a$.
]

#figure(
  image("Assets/secslopeGraph.jpg", width: 40%),
  caption: [
    #text(fill: rgb("#7d1e1e"), size: 9pt)[As x gets closer to $a$, the slope of the secant line becomes a better approximation to the rate of change of the function $f(x)$ at $a$.]
  ],
) <secant-slope>

#text(fill: rgb(0,0,0), size: 9pt)[
  The secant lines themselves approach a line that is called the *tangent* to the function $f(x)$ at $a$ (@tangent-function). The slope of the tangent line to the graph at $a$ measures the rate of change of the function at $a$. This vvalue also represents the derivative of the function $f(x)$ at $a$, or the rate of change of the functiuon at $a$. This derivative is denoted by $f'()$. *Differential calculus* is the field of calculus concerned with the study of derivatives and their applications.
]

#figure(
  image("Assets/tangentGraph.jpg", width: 40%),
  caption: [
    #text(fill: rgb("#7d1e1e"), size: 9pt)[Solving the Tangent Problem: as $x$ approaches $a$, the secant lines approach the tangent line.]
  ],
) <tangent-function>

#text(fill: rgb(0,0,0), size: 9pt)[
  The example below shows how to find secant slopes and how those slopes estimate the slope of the tangent line or, equivalently, *instantaneous* rate of change.
]

#line(length: 100%)
#block(inset: 5pt, width: 13.07%, radius:0pt, fill: rgb("#57575710"))[
  #text(fill: rgb(0,0,0), size: 10pt,)[Example 1.1]
] <Example-1.1>

#text(fill: rgb("#7d1e1e"), size: 9pt, weight: "bold")[
  Finding Slopes of Secant Lines
]

// Secant slope example and solution
#text(fill: rgb(0,0,0), size: 9pt)[Estimate the slope of the tangent line (rate of change) to $f(x) = x^2$ at $x = 1$ by finding slopes of secant lines through $(1, 1)$ and each of the following points on the graph of $f(x) = x^2$.

a. $(2, 4)$
\
b. $(3/2, 9/4)$
]



#text(fill: rgb("#7d1e1e"), size: 9pt)[#sym.checkmark *solution*
]
\
#text(fill: rgb(0,0,0), size: 9pt)[
Use the formula for the slope of a secant line from the definition.

a. $m_sec = (4 - 1)/(2 - 1) = 3$

b. $m_sec = ((9/4 - 1)/(3/2 - 1)) = 5/2 = 2.5$ 

The point in part b. is closer to the given point the slope of 2.5 is closer to the slope of the tangent line. A good estimate for the slope of the tangent would be in the range of 2 to 2.5.
]
