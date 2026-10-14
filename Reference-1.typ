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
#block(inset: 5pt, width: auto, radius:0pt, fill: rgb("#57575710"))[
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

#block(inset: 5pt, width: auto, radius:0pt, fill: rgb("#57575710"))[
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

b. $s(5) = 77.5$ and $s(5.01) = 77.00951 => v_"avg" = (77.00951 - 77.5)/(5.01 - 5) = -49.049$

c. $s(4.999) = 77.5489951$ and $s(5) = 77.5 => v_"avg" = (77.5 - 77.5489951)/(5 - 4.999) = -48.9951$

d. $s(5) = 77.5$ and $s(5.001) = 77.4509951 => v_"avg" = (77.4509951 - 77.5)/(5.001 - 5) = -49.0049$

$=> v(5) approx -49$ m/s
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



#block(inset: 5pt, width: auto, radius:0pt, fill: rgb("#57575710"))[
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

#line(length: 100%)

#block(inset: 5pt, width: auto, radius:0pt, fill: rgb("#57575710"))[
  #text(fill: rgb(0,0,0), size: 10pt,)[Example 2.2]
] <Example-2.2>

#text(fill: rgb("#7d1e1e"), size: 9pt, weight: "bold")[
  Evaluating One-Sided Limits
]

#text(fill: rgb(0,0,0), size: 9pt)[
  $display(f(x) = cases(x + 1 & "if" x < 2, x^2 - 4 & "if" x >= 2))$. Evaluate $display(lim_(x->2^-) f(x))$ and $display(lim_(x->2^+) f(x))$.
  #figure(
  image("Assets/oneSidedGraph.jpg", width: 35%),
  caption: [
    #text(fill: rgb("#7d1e1e"), size: 9pt)[Different one-sided limits at $x = 2$.]
  ],
) <one-sided-graph>
]

#text(fill: rgb("#7d1e1e"), size: 9pt)[#sym.checkmark *solution*
]
\
#text(fill: rgb(0,0,0), size: 9pt)[
  $display(lim_(x->2^-) (x + 1)) = 2 + 1 = 3 quad quad display(lim_(x->2^+) (x^2 - 4)) = 4 - 4 = 0$
]

#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt
)[*Theorem (Two-Sided Limits)* \
    #line(length:100%, stroke: (thickness: 0.1pt))
    #align(center)[$display(lim_(x->a) f(x) = L) quad <=> quad display(lim_(x->a^-) f(x) = lim_(x->a^+) f(x) = L)$]
    Example 2.2: $3 != 0 =>$ $display(lim_(x->2) f(x))$ DNE.
]

#line(length: 100%)

#text(fill:rgb("#7d1e1e"),size:13pt)[*Infinite Limits*]

#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt
)[*Definition* \
    #line(length:100%, stroke: (thickness: 0.1pt))
    $display(lim_(x->a^-) f(x) = +infinity)$: $f(x)$ increases without bound as $x -> a$ from the left. ($-infinity$: decreases without bound. $a^+$: from the right.)

    $display(lim_(x->a) f(x) = plus.minus infinity)$ only if both one-sided limits are the same $plus.minus infinity$.

    $infinity$ is not a number: an infinite limit DNE.
]

#block(inset: 5pt, width: auto, radius:0pt, fill: rgb("#57575710"))[
  #text(fill: rgb(0,0,0), size: 10pt,)[Example 2.3]
] <Example-2.3>

#text(fill: rgb("#7d1e1e"), size: 9pt, weight: "bold")[
  Recognizing an Infinite Limit
]

#text(fill: rgb(0,0,0), size: 9pt)[
  Evaluate $display(lim_(x->0^-) 1/x)$, $display(lim_(x->0^+) 1/x)$, and $display(lim_(x->0) 1/x)$.
  #figure(
  image("Assets/reciprocalGraph.jpg", width: 35%),
  caption: [
    #text(fill: rgb("#7d1e1e"), size: 9pt)[$f(x) = 1/x$ near $x = 0$.]
  ],
) <reciprocal-graph>
]

