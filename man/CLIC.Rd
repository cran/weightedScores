\name{clic}
\alias{clic}
\alias{clic1dePar}
\title{CL1 INFORMATION CRITERIA}
\description{Composite likelihood (CL1) information criteria. }
\usage{
clic1dePar(nbcl,r,b,gam,xdat,id,tvec,corstr,WtScMat,link,mvncmp)
clic(nbcl,r,b,gam,xdat,id,tvec,corstr,WtScMat,link,mvncmp)

}
\arguments{
 \item{nbcl}{The negative value of the sum of bivariate marginal log-likelihoods at
CL1 estimates.}
 \item{r}{The CL1 estimates of the latent correlations.}
 \item{b}{The CL1 estimates of the regression coefficients.}
  \item{gam}{The CL1 estimates of the cutpoints.}
  \item{xdat}{\eqn{(\mathbf{x}_1 , \mathbf{x}_2 , \ldots ,
  \mathbf{x}_n )^\top}, where the matrix \eqn{\mathbf{x}_i,\,i=1,\ldots,n} for a given unit will
  depend on the  times of observation for that unit (\eqn{j_i}) and will have
  number of rows \eqn{j_i}, each row corresponding to one of the \eqn{j_i} elements
  of \eqn{y_i} and \eqn{p} columns where \eqn{p} is the number of covariates. This xdat matrix is
  of dimension \eqn{(N\times p),} where \eqn{N =\sum_{i=1}^n j_i} is the total
  number of observations from all units.}
    \item{id}{An index for individuals or clusters.}
  \item{tvec}{A vector with the time indicator of individuals or clusters.}
  \item{WtScMat}{A list containing the following components.
  omega: The array with the \eqn{\Omega_i,\,i=1,\ldots,n} matrices;
  delta: The array with the \eqn{\Delta_i,\,i=1,\ldots,n} matrices;
  X: The array with the \eqn{X_i,\,i=1,\ldots,n} matrices.}
  \item{corstr}{Indicates the latent correlation structure of normal copula.
  Choices are \dQuote{exch}, \dQuote{ar}, and \dQuote{unstr} for exchangeable, ar(1)
  and unstructured correlation structure, respectively.}
    \item{link}{The link function. 
  Choices are  \dQuote{logit} for 
  the logit link function, and \dQuote{probit} for 
  the probit link function.}
  \item{mvncmp}{The method of computation of the MVN rectangle probabilities. 
  Choices are  1 for \code{mvnapp} (faster), and 2 for 
  \code{pmvnorm} (more accurate).}
}
\details{


First, consider the sum of univariate log-likelihoods 
\deqn{L_1= \sum_{i=1}^n\sum_{j=1}^d\, \log f_1(y_{ij};\nu_{ij},\boldsymbol{\gamma})=\sum_{i=1}^n\sum_{j=1}^d\,
 \ell_1(\nu_{ij},\boldsymbol{\gamma},\, y_{ij}),
}
and then the sum of bivariate log-likelihoods
\deqn{L_2=\sum_{i=1}^{n}\sum_{j<k}
\log{f_2(y_{ij},y_{ik};\nu_{ij},\nu_{ik},\boldsymbol{\gamma},\rho_{jk})}=\sum_{i=1}^{n}\sum_{j<k}\ell_2(\nu_{ij},\nu_{ik},\boldsymbol{\gamma},\rho_{jk};y_{ij},y_{ik}),}
where \eqn{\ell_2(\cdot)=\log f_2(\cdot)} and
\deqn{
f_2(y_{ij},y_{ik};\nu_{ij},\nu_{ik},\boldsymbol{\gamma},\rho_{jk})=\int_{\Phi^{-1}[F_1(y_{ij}-1;\nu_{ij},\boldsymbol{\gamma})]}^{\Phi^{-1}[F_1(y_{ij};\nu_{ij},\boldsymbol{\gamma})]}
\int_{\Phi^{-1}[F_1(y_{ik}-1;\nu_{ik}),\boldsymbol{\gamma}]}^{\Phi^{-1}[F_1(y_{ik};\nu_{ik},\boldsymbol{\gamma})]}  \phi_2(z_j,z_d;\rho_{jk}) dz_j dz_k;
} 
\eqn{\phi_2(\cdot;\rho)} denotes the standard bivariate normal density  with correlation
 \eqn{\rho}.
 
Let \eqn{\mathbf{a}^\top=(\boldsymbol{\beta}^\top,\boldsymbol{\gamma}^\top)} be the
column vector of all  \eqn{r=p+q} univariate parameters. Differentiating \eqn{L_1} with respect to \eqn{\mathbf{a}} leads to the independent estimating equations or univariate composite score functions:
\deqn{
\mathbf{g}_1=\mathbf{g}_1(\mathbf{a})=
\frac{\partial L_1}{\partial \mathbf{a}}=  
\sum_{i=1}^n\mathbf{X}_i^\top\mathbf{s}_i^{(1)}(\mathbf{a})=\bf 0,
}

Differentiating \eqn{L_2} with respect to \eqn{\mathbf{R}=\bigl(\rho_{jk},1\leq j<k\leq d\bigr)} 
leads to the bivariate composite score functions (Zhao and Joe, 2005):

\deqn{
\mathbf{g}_2=\frac{\partial L_2}{\partial \mathbf{R}}= \sum_{i=1}^{n}\mathbf{s}_i^{(2)}(\mathbf{a},\mathbf{R})= \sum_{i=1}^n\Bigl(\mathbf{s}_{i,jk}^{(2)}(\mathbf{a},\rho_{jk}),1\leq j<k\leq d\Bigr)=\mathbf{0},
}
where \eqn{\mathbf{s}_i^{(2)}(\mathbf{a},\mathbf{R})=\frac{\partial\sum_{j<k}\ell_2(\nu_{ij},\nu_{ik},\boldsymbol{\gamma},\rho_{jk};y_{ij},y_{ik})}{\partial \mathbf{R}}} and  \eqn{\mathbf{s}_{i,jk}^{(2)}(\boldsymbol{\gamma},\rho_{jk})=\frac{\partial \ell_2(\nu_{ij},\nu_{ik},\boldsymbol{\gamma},\rho_{jk};y_{ij},y_{ik})}{\partial \rho_{jk}}}.
The CL1 estimates \eqn{\widetilde{\mathbf{a}}} and \eqn{\widetilde{\mathbf{R}}}  of the discretized MVN model are obtained
by solving the above CL1 estimating functions.

The asymptotic covariance matrix for the estimator that solves them, also known as the inverse Godambe (Godambe, 1991) information matrix, is
\deqn{
\mathbf{V}=(-\mathbf{H}_\mathbf{g})^{-1}\mathbf{J}_\mathbf{g}(-\mathbf{H}_\mathbf{g}^\top)^{-1},
}
where \eqn{\mathbf{g}=(\mathbf{g}_1,\mathbf{g}_2)^\top}. First set \eqn{\boldsymbol{\theta}=(\mathbf{a},\mathbf{R})^\top},  then
\deqn{
-\mathbf{H}_\mathbf{g}=E\Bigl(\frac{\partial \mathbf{g}}{\partial\boldsymbol{\theta}}\Bigr)=
\left[\begin{array}{cc}
E\Bigl(\frac{\partial \mathbf{g}_1}{\partial\mathbf{a}}\Bigr)
& E\Bigl(\frac{\partial \mathbf{g}_1}{\partial\mathbf{R}}\Bigr)\\
E\Bigl(\frac{\partial \mathbf{g}_2}{\partial\mathbf{a}}\Bigr) &
E\Bigl(\frac{\partial \mathbf{g}_2}{\partial\mathbf{R}}\Bigr)
\end{array}\right]=
\left[\begin{array}{cc}
-\mathbf{H}_{\mathbf{g}_1}&\mathbf{0}\\
-\mathbf{H}_{\mathbf{g}_{2,1}}&-\mathbf{H}_{\mathbf{g}_2}
\end{array}\right],
}
where \eqn{-\mathbf{H}_{\mathbf{g}_1}=\sum_i^n\mathbf{X}_i^\top\boldsymbol{\Delta}_i^{(1)}
\mathbf{X}_i},
\eqn{-\mathbf{H}_{\mathbf{g}_{2,1}}=\sum_i^n\boldsymbol{\Delta}_i^{(2,1)}\mathbf{X}_i},
and
\eqn{-\mathbf{H}_{\mathbf{g}_2}=\sum_i^n\boldsymbol{\Delta}_i^{(2,2)}}.



The covariance matrix \eqn{\mathbf{J}_\mathbf{g}} of the composite score functions \eqn{\mathbf{g}} is given as below
\deqn{
\mathbf{J}_\mathbf{g}=\mbox{Cov}(\mathbf{g})=
\left[\begin{array}{cc}
\mbox{Cov}(\mathbf{g}_1) & \mbox{Cov}(\mathbf{g}_1,\mathbf{g}_2)\\
\mbox{Cov}(\mathbf{g}_2,\mathbf{g}_1) & \mbox{Cov}(\mathbf{g}_2)
\end{array}\right]=
\left[\begin{array}{cc}\mathbf{J}_\mathbf{g}^{(1)}& \mathbf{J}_\mathbf{g}^{(1,2)}\\
\mathbf{J}_\mathbf{g}^{(2,1)}& \mathbf{J}_\mathbf{g}^{(2)}\end{array}\right]=
\sum_i\left[\begin{array}{cc}
\mathbf{X}_i^\top\boldsymbol{\Omega}_i^{(1)}
\mathbf{X}_i & \mathbf{X}_i^\top\boldsymbol{\Omega}_i^{(1,2)}\\
\boldsymbol{\Omega}_i^{(2,1)}\mathbf{X}_i& \boldsymbol{\Omega}_i^{(2)}\end{array}\right],
}
where
\deqn{\left[\begin{array}{cc}
\boldsymbol{\Omega}_i^{(1)}& \boldsymbol{\Omega}_i^{(1,2)}\\
\boldsymbol{\Omega}_i^{(2,1)}& \boldsymbol{\Omega}_i^{(2)}
\end{array}\right]=
\left[\begin{array}{cc}
\mbox{Cov}\Bigl(\mathbf{s}_i^{(1)}(\mathbf{a})\Bigr) & 
\mbox{Cov}\Bigl(\mathbf{s}_i^{(1)}(\mathbf{a}),
\mathbf{s}_i^{(2)}(\mathbf{a},\mathbf{R})\Bigr)\\
\mbox{Cov}\Bigl(\mathbf{s}_i^{(2)}(\mathbf{a},\mathbf{R}),
\mathbf{s}_i^{(1)}(\mathbf{a})\Bigr) & \mbox{Cov}\Bigl(\mathbf{s}_i^{(2)}(\mathbf{a},\mathbf{R})\Bigr)
\end{array}\right].
}
To this end, the composite AIC (Varin and Vidoni, 2005) and  BIC (Gao and Song, 2011)  criteria have the forms:

\deqn{
\mbox{CL1AIC} =  -2L_2 + 2\mbox{tr}\Bigl(\mathbf{J}_\mathbf{g}\mathbf{H}_\mathbf{g}^{-1}\Bigr),
}
\deqn{
\mbox{CL1BIC} =-2L_2+\log(n)\mbox{tr}\Bigl(\mathbf{J}_\mathbf{g}\mathbf{H}_\mathbf{g}^{-1}\Bigr).
}


}

