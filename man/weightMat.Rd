\name{weightMat}
\alias{weightMat}
\alias{weightMat.ord}
\title{WEIGHT MATRICES FOR THE ESTIMATING EQUATIONS}
\description{Weight matrices for the estimating equations.}
\usage{
weightMat(b,gam,rh,xdat,ydat,id,tvec,margmodel,corstr,link)
weightMat.ord(b,gam,rh,xdat,ydat,id,tvec,corstr,link)
}
\arguments{
 \item{b}{The regression coefficients.}
  \item{gam}{The uinivariate parameters that are not regression coefficients. That is the parameter \eqn{\gamma} of negative binomial distribution or  the \eqn{q}-dimensional vector of the univariate cutpoints of ordinal model. \eqn{\gamma} is NULL for Poisson and binary regression.}
  \item{rh}{The vector of normal copula parameters.}
  \item{xdat}{\eqn{(\mathbf{x}_1 , \mathbf{x}_2 , \ldots ,
  \mathbf{x}_n )^\top}, where the matrix \eqn{\mathbf{x}_i,\,i=1,\ldots,n} for a given unit will
  depend on the  times of observation for that unit (\eqn{j_i}) and will have
  number of rows \eqn{j_i}, each row corresponding to one of the \eqn{j_i} elements
  of \eqn{y_i} and \eqn{p} columns where \eqn{p} is the number of covariates including
  the unit first column  to account for the intercept (except for ordinal regression where there is no intercept). This xdat matrix is
  of dimension \eqn{(N\times p),} where \eqn{N =\sum_{i=1}^n j_i} is the total
  number of observations from all units.}
  \item{ydat}{\eqn{(y_1 , y_2 , \ldots , y_n )^\top}, 
  where the reponse data vectors \eqn{y_i, i=1,\ldots,n}
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
  and unstrucutred correlation structure, respectively.}
  \item{link}{The link function. 
  Choices are \dQuote{log} for the log link function, \dQuote{logit} for 
  the logit link function, and \dQuote{probit} for 
  the probit link function. 
}
}
\details{The fixed weight matrices \eqn{W_{i,\rm working}} based on a working
discretized MVN, of the weighted scores equations in Nikoloulopoulos et al. (2011)
\deqn{
 g_1= g_1(a)=\sum_{i=1}^n X_i^T\,W_{i,\rm working}^{-1}\, s_i(a)=0,
}
where \eqn{W_{i,\rm working}^{-1}=\Delta_i\Omega_{i,\rm working}^{-1}=
\Delta_i({\tilde a})\Omega_i({\tilde a},{\tilde R})^{-1}} is based on
the covariance matrix of \eqn{s_i(a)} computed from the
fitted discretized MVN model with estimated parameters \eqn{{\tilde a},
{\tilde R}}.

Note that \code{weightMat.ord} is a variant of the code for ordinal (probit and logistic) regression.


}
\value{A list containing the following components:
\item{omega}{The array with the \eqn{\Omega_i,\ i=1,\ldots,n} matrices.}
\item{delta}{The array with the \eqn{\Delta_i,\ i=1,\ldots,n} matrices.}
\item{X}{The array with the \eqn{X_i,\ i=1,\ldots,n} matrices.}
}
\seealso{
  \code{\link{wtsc}},
  \code{\link{solvewtsc}},
  \code{\link{godambe}},
   \code{\link{wtsc.wrapper}}
}
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
\author{
Aristidis K. Nikoloulopoulos \email{A.Nikoloulopoulos@uea.ac.uk}\cr
Harry Joe \email{harry.joe@ubc.ca}
}

\examples{
################################################################################
#                            binary regression
################################################################################
################################################################################
#                      read and set up the data set
################################################################################
data(toenail)
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
link="probit"
################################################################################
#                      select the  correlation structure
################################################################################
corstr="ar"
################################################################################
#                      perform CL1 estimation
################################################################################
i.est<-iee(xdat,ydat,margmodel,link)
cat("\niest: IEE estimates\n")
print(c(i.est$reg,i.est$gam))
# est.rho<-cl1(b=i.est$reg,gam=i.est$gam,xdat,ydat,id,tvec,margmodel,corstr,link)
# cat("\nest.rho: CL1 estimates\n")
# print(est.rho$e)
# [1] 0.8941659
################################################################################
#                      obtain the fixed weight matrices
################################################################################
WtScMat<-weightMat(b=i.est$reg,gam=i.est$gam,rh=0.8941659,
xdat,ydat,id,tvec,margmodel,corstr,link)
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
WtScMat<-weightMat.ord(b=i.est$reg,gam=i.est$gam,rh=est.rho$e,xdat,ydat,id,tvec,corstr,link)
}
}