#text(fill: rgb("#7d1e1e"), size: 9pt)[#sym.checkmark *solution*
]
\
#text(fill: rgb(0,0,0), size: 9pt)[
  $x -> 0^- => x < 0 => display(lim_(x->0^-) 1/x = -infinity)$

  $x -> 0^+ => x > 0 => display(lim_(x->0^+) 1/x = +infinity)$

  $-infinity != +infinity => display(lim_(x->0) 1/x)$ DNE
]

#line(length: 100%)

#text(fill:rgb("#7d1e1e"),size:13pt)[*Vertical Asymptotes*]

#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt,
  breakable: false
)[*Definition* \
    #line(length:100%, stroke: (thickness: 0.1pt))
    $x = a$ is a *vertical asymptote* of $f$ if $display(lim_(x->a^-) f(x))$, $display(lim_(x->a^+) f(x))$, or $display(lim_(x->a) f(x))$ is $plus.minus infinity$.
]

#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt
)[*Theorem* ($n$ a positive integer) \
    #line(length:100%, stroke: (thickness: 0.1pt))
    $n$ even: $display(lim_(x->a) 1/(x - a)^n = +infinity) quad quad$ $n$ odd: $display(lim_(x->a^-) 1/(x - a)^n = -infinity), display(lim_(x->a^+) 1/(x - a)^n = +infinity)$
]

#block(inset: 5pt, width: auto, radius:0pt, fill: rgb("#57575710"))[
  #text(fill: rgb(0,0,0), size: 10pt,)[Example 2.4]
] <Example-2.4>

#text(fill: rgb("#7d1e1e"), size: 9pt, weight: "bold")[
  Finding a Vertical Asymptote
]

#text(fill: rgb(0,0,0), size: 9pt)[
  Find the vertical asymptote of $display(f(x) = 1/(x + 2)^3)$.
  #figure(
  image("Assets/asymptoteGraph.jpg", width: 35%),
  caption: [
    #text(fill: rgb("#7d1e1e"), size: 9pt)[Vertical asymptote at $x = -2$.]
  ],
) <asymptote-graph>
]

#text(fill: rgb("#7d1e1e"), size: 9pt)[#sym.checkmark *solution*
]
\
#text(fill: rgb(0,0,0), size: 9pt)[
  $x + 2 = x - (-2) => a = -2, n = 3$ (odd)

  $display(lim_(x->-2^-) 1/(x + 2)^3 = -infinity), quad display(lim_(x->-2^+) 1/(x + 2)^3 = +infinity) => x = -2$
]

#line(length: 100%)

#text(size:13pt)[*Sec 2.3* *The Limit Laws*]

#text(fill:rgb("#7d1e1e"),size:13pt)[*Limit Laws*]

#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt,
  breakable: false
)[*Limit Laws ($display(lim_(x->a) f(x) = L)$, $display(lim_(x->a) g(x) = M)$, $c$ constant)* \
    #line(length:100%, stroke: (thickness: 0.1pt))
    #table(columns: (auto, 1fr), stroke: none, inset: 4pt,
      [Sum/Difference], [$display(lim_(x->a) (f(x) plus.minus g(x)) = L plus.minus M)$],
      [Constant multiple], [$display(lim_(x->a) c f(x) = c L)$],
      [Product], [$display(lim_(x->a) f(x) g(x) = L M)$],
      [Quotient], [$display(lim_(x->a) f(x)/g(x) = L/M)$, $M != 0$],
      [Power], [$display(lim_(x->a) (f(x))^n = L^n)$],
      [Root], [$display(lim_(x->a) root(n, f(x)) = root(n, L))$, $L >= 0$ if $n$ even],
    )
]

