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
#align(right)[#text(size:8pt)[*Differential Calculus*]]
#align(right)[#text(size:8pt)[*Faba kouyate*]]
#align(right)[#text(size:8pt)[*(619) 215-3789*]]
#align(center)[#text(size:15pt)[*Reference for Differential Calculus*]]
#line(length: 100%)
#text(size:13pt)[*Sec 2.1* *A Preview of Calculus*]

// Auto updating figure number
#show heading.where(level: 1): it => {
  counter(figure.where(kind: image)).update()
}
#show figure.caption: it => context [
  #text(fill: rgb("#7d1e1e"), size: 9pt, weight: "bold")[
    #it.supplement #it.counter.display(it.numbering)#it.separator
  ]#it.body
]

#text(fill:rgb("#7d1e1e"),size:13pt)[*Rate of Change*]

#show figure.caption: it => align(left, it)
#figure(
  image("Assets/constGraph.jpg", width:88%),
  caption: [
    #text(fill:rgb("#7d1e1e"), size: 9pt)[The rate of change of a linear function is constant in each of these three graphs, with the constant determined by the slope.]
    ],
) <constant-functions>

#text(fill: rgb("#000000"), size: 9pt)[Unlike a linear function, no single number represents the rate of change for the function below.]

\
#show figure.caption: it => align(left, it)
#figure(
  image("Assets/non-constGraph.jpg", width: 40%),
  caption: [
    #text(fill: rgb("#7d1e1e"), size: 9pt)[The function $k(x) = x^2$ does not have a constant rate of change.]
  ],
) <non-constant-functions>

\
#line(length: 100%)

// Secant lines and Tangent lines etc
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
*Differential calculus* is the field of calculus concerned with the study of derivatives and their applications.
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

// Secant and Tangent slope example problem. 1
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

#line(length: 100%)

#text(fill:rgb("#7d1e1e"),size:13pt)[*Average and Instantaneous Velocity*]

#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt
)[*Definition* \
    #line(length:100%, stroke: (thickness: 0.1pt))
    Let $o(t)$ be the position function of an object moving along coordinates at time $t$. The average velocity of the object over 
a time interval $[a,t]$ where $a < t$ (or $[t, a]$if $t < a$) is:
 
    #align(center)[average = $(o(t) - o(a))/(t-a)$]
]

#text(fill: rgb(0,0,0), size: 9pt)[
  As $t$ is chosen closer to $a$, the average velocity becomes closer to the instantaneous velocity. This process of letting $x$ or $t$ approach $a$ in an expression is called taking a *limit*.
]

#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt
)[*Definition* \
    #line(length:100%, stroke: (thickness: 0.1pt))
    For a position function $s(t)$, the instantaneous velocity at a time $t = a$ is the value that the average velocities approach on the intervals of the form $[a, t]$ and $[t, a]$ as the values of $t$ become closer to $a$, provided such a value exists. (May not always...)
    ]

#line(length: 100%)

#block(inset: 5pt, width: 13.07%, radius:0pt, fill: rgb("#57575710"))[
  #text(fill: rgb(0,0,0), size: 10pt,)[Example 1.2]
] <Example-1.2>

#text(fill: rgb("#7d1e1e"), size: 9pt, weight: "bold")[
  Average Velocity
]

// Average and instantaneous velocity. 2
#text(fill: rgb(0,0,0), size: 9pt)[The position function for a ball dropped from the top of a $200$-meter tall building is given by $s(t) = 200 - 4.9t^2$, where position *$s$* is measured in *_meters_* and time *$t$* is measured in *_seconds_*.

Compute the average 
velocity of the ball over the 
given time intervals. 

a. $[4.99, 5]$

b. $[5, 5.01]$

c. $[4.999, 5]$

d. $[5, 5.001]$
]

#text(fill: rgb("#7d1e1e"), size: 9pt)[#sym.checkmark *solution*
]
\
#text(fill: rgb(0,0,0), size: 9pt)[
Plug in x-values and use the formula for the average velocity.

