\name{solvewtsc}
\alias{solvewtsc}
\title{SOLVING THE WEIGHTED SCORES EQUATIONS WITH INPUTS OF THE WEIGHT MATRICES AND THE DATA}
\description{Solving the weighted scores equations with inputs of the weight matrices
  and the data.}
\usage{
solvewtsc(start,WtScMat,xdat,ydat,id,tvec,margmodel,link)}
\arguments{
 \item{start}{A starting value of the vector of regression
 and not regression parameters. The CL1 estimates of regression and not regression parameters 
 is a good starting value.}
 \item{WtScMat}{A list containing the following components.
  omega: The array with the \eqn{\Omega_i,\,i=1,\ldots,n} matrices;
  delta: The array with the \eqn{\Delta_i,\,i=1,\ldots,n} matrices;
  X: The array with the \eqn{X_i,\,i=1,\ldots,n} matrices.}
  \item{xdat}{\eqn{(\mathbf{x}_1 ,  \mathbf{x}_2 , \ldots ,
  \mathbf{x}_n )^\top}, where the matrix \eqn{\mathbf{x}_i,\,i=1,\ldots,n} for a given unit will
  depend on the  times of observation for that unit (\eqn{j_i}) and will have
  number of rows \eqn{j_i}, each row corresponding to one of the \eqn{j_i} elements
  of \eqn{y_i} and \eqn{p} columns where \eqn{p} is the number of covariates including
  the unit first column  to account for the intercept. This xdat matrix is
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
  However, this is an optional argument and needs to be defined only for probit regression.}
}
\details{Obtain robust estimates \eqn{{\hat a}} of the univariate parameters
solving the weighted scores equation,
\eqn{
  g_1= g_1(a)=\sum_{i=1}^n X_i^T\, W_{i,\rm working}^{-1}\, s_i( a)=0,
}
where \eqn{ W_{i,\rm working}^{-1}=\Delta_i\Omega_{i,\rm working}^{-1}=
\Delta_i({\tilde a})\Omega_i({\tilde a},{\tilde R})^{-1}} is based on
the covariance matrix of \eqn{s_i(a)} computed from the
fitted discretized MVN model with estimated parameters \eqn{{\tilde a}, {\tilde
R}}.  A reliable non-linear system solver is used.
}
\value{A list containing the following components:
\item{root}{The weighted scores estimates.}
\item{f.root}{The value of the wtsc function evaluated at the root.}
\item{iter}{The number of iterations used.}
\item{estim.precis}{The estimated precision for root.}
}
\references{
Nikoloulopoulos, A.K., Joe, H. and Chaganty, N.R. (2011)
Weighted scores method for regression models with dependent data.
\emph{Biostatistics}, \bold{12}, 653--665.
}
\author{
Aristidis K. Nikoloulopoulos \email{A.Nikoloulopoulos@uea.ac.uk}\cr
Harry Joe \email{harry.joe@ubc.ca}
}
\seealso{
  \code{\link{wtsc}},
  \code{\link{weightMat}},
  \code{\link{godambe}},
  \code{\link{wtsc.wrapper}}
}

\examples{

################################################################################
#                      read and set up the data set
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
margmodel="nb2"
################################################################################
#                      select the  correlation structure
################################################################################
corstr="ar"
################################################################################
#                      perform CL1 estimation
################################################################################
i.est<-iee(xdat,ydat,margmodel)
cat("\niest: IEE estimates\n")
print(c(i.est$reg,i.est$gam))
est.rho<-cl1(b=i.est$reg,gam=i.est$gam,xdat,ydat,id,tvec,margmodel,corstr,link)
cat("\nest.rho: CL1 estimates\n")
print(est.rho$e)
################################################################################
#                      obtain the fixed weight matrices
################################################################################
WtScMat<-weightMat(b=i.est$reg,gam=i.est$gam,rh=est.rho$e,
xdat,ydat,id,tvec,margmodel,corstr)
################################################################################
#                      obtain the weighted scores estimates
################################################################################
# solve the nonlinear system of equations
ws<-solvewtsc(start=c(i.est$reg,i.est$gam),WtScMat,xdat,ydat,id,
tvec,margmodel,link)
cat("ws=parameter estimates\n")
print(ws$r)
}



