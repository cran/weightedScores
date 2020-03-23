\name{wtsc.wrapper}
\alias{wtsc.wrapper}
\alias{wtsc.ord.wrapper}
\title{THE WEIGHTED SCORES METHOD  WITH INPUTS OF THE DATA}
\description{The weighted scores method with inputs of the data.}
\usage{
wtsc.wrapper(xdat,ydat,id,tvec,margmodel,corstr,link,iprint=FALSE)
wtsc.ord.wrapper(xdat,ydat,id,tvec,corstr,link,iprint=FALSE)
}
\arguments{
  \item{xdat}{\eqn{(\mathbf{x}_1 ,  \mathbf{x}_2 , \ldots ,
  \mathbf{x}_n )^\top}, where the matrix \eqn{\mathbf{x}_i,\,i=1,\ldots,n} for a given unit will
  depend on the  times of observation for that unit (\eqn{j_i}) and will have
  number of rows \eqn{j_i}, each row corresponding to one of the \eqn{j_i} elements
  of \eqn{y_i} and \eqn{p} columns where \eqn{p} is the number of covariates including
  the unit first column  to account for the intercept (except for ordinal regression where there is no intercept). This xdat matrix is
  of dimension \eqn{(N\times p),} where \eqn{N =\sum_{i=1}^n j_i} is the total
  number of observations from all units.}
  \item{ydat}{\eqn{(y_1 , y_2 , \ldots , y_n  )^\top},
   where the response data vectors \eqn{y_i,\,i=1,\ldots,n}
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
  \item{iprint}{Indicates printing of some intermediate results, default FALSE}
  }
\details{This wrapper functions handles all the steps to obtain the weighted
scores estimates and standard errors.}
\value{A list containing the following components:
\item{IEEest}{The estimates of the regression and not regression
parameters ignoring dependence.}
\item{CL1est}{The vector with the CL1 estimated dependence parameters (latent
correlations).}
\item{CL1lik}{The  value of the sum of bivariate marginal log-likelihoods at
CL1 estimates.}
\item{WSest}{The weighted score estimates of the regression and not regression
parameters.}
\item{asympcov}{The estimated weighted scores asymptotic covariance matrix.}
}
\references{
Nikoloulopoulos, A.K., Joe, H. and Chaganty, N.R. (2011)
Weighted scores method for regression models with dependent data.
\emph{Biostatistics}, \bold{12}, 653--665. \doi{10.1093/biostatistics/kxr005}.

Nikoloulopoulos, A.K. (2016)
Correlation structure and variable selection in generalized estimating equations via composite likelihood information criteria.
\emph{Statistics in Medicine}, \bold{35}, 2377--2390. \doi{10.1002/sim.6871}.

Nikoloulopoulos, A.K. (2017)
Weighted scores method for longitudinal  ordinal data.
\emph{Arxiv e-prints}, <arXiv:1510.07376>. \url{https://arxiv.org/abs/1510.07376}.

}
\author{
Aristidis K. Nikoloulopoulos \email{A.Nikoloulopoulos@uea.ac.uk}\cr
Harry Joe \email{harry.joe@ubc.ca}
}
\seealso{
  \code{\link{wtsc}},
  \code{\link{solvewtsc}},
  \code{\link{weightMat}}
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
out<-wtsc.wrapper(xdat,ydat,id,tvec,margmodel="nb1",corstr="ar",iprint=TRUE)
\donttest{
################################################################################
#                        transform to binary responses                         #
################################################################################
y2<-ydat
y2[ydat>0]<-1
################################################################################
out<-wtsc.wrapper(xdat,y2,id,tvec,margmodel="bernoulli",link="probit",
corstr="exch",iprint=TRUE)
################################################################################
#                        via the code for ordinal                             #
################################################################################
out<-wtsc.ord.wrapper(xdat[,-1],2-y2,id,tvec,link="probit",
corstr="exch",iprint=TRUE)
}
}

\keyword{regression}