a. $s(4.99) = 77.98951$ and $s(5) = 77.5 => m_sec = (77.5 - 77.98951)/(5-4.99) = -48.951$

b. $s(5) = 77.5$ and $s(5.01)$
 

The point in part b. is closer to the given point the slope of 2.5 is closer to the slope of the tangent line. A good estimate for the instantaneous change would be in the range of 2 to 2.5.
]

#line(length: 100%)

#text(size:13pt)[*Sec 2.2* *Limits*]

#text(fill:rgb("#7d1e1e"),size:13pt)[*Intuitive Limit Definition*]

#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt
)[*Definition* \
    #line(length:100%, stroke: (thickness: 0.1pt))
    Let $f(x)$ be a function defined at all values in an open interval containing $a$, with the possible exception of $a$ itself, and $L$ be a real number. If all values of the function $f(x)$ approach the real $L$ as the values of $x$ approach the number $a$, then we say the limit of $f(x)$ as $x$ approaches $a$ is $L$.

    #align(center)[$display(lim_(x->a) f(x) = L)$]
]



#block(inset: 5pt, width: 13.07%, radius:0pt, fill: rgb("#57575710"))[
  #text(fill: rgb(0,0,0), size: 10pt,)[Example 2.1]
] <Example-2.1>

#text(fill: rgb("#7d1e1e"), size: 9pt, weight: "bold")[
  Evaluating a Limit Using a Graph
]

#text(fill: rgb(0,0,0), size: 9pt)[
  For $g(x)$, evaluate $display(lim_(x->-1) g(x))$.
  #figure(
  image("Assets/limitGraph.jpg", width: 40%),
  caption: [
    #text(fill: rgb("#7d1e1e"), size: 9pt)[The graph of $g(x)$ includes one value not on a smooth curve.]
  ],
) <limit-graph1>

]

#text(fill: rgb("#7d1e1e"), size: 9pt)[#sym.checkmark *solution*
]
\
#text(fill: rgb(0,0,0), size: 9pt)[
  Despite the fact that g(-1) = 4, as the $x$-values approach -1 from either side, the $g(x)$ values approach 3. Therefore, $display(lim_(x->-1) g(x)) = 3$.

  *[Note]* It is possible for the limit of a function to exist at a point, and 
for the function to be defined at this point, but the limit of the function and the value of the function at the point may be 
different. 
]

#line(length: 100%)

#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt
)[*Definition (2 important limits!)* \
    #line(length:100%, stroke: (thickness: 0.1pt))
    Let $a$ be a real number and $c$ be a constant.

    #text[i.#align(center)[$display(lim_(x->a) x = a)$]]
    #text[ii.#align(center)[$display(lim_(x->a) c = c)$]]
]

#text(fill:rgb("#7d1e1e"),size:13pt)[*One-Sided Limits*]


#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt
)[*Definition* \
    #line(length:100%, stroke: (thickness: 0.1pt))
    We define two types of *one-sided limits*

    _Limit from the left_: Let $f(x)$ be a function defined at all values in an open interval of the form $(c, a)$, and let $L$ be a real number. If the values of the function $f(x)$ approach the real number $L$ as the values of $x$ (where $x < a$) approach the number $a$, then we say that $L$ is the limit of $f(x)$ as $x$ approaches $a$ from the *left*. Expressed as,
    #align(center)[$display(lim_(x->a^-) f(x) = L)$]

    _Limit from the right_: Let $f(x)$ be a function defined at all values in an open interval of the from $(a, c)$, and let $L$ be a real number. If the values of the function $f(x)$ approach the real number $L$ as the values of $x$ (where $x > a$) approach the number $a$, then we say that $L$ is the limit of $f(x)$ as $x$ approaches $a$ from the *right*. Expressed as,
    #align(center)[$display(lim_(x->a^+) f(x) = L)$]
]

Example BLAH BLAH BLAH