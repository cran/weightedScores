\name{bcl}
\alias{bcl}
\alias{bcl.ord}
\title{BIVARIATE COMPOSITE LIKELIHOOD FOR MULTIVARIATE NORMAL COPULA WITH CATEGORICAL AND COUNT REGRESSION}
\description{
Bivariate composite likelihood for multivariate normal copula with categorical and count regression.
}
\usage{
bcl(r,b,gam,xdat,ydat,id,tvec,margmodel,corstr,link)
bcl.ord(r,b,gam,xdat,ydat,id,tvec,corstr,link)
}
\arguments{
  \item{r}{The vector of normal copula parameters.}
  \item{b}{The regression coefficients.}
  \item{gam}{The uinivariate parameters that are not regression coefficients. That is the parameter \eqn{\gamma} of negative binomial distribution or  the \eqn{q}-dimensional vector of the univariate cutpoints of ordinal model. \eqn{\gamma} is NULL for Poisson and binary regression.}
  \item{xdat}{\eqn{(\mathbf{x}_1 , \mathbf{x}_2 , \ldots , \mathbf{x}_n )^\top}, where 
  the matrix \eqn{\mathbf{x}_i,\,i=1,\ldots,n} for a given unit will
  depend on the  times of observation for that unit (\eqn{j_i}) and will have
  number of rows \eqn{j_i}, each row corresponding to one of the \eqn{j_i} elements
  of \eqn{y_i} and \eqn{p} columns where \eqn{p} is the number of covariates including
  the unit first column  to account for the intercept (except for ordinal regression where there is no intercept). This xdat matrix is
  of dimension \eqn{(N\times p),} where \eqn{N =\sum_{i=1}^n j_i} is the total
  number of observations from all units.}
  \item{ydat}{\eqn{(y_1 , y_2 , \ldots , y_n  )^\top}, where
  the response data vectors \eqn{y_i,\,i=1,\ldots,n}
  are of possibly different lengths for different units.  In particular,
  we now have that \eqn{y_i} is (\eqn{j_i \times 1}), where \eqn{j_i} is the   number of
  observations on unit \eqn{i}. The total number of observations   from all units
  is \eqn{N =\sum_{i=1}^n j_i}. The ydat are the collection of data   vectors
  \eqn{y_i, i = 1,\ldots,n} one from each unit which summarize all the data
  together in a single, long vector of length \eqn{N}.}
  \item{id}{An index for individuals or clusters.}
  \item{tvec}{A vector with the time indicator of individuals or clusters.}
  \item{margmodel}{
  Indicates the marginal model. 
  Choices are \dQuote{poisson} for Poisson, \dQuote{bernoulli} for Bernoulli, 
  and  \dQuote{nb1} , \dQuote{nb2} for the NB1 and NB2 parametrization 
  of negative binomial in Cameron and Trivedi (1998).}
  \item{corstr}{Indicates the latent correlation structure of normal copula.
  Choices are \dQuote{exch}, \dQuote{ar}, and \dQuote{unstr} for exchangeable, ar(1)
  and unstructured correlation structure, respectively.}
  \item{link}{The link function. 
  Choices are \dQuote{log} for the log link function, \dQuote{logit} for 
  the logit link function, and \dQuote{probit} for 
  the probit link function.}
  }
\details{The
CL1 composite likelihood in Zhao and Joe (2005). That is the sum of bivariate marginal log-likelihoods.

\code{bcl.ord} is a variant of the code for ordinal (probit and logistic) regression.}
\value{
The negative bivariate composite likelihood for multivariate normal copula with Poisson or binary or negative
binomial or ordinal regression.
}
\references{
Zhao, Y. and Joe, H. (2005)
Composite likelihood estimation in multivariate data analysis.
\emph{The Canadian Journal of Statistics},  \bold{33}, 335--356.

Cameron, A. C. and Trivedi, P. K. (1998)
\emph{Regression Analysis of Count Data.}
Cambridge: Cambridge University Press.

}
\author{
Aristidis K. Nikoloulopoulos \email{A.Nikoloulopoulos@uea.ac.uk}\cr
Harry Joe \email{harry.joe@ubc.ca}
}
\seealso{
  \code{\link{cl1}},
  \code{\link{iee}}
}
\keyword{models}
