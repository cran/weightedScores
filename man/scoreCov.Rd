\name{scoreCov}
\alias{scoreCov}
\title{COVARIANCE MATRIX OF THE UNIVARIATE SCORES}
\description{
Covariance matrix of the univariates scores.}
\usage{
scoreCov(scnu,scgam,pmf,index,margmodel)}
\arguments{
  \item{scnu}{The matrix of the score functions with respect to \eqn{\nu}.}
  \item{scgam}{The matrix of the score functions with respect to \eqn{\gamma}.}
  \item{pmf}{The matrix of rectangle probabilities.}
  \item{index}{The bivariate pair.}
  \item{margmodel}{
  Indicates the marginal model.
  Choices are \dQuote{poisson} for Poisson, \dQuote{bernoulli} for Bernoulli, 
  and  \dQuote{nb1} , \dQuote{nb2} for the NB1 and NB2 parametrization 
  of negative binomial in Cameron and Trivedi (1998).}
  }
\details{The covariance matrix \eqn{\Omega_i} of \eqn{ s_i(a)} computed from the
fitted discretized MVN model with estimated parameters \eqn{{\tilde a},
{\tilde R}}.}
\value{Covariance matrix of the univariates scores \eqn{\Omega_i}.}
\author{
Aristidis K. Nikoloulopoulos \email{A.Nikoloulopoulos@uea.ac.uk}\cr
Harry Joe \email{harry.joe@ubc.ca}
}
\seealso{
 \code{\link{scoreCov}},
 \code{\link{approxbvncdf}}
}