#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt,
  breakable: false
)[*Direct Substitution* \
    #line(length:100%, stroke: (thickness: 0.1pt))
    Polynomial $p$: $display(lim_(x->a) p(x) = p(a))$. Rational $p/q$: $display(lim_(x->a) p(x)/q(x) = p(a)/q(a))$ if $q(a) != 0$.
]

#block(inset: 5pt, width: auto, radius:0pt, fill: rgb("#57575710"))[
  #text(fill: rgb(0,0,0), size: 10pt,)[Example 2.5]
] <Example-2.5>

#text(fill: rgb("#7d1e1e"), size: 9pt, weight: "bold")[
  Direct Substitution
]

#text(fill: rgb(0,0,0), size: 9pt)[
  Evaluate $display(lim_(x->3) (2x^2 - 3x + 1)/(5x + 4))$.
]

#text(fill: rgb("#7d1e1e"), size: 9pt)[#sym.checkmark *solution*
]
\
#text(fill: rgb(0,0,0), size: 9pt)[
$display(lim_(x->3) (2x^2 - 3x + 1)/(5x + 4) = (2(9) - 9 + 1)/(15 + 4) = 10/19)$
]

#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt,
  breakable: false
)[*Strategy: Substitution Gives $0/0$* \
    #line(length:100%, stroke: (thickness: 0.1pt))
    Factor and cancel #h(1fr) Rationalize (conjugate) #h(1fr) Combine fractions (common denominator)

    $a/0$ with $a != 0$: the limit is $plus.minus infinity$ or DNE. Check one-sided signs.
]

#block(inset: 5pt, width: auto, radius:0pt, fill: rgb("#57575710"))[
  #text(fill: rgb(0,0,0), size: 10pt,)[Example 2.6]
] <Example-2.6>

#text(fill: rgb("#7d1e1e"), size: 9pt, weight: "bold")[
  Factor and Cancel
]

#text(fill: rgb(0,0,0), size: 9pt)[
  Evaluate $display(lim_(x->3) (x^2 - 9)/(x - 3))$.
]

#text(fill: rgb("#7d1e1e"), size: 9pt)[#sym.checkmark *solution*
]
\
#text(fill: rgb(0,0,0), size: 9pt)[
$display(lim_(x->3) ((x - 3)(x + 3))/(x - 3) = lim_(x->3) (x + 3)) = 6$
]

#block(inset: 5pt, width: auto, radius:0pt, fill: rgb("#57575710"))[
  #text(fill: rgb(0,0,0), size: 10pt,)[Example 2.7]
] <Example-2.7>

#text(fill: rgb("#7d1e1e"), size: 9pt, weight: "bold")[
  Rationalize
]

#text(fill: rgb(0,0,0), size: 9pt)[
  Evaluate $display(lim_(x->-1) (sqrt(x + 2) - 1)/(x + 1))$.
]

#text(fill: rgb("#7d1e1e"), size: 9pt)[#sym.checkmark *solution*
]
\
#text(fill: rgb(0,0,0), size: 9pt)[
$display(lim_(x->-1) (sqrt(x + 2) - 1)/(x + 1) dot (sqrt(x + 2) + 1)/(sqrt(x + 2) + 1) = lim_(x->-1) (x + 1)/((x + 1)(sqrt(x + 2) + 1)) = lim_(x->-1) 1/(sqrt(x + 2) + 1) = 1/2)$
]

#block(inset: 5pt, width: auto, radius:0pt, fill: rgb("#57575710"))[
  #text(fill: rgb(0,0,0), size: 10pt,)[Example 2.8]
] <Example-2.8>

#text(fill: rgb("#7d1e1e"), size: 9pt, weight: "bold")[
  Combine Fractions
]

#text(fill: rgb(0,0,0), size: 9pt)[
  Evaluate $display(lim_(x->1) (1/(x + 1) - 1/2)/(x - 1))$.
]

