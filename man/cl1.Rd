\name{cl1}
\alias{cl1}
\title{OPTIMIZATION ROUTINE FOR BIVARIATE COMPOSITE LIKELIHOOD FOR MVN COPULA}
\description{
Optimization routine for bivariate composite likelihood for MVN copula.
}
\usage{
cl1(b,gam,xdat,ydat,id,tvec,margmodel,corstr,link)
}
\arguments{
  \item{b}{The regression coefficients.}
  \item{gam}{The parameter \eqn{\gamma} of negative binomial distribution. \eqn{\gamma} is NULL for Poisson and binary regression.}
  \item{xdat}{\eqn{(\mathbf{x}_1 , \mathbf{x}_2 , \ldots , \mathbf{x}_n )^\top}, 
  where the matrix \eqn{\mathbf{x}_i,\,i=1,\ldots,n} for a given unit will
  depend on the  times of observation for that unit (\eqn{j_i}) and will have
  number of rows \eqn{j_i}, each row corresponding to one of the \eqn{j_i} elements
  of \eqn{y_i} and \eqn{p} columns where \eqn{p} is the number of covariates including
  the unit first column  to account for the intercept. This xdat matrix is
  of dimension \eqn{(N\times p),} where \eqn{N =\sum_{i=1}^n j_i} is the total
  number of observations from all units.}
  \item{ydat}{\eqn{(y_1 , y_2 , \ldots , y_n )^\top}, where
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
  the probit link function. 
  However, this is an optional argument and needs to be defined only for probit regression.}
}
\details{The
CL1 composite likelihood method in Zhao and Joe (2005). The
univariate parameters  are estimated
from the sum of univariate marginal log-likelihoods and then the dependence
parameters are estimated from the sum of bivariate marginal log-likelihoods
with the univariate parameters fixed from the first step.
}
\value{
A list containing the following components:
 \item{minimum}{The negative value of the sum of bivariate marginal log-likelihoods at
CL1 estimates.}
 \item{estimate}{The CL1 estimates.}
 \item{gradient}{The gradient at the estimated minimum of CL1.}
 \item{code}{An integer indicating why the optimization process terminated,
 same as in \code{\link{nlm}}.}
}
\references{
Nikoloulopoulos, A.K., Joe, H. and Chaganty, N.R. (2011)
Weighted scores method for regression models with dependent data.
\emph{Biostatistics}, \bold{12}, 653--665.

Zhao, Y. and Joe, H. (2005)
Composite likelihood estimation in multivariate data analysis.
\emph{The Canadian Journal of Statistics},  \bold{33}, 335--356.
}
\author{
Aristidis K. Nikoloulopoulos \email{A.Nikoloulopoulos@uea.ac.uk}\cr
Harry Joe \email{harry.joe@ubc.ca}
}
\seealso{
  \code{\link{bcl}}
  \code{\link{iee}}
}
\examples{
\dontrun{
################################################################################
#                      read and set up data set
################################################################################
data(childvisit)
# covariates
season1<-childvisit$q
season1[season1>1]<-0
xdat<-cbind(1,childvisit$sex,childvisit$age,childvisit$m,season1)
# response
ydat<-childvisit$hosp
#id
id<-childvisit$id
#time
tvec<-childvisit$q
################################################################################
#                      select the marginal model
################################################################################
margmodel="nb1"
################################################################################
#                      select the  correlation structure
################################################################################
corstr="exch"
################################################################################
#                      perform CL1 estimation
################################################################################
i.est<-iee(xdat,ydat,margmodel)
cat("\niest: IEE estimates\n")
print(c(i.est$reg,i.est$gam))
est.rho<-cl1(b=i.est$reg,gam=i.est$gam,xdat,ydat,id,tvec,margmodel,corstr)
cat("\nest.rho: CL1 estimates\n")
print(est.rho$e)
}
}


\keyword{models}