\value{A list containing the following components:
\item{AIC}{The CL1AIC.}
\item{BIC}{The CL1BIC.}
}
\references{

Gao, X. and Song, P.X.K. (2011).
Composite likelihood {E}{M} algorithm with applications to
  multivariate hidden {M}arkov model.
\emph{Statistica Sinica} \bold{21}, 165--185.

Godambe, V. P. (1991)
\emph{Estimating Functions}.
Oxford: Oxford University Press

Nikoloulopoulos, A.K., Joe, H. and Chaganty, N.R. (2011)
Weighted scores method for regression models with dependent data.
\emph{Biostatistics}, \bold{12}, 653--665. \doi{10.1093/biostatistics/kxr005}.

Nikoloulopoulos, A.K. (2016)
Correlation structure and variable selection in generalized estimating equations via composite likelihood information criteria.
\emph{Statistics in Medicine}, \bold{35}, 2377--2390. \doi{10.1002/sim.6871}.

Nikoloulopoulos, A.K. (2017)
Weighted scores method for longitudinal  ordinal data.
\emph{Arxiv e-prints}, <arXiv:1510.07376>. \url{https://arxiv.org/abs/1510.07376}.


Varin, C. and Vidoni, P. (2005).
A note on composite likelihood inference and model selection.
\emph{Biometrika} \bold{92}, 519--528.

Zhao, Y. and Joe, H. (2005)
Composite likelihood estimation in multivariate data analysis.
\emph{The Canadian Journal of Statistics},  \bold{33}, 335--356.
}
\author{
Aristidis K. Nikoloulopoulos \email{A.Nikoloulopoulos@uea.ac.uk}\cr
}

\seealso{
  \code{\link{solvewtsc}},
  \code{\link{wtsc.wrapper}}
}

\examples{
\donttest{
  ################################################################################
  #                           Binary regression 
  ################################################################################
  ################################################################################
  #                      read and set up the data set
  ################################################################################
  data(childvisit)
  # covariates
  season1<-childvisit$q
  season1[season1>1]<-0
  xdat<-cbind(childvisit$sex,childvisit$age,childvisit$m,season1)
  # response
  ydat<-childvisit$hosp
  ydat[ydat>0]=1
  ydat=2-ydat
  #id
  id<-childvisit$id
  #time
  tvec<-childvisit$q
  ################################################################################
  #                      select the link
  ################################################################################
  link="logit"
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
  cat("\nest.rho: negative CL1 log-likelhood\n")
  print(est.rho$m)
  ################################################################################
  #                      obtain the fixed weight matrices
  ################################################################################
  WtScMat<-weightMat.ord(b=i.est$reg,gam=i.est$gam,rh=0.1961,xdat,ydat,id,
                         tvec,corstr,link)
  ################################################################################
  #                      obtain the CL1 information criteria
  ################################################################################
  out<-clic1dePar(nbcl=est.rho$m,r=est.rho$e,i.est$r,i.est$g,xdat,id,tvec,corstr,WtScMat,link,1)
}
}

\keyword{regression}

