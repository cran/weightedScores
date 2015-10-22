\name{approxbvncdf}
\alias{approxbvncdf}
\title{APPROXIMATION OF BIVARIATE STANDARD NORMAL DISTRIBUTION}
\description{
Approximation of bivariate standard normal cumulative distribution function
 (Johnson and Kotz, 1972).}
\usage{
approxbvncdf(r,x1,x2,x1s,x2s,x1c,x2c,x1f,x2f,t1,t2)}
\arguments{
  \item{r}{The correlation parameter of bivariate standard normal distribution.}
  \item{x1}{\eqn{x_1,} see details.}
  \item{x2}{\eqn{x_2,} see details.}
  \item{x1s}{\eqn{x_1^2.}}
  \item{x2s}{\eqn{x_2^2.}}
  \item{x1c}{\eqn{x_1^3.}}
  \item{x2c}{\eqn{x_2^3.}}
  \item{x1f}{\eqn{x_1^4.}}
  \item{x2f}{\eqn{x_2^4.}}
  \item{t1}{\eqn{\Phi(x_1)\Phi(x_2),} where \eqn{\Phi(\cdot)} is the cdf of univariate
  standard normal distribution.}
  \item{t2}{\eqn{\phi(x_1)\phi(x_2),} where \eqn{\phi(\cdot)} is the density of
  univariate stamdard normal distribution.}
  }
\details{
The approximation for the bivariate normal cdf is from Johnson and Kotz (1972),
page 118.
Let \eqn{\Phi_2(x_1,x_2;\rho)=Pr(Z_1\le x_1,\,Z_2\le x_2)},
where \eqn{(Z_1,Z_2)} is bivariate normal with means 0, variances 1 and
correlation \eqn{\rho}.
An expansion, due to Pearson (1901), is
 \deqn{
  \Phi_2(x_1,x_2;\rho) =\Phi(x_1)\Phi(x_2)
  +\phi(x_1)\phi(x_2) \sum_{j=1}^\infty \rho^j \psi_j(x_1) \psi_j(x_2)/j!}
where
 \deqn{\psi_j(z) = (-1)^{j-1} d^{j-1} \phi(z)/dz^{j-1}.}
Since
\deqn{\phi'(z) =  -z\phi(z),
  \phi''(z) = (z^2-1)\phi(z) ,
  \phi'''(z) = [2z-z(z^2-1)]\phi(z) = (3z-z^3)\phi(z) ,}
\deqn{\phi^{(4)}(z) = [3-3z^2-z(3z-z^3)]\phi(z) = (3-6z^2+z^4)\phi(z)}
we have
\deqn{
  \Phi_2(x_1,x_2;\rho) = \Phi(x_1)\Phi(x_2)+\phi(x_1)\phi(x_2)
   [\rho+ \rho^2x_1x_2/2 + \rho^3 (x_1^2-1)(x_2^2-1)/6 
     +\rho^4 (x_1^3-3x_1)(x_2^3-3x_2)/24}
\deqn{+\rho^5 (x_1^4-6x_1^2+3)(x_2^4-6x_2^2+3)/120+\cdots ] }
A good approximation is obtained truncating the series
at \eqn{\rho^3} term for  \eqn{|\rho| \le 0.4}, and at \eqn{\rho^5} term for \eqn{0.4 < |\rho|\le 0.7}.
Higher order terms may  be required for \eqn{|\rho| > 0.7}.
}
\value{An approximation of bivariate normal cumulative distribution function.}
\references{
Johnson, N. L. and Kotz, S. (1972)
\emph{Continuous Multivariate Distributions.}
Wiley, New York.

Pearson, K. (1901)
Mathematical contributions to the theory of evolution-VII. On the
correlation of characters not quantitatively measureable.
\emph{Philosophical Transactions
of the Royal Society of London, Series A,} \bold{195}, 1--47.
}
\seealso{
  \code{\link{scoreCov}}
  }
\keyword{distribution}