#text(fill: rgb("#7d1e1e"), size: 9pt)[#sym.checkmark *solution*
]
\
#text(fill: rgb(0,0,0), size: 9pt)[
$display(lim_(x->1) (2 - (x + 1))/(2(x + 1)(x - 1)) = lim_(x->1) (-(x - 1))/(2(x + 1)(x - 1)) = lim_(x->1) (-1)/(2(x + 1)) = -1/4)$
]

#block(inset: 5pt, width: auto, radius:0pt, fill: rgb("#57575710"))[
  #text(fill: rgb(0,0,0), size: 10pt,)[Example 2.9]
] <Example-2.9>

#text(fill: rgb("#7d1e1e"), size: 9pt, weight: "bold")[
  Nonzero Over Zero
]

#text(fill: rgb(0,0,0), size: 9pt)[
  Evaluate $display(lim_(x->2^-) (x - 3)/(x^2 - 2x))$.
]

#text(fill: rgb("#7d1e1e"), size: 9pt)[#sym.checkmark *solution*
]
\
#text(fill: rgb(0,0,0), size: 9pt)[
  $display((x - 3)/(x(x - 2)))$: numerator $-> -1$; $x -> 2^- => x(x - 2) -> 0^-$

  $=> display(lim_(x->2^-) (x - 3)/(x^2 - 2x) = (-1)/(0^-) = +infinity)$
]

#text(fill:rgb("#7d1e1e"),size:13pt)[*Squeeze Theorem*]

#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt,
  breakable: false
)[*Theorem (Squeeze)* \
    #line(length:100%, stroke: (thickness: 0.1pt))
    #align(center)[$g(x) <= f(x) <= h(x)$ near $a$ and $display(lim_(x->a) g(x) = lim_(x->a) h(x) = L) quad => quad display(lim_(x->a) f(x) = L)$]
]

#block(inset: 5pt, width: auto, radius:0pt, fill: rgb("#57575710"))[
  #text(fill: rgb(0,0,0), size: 10pt,)[Example 2.10]
] <Example-2.10>

#text(fill: rgb("#7d1e1e"), size: 9pt, weight: "bold")[
  Applying the Squeeze Theorem
]

#text(fill: rgb(0,0,0), size: 9pt)[
  Evaluate $display(lim_(x->0) x^2 cos(1/x))$.
]

#text(fill: rgb("#7d1e1e"), size: 9pt)[#sym.checkmark *solution*
]
\
#text(fill: rgb(0,0,0), size: 9pt)[
  $-1 <= cos(1/x) <= 1 => -x^2 <= x^2 cos(1/x) <= x^2$

  $display(lim_(x->0) (-x^2) = lim_(x->0) x^2 = 0 => lim_(x->0) x^2 cos(1/x)) = 0$
]

#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt,
  breakable: false
)[*Trigonometric Limits* \
    #line(length:100%, stroke: (thickness: 0.1pt))
    #align(center)[$display(lim_(theta->0) (sin theta)/theta = 1) quad quad display(lim_(theta->0) (1 - cos theta)/theta = 0)$]
    Match the argument: $display(lim_(x->0) (sin 4x)/x = lim_(x->0) 4 dot (sin 4x)/(4x) = 4)$
]

#line(length: 100%)

#text(size:13pt)[*Sec 2.4* *Continuity*]

#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt,
  breakable: false
)[*Definition* \
    #line(length:100%, stroke: (thickness: 0.1pt))
    $f$ is *continuous* at $a$ if:
    #h(1em) i. $f(a)$ is defined #h(2em) ii. $display(lim_(x->a) f(x))$ exists #h(2em) iii. $display(lim_(x->a) f(x) = f(a))$
]

#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt,
  breakable: false
)[*Types of Discontinuity* \
    #line(length:100%, stroke: (thickness: 0.1pt))
    #table(columns: (auto, 1fr), stroke: none, inset: 4pt,
      [*Removable*], [$display(lim_(x->a) f(x))$ exists, but $f(a)$ is undefined or $!= display(lim_(x->a) f(x))$],
      [*Jump*], [$display(lim_(x->a^-) f(x))$ and $display(lim_(x->a^+) f(x))$ exist, but are not equal],
      [*Infinite*], [$display(lim_(x->a^-) f(x))$ or $display(lim_(x->a^+) f(x))$ is $plus.minus infinity$],
    )
]

