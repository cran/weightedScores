\name{margmodel}
\alias{dmargmodel}
\alias{pmargmodel}
\title{DENSITY AND CDF OF THE UNIVARIATE MARGINAL DISTRIBUTION}
\description{Density and cdf of the univariate marginal distribution.}
\usage{
dmargmodel(y,mu,gam,invgam,margmodel)
pmargmodel(y,mu,gam,invgam,margmodel)
}
\arguments{
  \item{y}{Vector of (non-negative integer) quantiles.}
  \item{mu}{The parameter \eqn{\mu} of the univariate distribution.}
  \item{gam}{The parameter \eqn{\gamma} of negative binomial distribution. \eqn{\gamma} is NULL for Poisson and Bernoulli distribution.}
  \item{invgam}{The  inverse of parameter \eqn{\gamma} of negative binomial
  distribution.}
  \item{margmodel}{
  Indicates the marginal model.
  Choices are \dQuote{poisson} for Poisson, \dQuote{bernoulli} for Bernoulli, 
  and  \dQuote{nb1} , \dQuote{nb2} for the NB1 and NB2 parametrization 
  of negative binomial in Cameron and Trivedi (1998). See details.}
  }
\details{Negative binomial distribution
NB\eqn{(\tau,\xi)} allows for overdispersion
and its probability mass function (pmf) is  given by
  \deqn{ f(y;\tau,\xi)=\frac{\Gamma(\tau+y)}{\Gamma(\tau)\; y!}
  \frac{\xi^y}{(1+\xi)^{\tau + y}},\quad \begin{matrix} y=0,1,2,\ldots, \\
                                          \tau>0,\; \xi>0,\end{matrix}  }
with mean \eqn{\mu=\tau\,\xi=\exp(\beta^T x)} and variance \eqn{\tau\,\xi\,(1+\xi)}.


Cameron and Trivedi (1998) present the NBk parametrization where
\eqn{\tau=\mu^{2-k}\gamma^{-1}} and \eqn{\xi=\mu^{k-1}\gamma}, \eqn{1\le k\le 2}.
In this function we use the NB1 parametrization
\eqn{(\tau=\mu\gamma^{-1},\; \xi=\gamma)}, and the NB2 parametrization
\eqn{(\tau=\gamma^{-1},\; \xi=\mu\gamma)}; the latter
is the same as in Lawless (1987).
}
\value{The density and cdf of the univariate distribution.}
\references{
Cameron, A. C. and Trivedi, P. K. (1998)
\emph{Regression Analysis of Count Data.}
Cambridge: Cambridge University Press.

Lawless, J. F. (1987)
Negative binomial and mixed Poisson regression.
\emph{The Canadian Journal
of Statistics}, \bold{15}, 209--225.
}
\author{
Aristidis K. Nikoloulopoulos \email{A.Nikoloulopoulos@uea.ac.uk}\cr
Harry Joe \email{harry.joe@ubc.ca}
}
\examples{
y<-3
gam<-2.5
invgam<-1/2.5
mu<-0.5
margmodel<-"nb2"
dmargmodel(y,mu,gam,invgam,margmodel)
pmargmodel(y,mu,gam,invgam,margmodel)
}
\keyword{distribution}
