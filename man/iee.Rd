\name{iee}
\alias{iee}
\title{INDEPENDENT ESTIMATING EQUATIONS FOR BINARY/POISSON/NEGATIVE BINOMIAL REGRESSION}
\description{
Independent estimating equations for binary, Poisson or negative binomial regression.}
\usage{
iee(xdat,ydat,margmodel,link) }
\arguments{
  \item{xdat}{\eqn{(\mathbf{x}_1 ,  \mathbf{x}_2 , \ldots ,
  \mathbf{x}_n )^\top}, where the matrix \eqn{\mathbf{x}_i,\,i=1,\ldots,n} for a given unit will
  depend on the  times of observation for that unit (\eqn{j_i}) and will have
  number of rows \eqn{j_i}, each row corresponding to one of the \eqn{j_i} elements
  of \eqn{y_i} and \eqn{p} columns where \eqn{p} is the number of covariates including
  the unit first column  to account for the intercept. This xdat matrix is
  of dimension \eqn{(N\times p),} where \eqn{N =\sum_{i=1}^n j_i} is the total
  number of observations from all units.}
  \item{ydat}{\eqn{(y_1 , y_2 , \ldots , y_n )^\top}, where the response 
  data vectors \eqn{y_i,\,i=1,\ldots,n}
  are of possibly different lengths for different units.  In particular,
  we now have that \eqn{y_i} is (\eqn{j_i \times 1}), where \eqn{j_i} is the   number of
  observations on unit \eqn{i}. The total number of observations   from all units
  is \eqn{N =\sum_{i=1}^n j_i}. The ydat are the collection of data   vectors
  \eqn{y_i, i = 1,\ldots,n} one from each unit which summarize all the data
  together in a single, long vector of length \eqn{N}.}
  \item{margmodel}{
  Indicates the marginal model.
  Choices are \dQuote{poisson} for Poisson, \dQuote{bernoulli} for Bernoulli, 
  and  \dQuote{nb1} , \dQuote{nb2} for the NB1 and NB2 parametrization 
  of negative binomial in Cameron and Trivedi (1998).}
  \item{link}{The link function.
  Choices are \dQuote{log} for the log link function, \dQuote{logit} for 
  the logit link function, and \dQuote{probit} for 
  the probit link function.}
  }
\details{The univariate parameters  are
estimated from the sum of univariate marginal log-likelihoods.}
\value{A list containing the following components:
\item{coef}{The vector with the estimated regression parameters.}
\item{gam}{The estimate of \eqn{\gamma} parameter of negative binomial distribution. This is NULL for Poisson and binary regression.} }
\references{
Cameron, A. C. and Trivedi, P. K. (1998)
\emph{Regression Analysis of Count Data.}
Cambridge: Cambridge University Press.
}
\author{
Aristidis K. Nikoloulopoulos \email{A.Nikoloulopoulos@uea.ac.uk}\cr
Harry Joe \email{harry.joe@ubc.ca}
}

\seealso{
  \code{\link{bcl}},
  \code{\link{cl1}}
}

\examples{
\dontrun{
################################################################################
#                      read and set up data set
################################################################################
data(toenail)
# covariates
xdat<-cbind(1,toenail$treat,toenail$time,toenail$treat*toenail$time)
# response
ydat<-toenail$y
#id
id<-toenail$id
#time
tvec<-toenail$time
################################################################################
#                      select the marginal model
################################################################################
margmodel="bernoulli"
################################################################################
#                      perform the IEE method
################################################################################
i.est<-iee(xdat,ydat,margmodel)
cat("\niest: IEE estimates\n")
print(c(i.est$reg,i.est$gam))
}
}
\keyword{regression}