#figure(
  image("Assets/discontinuityGraph.jpg", width: 80%),
  caption: [
    #text(fill: rgb("#7d1e1e"), size: 9pt)[The three types of discontinuity at $x = 2$.]
  ],
) <discontinuity-graph>

#block(inset: 5pt, width: auto, radius:0pt, fill: rgb("#57575710"))[
  #text(fill: rgb(0,0,0), size: 10pt,)[Example 2.11]
] <Example-2.11>

#text(fill: rgb("#7d1e1e"), size: 9pt, weight: "bold")[
  Classifying a Discontinuity
]

#text(fill: rgb(0,0,0), size: 9pt)[
  Classify the discontinuity of $display(f(x) = (x^2 - 4)/(x - 2))$ at $x = 2$.
]

#text(fill: rgb("#7d1e1e"), size: 9pt)[#sym.checkmark *solution*
]
\
#text(fill: rgb(0,0,0), size: 9pt)[
  $display(f(2) = 0/0)$ (undefined)

  $display(lim_(x->2) ((x - 2)(x + 2))/(x - 2) = lim_(x->2) (x + 2)) = 4 =>$ removable
]

#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt,
  breakable: false
)[*Continuous Functions* \
    #line(length:100%, stroke: (thickness: 0.1pt))
    Polynomials, rational functions (on their domains), $sin x$, $cos x$, $e^x$, $root(n, x)$ (on their domains).

    Composition: $g$ continuous at $L$ and $display(lim_(x->a) f(x) = L) => display(lim_(x->a) g(f(x)) = g(L))$

    Continuous on an interval: continuous at every point (one-sided at closed endpoints).
]

#block(inset: 5pt, width: auto, radius:0pt, fill: rgb("#57575710"))[
  #text(fill: rgb(0,0,0), size: 10pt,)[Example 2.12]
] <Example-2.12>

#text(fill: rgb("#7d1e1e"), size: 9pt, weight: "bold")[
  Making a Function Continuous
]

#text(fill: rgb(0,0,0), size: 9pt)[
  Find $k$ so $display(f(x) = cases(k x + 1 & "if" x < 2, x^2 & "if" x >= 2))$ is continuous at $x = 2$.
]

#text(fill: rgb("#7d1e1e"), size: 9pt)[#sym.checkmark *solution*
]
\
#text(fill: rgb(0,0,0), size: 9pt)[
  $display(lim_(x->2^-) (k x + 1)) = 2k + 1, quad display(lim_(x->2^+) x^2) = 4 = f(2)$

  $2k + 1 = 4 => k = 3/2$
]

#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt,
  breakable: false
)[*Intermediate Value Theorem (IVT)* \
    #line(length:100%, stroke: (thickness: 0.1pt))
    #align(center)[$f$ continuous on $[a, b]$, $z$ between $f(a)$ and $f(b)$ $quad => quad exists c in (a, b)$ with $f(c) = z$]
]

#block(inset: 5pt, width: auto, radius:0pt, fill: rgb("#57575710"))[
  #text(fill: rgb(0,0,0), size: 10pt,)[Example 2.13]
] <Example-2.13>

#text(fill: rgb("#7d1e1e"), size: 9pt, weight: "bold")[
  Using the IVT
]

#text(fill: rgb(0,0,0), size: 9pt)[
  Show $f(x) = x^3 + x - 1$ has a zero in $[0, 1]$.
]

#text(fill: rgb("#7d1e1e"), size: 9pt)[#sym.checkmark *solution*
]
\
#text(fill: rgb(0,0,0), size: 9pt)[
  $f$ is a polynomial $=>$ continuous on $[0, 1]$

  $f(0) = -1 < 0, quad f(1) = 1 > 0 => exists c in (0, 1)$ with $f(c) = 0$
]

