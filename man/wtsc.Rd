\name{wtsc}
\alias{wtsc}
\alias{wtsc.ord}
\title{THE WEIGHTED SCORES EQUATIONS WITH INPUTS OF THE WEIGHT MATRICES AND THE DATA}
\description{The weighted scores equations with inputs of the weight matrices and
    the data. }
\usage{
wtsc(param,WtScMat,xdat,ydat,id,tvec,margmodel,link)
wtsc.ord(param,WtScMat,xdat,ydat,id,tvec,link)
}
\arguments{
 \item{param}{The vector of regression and not regression parameters.}
  \item{WtScMat}{A list containing the following components.
  omega: The array with the \eqn{\Omega_i,\,i=1,\ldots,n} matrices;
  delta: The array with the \eqn{\Delta_i,\,i=1,\ldots,n} matrices;
  X: The array with the \eqn{X_i,\,i=1,\ldots,n} matrices.}
  \item{xdat}{\eqn{(\mathbf{x}_1 ,  \mathbf{x}_2 , \ldots ,
  \mathbf{x}_n )^\top}, where the matrix \eqn{\mathbf{x}_i,\,i=1,\ldots,n} for a given unit will
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
  \item{link}{The link function. 
  Choices are \dQuote{log} for the log link function, \dQuote{logit} for 
  the logit link function, and \dQuote{probit} for 
  the probit link function. 
}
}
\details{The weighted scores estimating equations, with
\eqn{W_{i,\rm working}} based on a working discretized MVN, have the form:
\deqn{
  g_1= g_1( a)=\sum_{i=1}^n X_i^T\, W_{i,{\rm working}}^{-1}\, s_i( a)=0,
}
where \eqn{ W_{i,\rm working}^{-1}=\Delta_i\Omega_{i,\rm working}^{-1}=
\Delta_i({\tilde a})\Omega_i({\tilde a},{\tilde R})^{-1}} is based on
the covariance matrix of \eqn{ s_i( a)} computed from the
fitted discretized MVN model with estimated parameters \eqn{{\tilde a},
{\tilde R}}.

Note that \code{wtsc.ord} is a variant of the code for ordinal (probit and logistic) regression.
}
\value{The weighted scores equations.}
\references{
Nikoloulopoulos, A.K., Joe, H. and Chaganty, N.R. (2011)
Weighted scores method for regression models with dependent data.
\emph{Biostatistics}, \bold{12}, 653--665.

Nikoloulopoulos, A.K. (2015a)
Correlation structure and variable selection in generalized estimating equations via composite likelihood information criteria.
\emph{Arxiv e-prints}.

Nikoloulopoulos, A.K. (2015b)
Weighted scores estimating equations for longitudinal  ordinal data.
\emph{Arxiv e-prints}.
}
\seealso{
  \code{\link{solvewtsc}},
  \code{\link{weightMat}},
  \code{\link{godambe}},
  \code{\link{wtsc.wrapper}}
}

\keyword{regression}

