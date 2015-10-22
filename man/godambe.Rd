\name{godambe}
\alias{godambe}
\alias{godambe.ord}
\title{INVERSE GODAMBE MATRIX}
\description{Inverse Godambe matrix.}
\usage{
godambe(param,WtScMat,xdat,ydat,id,tvec,margmodel,link)
godambe.ord(param,WtScMat,xdat,ydat,id,tvec,link)
}
\arguments{
  \item{param}{The weighted scores estimates of regression and not regression parameters.}
  \item{WtScMat}{A list containing the following components.
  omega: The array with the \eqn{\Omega_i,\,i=1,\ldots,n} matrices;
  delta: The array with the \eqn{\Delta_i,\,i=1,\ldots,n} matrices;
  X: The array with the \eqn{X_i,\,i=1,\ldots,n} matrices.}
  \item{xdat}{\eqn{(\mathbf{x}_1 ,  \mathbf{x}_2 , \ldots ,
  \mathbf{x}_n )^\top}, where the matrix \eqn{\mathbf{x}_i,\,i=1,\ldots,n} for a given unit will
  depend on the  times of observation for that unit (\eqn{j_i}) and will have
  number of rows \eqn{j_i}, each row corresponding to one of the \eqn{j_i} elements
  of \eqn{y_i} and \eqn{p} columns where \eqn{p} is the number of covariates including
  the unit first column  to account for the intercept  (except for ordinal regression where there is no intercept). This xdat matrix is
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
  the probit link function. }
}
\details{If the \eqn{W_{i,\rm working}} are assumed fixed for the
second stage of solving the weighted scores equations 
\deqn{
 g_1= g_1(a)=\sum_{i=1}^n X_i^T\, W_{i,\rm working}^{-1}\, s_i( a)=0,
} the asymptotic covariance matrix of the
solution \eqn{\widehat a_1} is
\deqn{
  V_1=(-D_{g_1})^{-1}M_{g_1}(-D^T_{g_1})^{-1}
}
with
\deqn{
  -D_{g_1} =\sum_{i=1}^n X_i^T W_{i,\rm working}^{-1}\Delta_i X_i,
}
\deqn{
  M_{ g_1} = \sum_{i=1}^n X_i^T W_{i,\rm working}^{-1}
  \Omega_{i,\rm true}( W_{i,\rm working}^{-1})^T X_i,
}
where \eqn{\Omega_{i,\rm true}} is the true covariance matrix of \eqn{s_i(a)}.
The inverse of \eqn{V_1} is known as
Godambe information matrix (Godambe, 1991).

Note that \code{godambe.ord} is a variant of the code for ordinal (probit and logistic) regression.
}
\value{The inverse Godambe matrix.}
\references{
Godambe, V. P. (1991)
\emph{Estimating Functions}.
Oxford: Oxford University Press

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
\author{
Aristidis K. Nikoloulopoulos \email{A.Nikoloulopoulos@uea.ac.uk}\cr
Harry Joe \email{harry.joe@ubc.ca}
}

\seealso{
  \code{\link{wtsc}},
  \code{\link{solvewtsc}},
  \code{\link{weightMat}},
  \code{\link{wtsc.wrapper}}
}

\examples{
################################################################################
#                           Poisson regression 
################################################################################
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
margmodel="poisson"
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
################################################################################
#                      obtain the inverse Godambe matrix
################################################################################
acov<-godambe(ws$r,WtScMat,xdat,ydat,id,tvec,margmodel)
cat("\nacov: inverse Godambe matrix with W based on first-stage wt
matrices\n")
print(acov)
################################################################################
#                         Ordinal regression 
################################################################################
################################################################################
#                      read and set up data set
################################################################################
\dontrun{
data(arthritis)
nn=nrow(arthritis)
bas2<-bas3<-bas4<-bas5<-rep(0,nn)
bas2[arthritis$b==2]<-1
bas3[arthritis$b==3]<-1
bas4[arthritis$b==4]<-1
bas5[arthritis$b==5]<-1
t2<-t3<-rep(0,nn)
t2[arthritis$ti==3]<-1
t3[arthritis$ti==5]<-1
xdat=cbind(t2,t3,arthritis$trt,bas2,bas3,bas4,bas5,arthritis$age) 
ydat=arthritis$y
id<-arthritis$id
#time
tvec<-arthritis$time
################################################################################
#                      select the link
################################################################################
link="probit"
################################################################################
#                      select the  correlation structure
################################################################################
corstr="exch"
################################################################################
#                      perform CL1 estimation
################################################################################
i.est<-iee.ord(xdat,ydat,link)
cat("\niest: IEE estimates\n")
print(c(i.est$reg,i.est$gam))
est.rho<-cl1.ord(b=i.est$reg,gam=i.est$gam,xdat,ydat,id,tvec,corstr,link)
cat("\nest.rho: CL1 estimates\n")
print(est.rho$e)
################################################################################
#                      obtain the fixed weight matrices
################################################################################
WtScMat<-weightMat.ord(b=i.est$reg,gam=i.est$gam,rh=est.rho$e,xdat,ydat,id,
tvec,corstr,link)
################################################################################
#                      obtain the weighted scores estimates
################################################################################
# solve the nonlinear system of equations
ws<-solvewtsc.ord(start=c(i.est$reg,i.est$gam),WtScMat,xdat,ydat,id,
tvec,link)
cat("ws=parameter estimates\n")
print(ws$r)
################################################################################
#                      obtain the inverse Godambe matrix
################################################################################
acov<-godambe.ord(ws$r,WtScMat,xdat,ydat,id,tvec,link)
cat("\nacov: inverse Godambe matrix with W based on first-stage wt
matrices\n")
print(acov)
}
}

\keyword{regression}