#line(length: 100%)

#text(size:13pt)[*Sec 2.5* *The Precise Definition of a Limit*]

#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt,
  breakable: false
)[*Definition ($epsilon$–$delta$)* \
    #line(length:100%, stroke: (thickness: 0.1pt))
    #align(center)[$display(lim_(x->a) f(x) = L) quad <=> quad forall epsilon > 0, exists delta > 0: quad 0 < |x - a| < delta => |f(x) - L| < epsilon$]
    One-sided: replace $0 < |x - a| < delta$ with $0 < x - a < delta$ (right) or $0 < a - x < delta$ (left).
]

#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt,
  breakable: false
)[*Strategy* \
    #line(length:100%, stroke: (thickness: 0.1pt))
    1. Simplify $|f(x) - L| < epsilon$ into the form $|x - a| < (dots)$. #h(1fr) 2. Choose $delta$. #h(1fr) 3. Verify: $0 < |x - a| < delta => |f(x) - L| < epsilon$.
]

#block(inset: 5pt, width: auto, radius:0pt, fill: rgb("#57575710"))[
  #text(fill: rgb(0,0,0), size: 10pt,)[Example 2.14]
] <Example-2.14>

#text(fill: rgb("#7d1e1e"), size: 9pt, weight: "bold")[
  Linear Function
]

#text(fill: rgb(0,0,0), size: 9pt)[
  Prove $display(lim_(x->1) (2x + 1) = 3)$.
]

#text(fill: rgb("#7d1e1e"), size: 9pt)[#sym.checkmark *solution*
]
\
#text(fill: rgb(0,0,0), size: 9pt)[
  $|(2x + 1) - 3| = |2x - 2| = 2|x - 1| < epsilon <=> |x - 1| < epsilon/2 => delta = epsilon/2$

  Verify: $0 < |x - 1| < epsilon/2 => |(2x + 1) - 3| = 2|x - 1| < 2 dot epsilon/2 = epsilon$
]

#block(inset: 5pt, width: auto, radius:0pt, fill: rgb("#57575710"))[
  #text(fill: rgb(0,0,0), size: 10pt,)[Example 2.15]
] <Example-2.15>

#text(fill: rgb("#7d1e1e"), size: 9pt, weight: "bold")[
  Quadratic Function
]

#text(fill: rgb(0,0,0), size: 9pt)[
  Prove $display(lim_(x->2) x^2 = 4)$.
]

#text(fill: rgb("#7d1e1e"), size: 9pt)[#sym.checkmark *solution*
]
\
#text(fill: rgb(0,0,0), size: 9pt)[
  $|x^2 - 4| = |x - 2||x + 2|$

  Restrict $delta <= 1$: $|x - 2| < 1 => 1 < x < 3 => |x + 2| < 5 => |x^2 - 4| < 5|x - 2|$

  $5|x - 2| < epsilon <=> |x - 2| < epsilon/5 => delta = min(1, epsilon/5)$

  Verify: $0 < |x - 2| < delta => |x^2 - 4| < 5|x - 2| < 5 dot epsilon/5 = epsilon$
]

#pagebreak(weak: true)
#text(size:13pt)[*Sec 3.1* *Defining the Derivative*]

#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt,
  breakable: false
)[*Definition (Derivative at $a$)* \
    #line(length:100%, stroke: (thickness: 0.1pt))
    #align(center)[$display(f'(a) = lim_(x->a) (f(x) - f(a))/(x - a) = lim_(h->0) (f(a + h) - f(a))/h)$]
    $f'(a)$ = slope of the tangent line at $(a, f(a))$ = instantaneous rate of change at $a$.

    Tangent line: $y = f(a) + f'(a)(x - a)$
]

#block(inset: 5pt, width: auto, radius:0pt, fill: rgb("#57575710"))[
  #text(fill: rgb(0,0,0), size: 10pt,)[Example 3.1]
] <Example-3.1>

