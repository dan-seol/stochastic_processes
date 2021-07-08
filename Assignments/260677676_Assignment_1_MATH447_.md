---
title: "MATH 447 - Assignment 1"
output: 
  html_document: 
    highlight: kate
    keep_md: yes
    theme: readable
header-includes:
   - \usepackage{blkarray}
---
Dan Yunheum Seol
260677676



## 1.17
We have
$$
X \sim Pois(\lambda) : \lambda = 3
$$
and we need to obtain
$$
E[X|X > 2]
$$

We use the Law of Iterated Expectation
$$
\lambda = E[X] = E[E[X|X>2]] = E[X|X>2]P(X >2) + E[X| X \leq 2] P(X \leq 2)
$$
It follows that
$$
E[X|X>2] = \frac{E[X]-E[X|X \leq 2]}{P(X \leq 2)} = \frac{\lambda - \sum_{x=0}^2 x  \frac{e^{-\lambda} \lambda^x}{x!} }{\sum_{x=0}^2   \frac{e^{-\lambda} \lambda^x}{x!}} = \frac{3 - (0 + 3e^{-3} + 9e^{-3})}{e^{-3} + 3*e^{-3}+\frac{9}{2}e^{-3}}
$$
R gives the result of

```r
round((3-3*exp(-3)*(1+3))/(1-(exp(-3)+3*exp(-3)+4.5*exp(-3))), 5)
```

```
## [1] 4.16525
```
$\square$
## 1. 28

We have
$$
N := \text{The number of accidents};\ N|\Lambda \sim Pois(\Lambda);\ \Lambda \sim U(0,3)
$$
Then by the Laws of Iterated Expectation and Iterated Variance,
$$
E[N] = E_{\Lambda}[E_{N}[N| \Lambda]] = E_{\Lambda}[\Lambda] = \frac{3-0}{2} = \frac{3}{2}
$$

$$
Var[N] = E[Var[N|\Lambda]] + Var[E[N|\Lambda]] = E[\Lambda] + Var[\Lambda] = \frac{3}{2} + (\int_0^3 \frac{1}{3} \Lambda^2 d \Lambda - \frac{9}{4} ) = \frac{3}{2} + \frac{\Lambda^3}{9}|^3_0 - \frac{9}{4} =
$$

$$
\frac{3}{2} + (3 - \frac{9}{4}) =  \frac{6}{4} + \frac{3}{4} = \frac{9}{4}
$$

## 2.2
We have
$(\{X_t\}_{t \in \mathbb{N}_0} , P)$ as our Markov chain with transition probability matrix $P$.
We also have that

\begin{align}
P = 
\begin{blockarray}{cccccc}
& \mbox{Nil} &  \mbox{Low} &\mbox{Moderate}  & \mbox{High} & \mbox{Extreme} \\ 
\begin{block}{c(ccccc)}
\mbox{Nil} & 0.575 & 0.118 & 0.172 & 0.109 & 0.026 \\
\mbox{Low} & 0.453 & 0.243 & 0.148 & 0.123 & 0.033 \\
\mbox{Moderate} & 0.104 & 0.343 & 0.367 & 0.167 & 0.019 \\
\mbox{High} & 0.015 & 0.066 & 0.318 & 0.505 & 0.096 \\
\mbox{Extreme} & 0.000 & 0.060 & 0.149 & 0.567 & 0.224 \\
\end{block}
\end{blockarray}
\end{align}

