\name{iee.ord}
\alias{iee.ord}
\title{
Maximum Likelihood for Ordinal Model 
}
\description{
Maximum Likelihood for Ordinal Probit and Logit: 
Newton-Raphson minimization of negative log-likelihood. 
}
\usage{
iee.ord(x,y,link,iprint=0,maxiter=20,toler=1.e-6)
}
\arguments{
\item{x}{
   vector or matrix of explanatory variables. Each row corresponds
   to an observation and each column to a variable.  The number of rows of x
   should equal the number of data values in y, and there should be fewer 
   columns than rows.  Missing values are not allowed.
}
\item{y}{
   numeric vector containing the ordinal response. 
   The values must be in the range 1,2,..., number of categories.
   Missing values are not allowed. 
}
\item{link}{The link function.Choices are  \dQuote{logit} for 
  the logit link function, and \dQuote{probit} for 
  the probit link function.}
\item{iprint}{
  logical indicator, default is FALSE, for whether the iterations for 
  numerical maximum likelihood should be printed.
}
\item{maxiter}{
  maximum number of Newton-Raphson iterations, default = 20.
}
\item{toler}{
  tolerance for convergence in Newton-Raphson iterations, default = 1.e-6.
}
}
\value{
  list of MLE of parameters and their associated standard 
  errors, in the order cutpt1,...,cutpt(number of categ-1),b1,...b(number of covariates).
\item{negloglik}{
  value of negative log-likelihood, evaluated at MLE
}
\item{gam}{
  MLE of ordered cutpoint parameters
}
\item{reg}{
  MLE of regression parameters
}
\item{cov}{
  estimated covariance matrix of the parameters
}
}
\details{
 
  The ordinal probit model is similar to the ordinal logit model.
  The parameter estimate of ordinal logit are roughly 1.8 to 2 times
  those of ordinal probit. 
}
\references{
  Anderson, J.A. and Pemberton, J.D. (1985). The grouped continuous model for
    multivariate ordered categorical variables and covariate adjustment.  
    \emph{Biometrics},  \bold{41}, 875--885.

}
\examples{
  ################################################################################
  #                         Ordinal regression 
  ################################################################################
  ################################################################################
  #                      read and set up data set
  ################################################################################
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
  ################################################################################
  #                      select the link
  ################################################################################
  link="probit"
  ################################################################################
  i.est<- iee.ord(xdat,ydat,link)
  print(i.est)
}
\author{
Aristidis K. Nikoloulopoulos \email{A.Nikoloulopoulos@uea.ac.uk}\cr
Harry Joe \email{harry.joe@ubc.ca}
}
\keyword{models}