#text(fill: rgb("#7d1e1e"), size: 9pt, weight: "bold")[
  Tangent Line
]

#text(fill: rgb(0,0,0), size: 9pt)[
  Find the tangent line to $f(x) = x^2 + x$ at $x = 1$.
]

#text(fill: rgb("#7d1e1e"), size: 9pt)[#sym.checkmark *solution*
]
\
#text(fill: rgb(0,0,0), size: 9pt)[
  $f(1) = 2, quad f(1 + h) = (1 + h)^2 + (1 + h) = 2 + 3h + h^2$

  $display(f'(1) = lim_(h->0) (2 + 3h + h^2 - 2)/h = lim_(h->0) (h(3 + h))/h = lim_(h->0) (3 + h)) = 3$

  $y = 2 + 3(x - 1) => y = 3x - 1$
]

#block(inset: 5pt, width: auto, radius:0pt, fill: rgb("#57575710"))[
  #text(fill: rgb(0,0,0), size: 10pt,)[Example 3.2]
] <Example-3.2>

#text(fill: rgb("#7d1e1e"), size: 9pt, weight: "bold")[
  Using the $x -> a$ Form
]

#text(fill: rgb(0,0,0), size: 9pt)[
  Find $f'(4)$ for $f(x) = sqrt(x)$.
]

#text(fill: rgb("#7d1e1e"), size: 9pt)[#sym.checkmark *solution*
]
\
#text(fill: rgb(0,0,0), size: 9pt)[
$display(f'(4) = lim_(x->4) (sqrt(x) - 2)/(x - 4) = lim_(x->4) (sqrt(x) - 2)/((sqrt(x) - 2)(sqrt(x) + 2)) = lim_(x->4) 1/(sqrt(x) + 2) = 1/4)$
]

#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt,
  breakable: false
)[*Velocity* \
    #line(length:100%, stroke: (thickness: 0.1pt))
    Position $s(t)$: instantaneous velocity $v(a) = s'(a)$.
]

#block(inset: 5pt, width: auto, radius:0pt, fill: rgb("#57575710"))[
  #text(fill: rgb(0,0,0), size: 10pt,)[Example 3.3]
] <Example-3.3>

#text(fill: rgb("#7d1e1e"), size: 9pt, weight: "bold")[
  Instantaneous Velocity
]

#text(fill: rgb(0,0,0), size: 9pt)[
  $s(t) = 200 - 4.9t^2$ (Example 1.2). Find $v(5)$.
]

#text(fill: rgb("#7d1e1e"), size: 9pt)[#sym.checkmark *solution*
]
\
#text(fill: rgb(0,0,0), size: 9pt)[
  $s(5 + h) = 200 - 4.9(25 + 10h + h^2) = 77.5 - 49h - 4.9h^2$

  $display(v(5) = lim_(h->0) (77.5 - 49h - 4.9h^2 - 77.5)/h = lim_(h->0) (-49 - 4.9h)) = -49$ m/s
]

#line(length: 100%)

#block(breakable: false)[
#text(size:13pt)[*Sec 3.2* *The Derivative as a Function*]

#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt,
  breakable: false
)[*Definition* \
    #line(length:100%, stroke: (thickness: 0.1pt))
    #align(center)[$display(f'(x) = lim_(h->0) (f(x + h) - f(x))/h)$]
    Notation: $f'(x) = y' = display((d y)/(d x)) = display(d/(d x) f(x))$
]
]

#block(inset: 5pt, width: auto, radius:0pt, fill: rgb("#57575710"))[
  #text(fill: rgb(0,0,0), size: 10pt,)[Example 3.4]
] <Example-3.4>

#text(fill: rgb("#7d1e1e"), size: 9pt, weight: "bold")[
  Polynomial
]

#text(fill: rgb(0,0,0), size: 9pt)[
  Find $f'(x)$ for $f(x) = x^2 - 2x$.
  #figure(
  image("Assets/derivativeGraph.jpg", width: 35%),
  caption: [
    #text(fill: rgb("#7d1e1e"), size: 9pt)[$f' < 0$ where $f$ decreases, $f' = 0$ at the minimum, $f' > 0$ where $f$ increases.]
  ],
) <derivative-graph>
]

#text(fill: rgb("#7d1e1e"), size: 9pt)[#sym.checkmark *solution*
]
\
#text(fill: rgb(0,0,0), size: 9pt)[
  $f(x + h) - f(x) = (x^2 + 2x h + h^2 - 2x - 2h) - (x^2 - 2x) = 2x h + h^2 - 2h$

  $display(f'(x) = lim_(h->0) (h(2x + h - 2))/h = lim_(h->0) (2x + h - 2)) = 2x - 2$
]

#block(inset: 5pt, width: auto, radius:0pt, fill: rgb("#57575710"))[
  #text(fill: rgb(0,0,0), size: 10pt,)[Example 3.5]
] <Example-3.5>

#text(fill: rgb("#7d1e1e"), size: 9pt, weight: "bold")[
  Square Root
]

#text(fill: rgb(0,0,0), size: 9pt)[
  Find $f'(x)$ for $f(x) = sqrt(x)$.
]

#text(fill: rgb("#7d1e1e"), size: 9pt)[#sym.checkmark *solution*
]
\
#text(fill: rgb(0,0,0), size: 9pt)[
$display(f'(x) = lim_(h->0) (sqrt(x + h) - sqrt(x))/h dot (sqrt(x + h) + sqrt(x))/(sqrt(x + h) + sqrt(x)) = lim_(h->0) h/(h(sqrt(x + h) + sqrt(x))) = 1/(2 sqrt(x)))$
]

#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt,
  breakable: false
)[*Graph of $f'$* \
    #line(length:100%, stroke: (thickness: 0.1pt))
    $f' > 0 =>$ $f$ increasing #h(1fr) $f' < 0 =>$ $f$ decreasing #h(1fr) $f' = 0 =>$ horizontal tangent
]

#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt,
  breakable: false
)[*Differentiability* \
    #line(length:100%, stroke: (thickness: 0.1pt))
    Differentiable at $a$ $=>$ continuous at $a$. The converse is false.

    $f'(a)$ fails to exist at: a discontinuity, a corner ($|x|$ at $0$), a vertical tangent ($root(3, x)$ at $0$).
]

#block(inset: 5pt, width: auto, radius:0pt, fill: rgb("#57575710"))[
  #text(fill: rgb(0,0,0), size: 10pt,)[Example 3.6]
] <Example-3.6>

#text(fill: rgb("#7d1e1e"), size: 9pt, weight: "bold")[
  A Corner
]

#text(fill: rgb(0,0,0), size: 9pt)[
  Show $f(x) = |x|$ is not differentiable at $x = 0$.
]

#text(fill: rgb("#7d1e1e"), size: 9pt)[#sym.checkmark *solution*
]
\
#text(fill: rgb(0,0,0), size: 9pt)[
  $display(lim_(h->0^+) abs(h)/h = lim_(h->0^+) h/h = 1)$, $quad display(lim_(h->0^-) abs(h)/h = lim_(h->0^-) (-h)/h = -1)$

  $1 != -1 => f'(0)$ DNE
]

#block(
  fill: rgb("#57575710"),
  inset: 10pt,
  width: 100%,
  radius: 0pt,
  breakable: false
)[*Higher-Order Derivatives* \
    #line(length:100%, stroke: (thickness: 0.1pt))
    $f''(x) = (f'(x))'$, #h(0.5em) $f'''(x)$, #h(0.5em) $f^((4))(x)$ #h(2em) Notation: $display((d^2 y)/(d x^2))$

    Position $s(t)$ $->$ velocity $v(t) = s'(t)$ $->$ acceleration $a(t) = v'(t) = s''(t)$
]
