\name{childvisit}
\alias{childvisit}
\docType{data}
\title{Hospital Visit Data}

\description{
  The response vector  consists of quarterly numbers of hospital visits over a
one year period for a child age at four or younger, and three baseline covariates
are age, sex, and maternal smoking status.  The sample size of this study is \eqn{n=73}
children.
}
\usage{data(childvisit)}
\format{
  A data frame with 292 observations on the following 6 variables.
  \describe{
    \item{\code{id}}{The child ID.}
    \item{\code{age}}{The age in months.}
    \item{\code{sex}}{The sex indicator.}
    \item{\code{matsmst}}{The maternal smoking status.}
    \item{\code{quarter}}{The time indicator.}
    \item{\code{hospvis}}{The response vector  of quarterly numbers of hospital visits.}
     }
}
\source{
 Song P.X.K. (2007). Correlated Data Analysis: Modeling, Analytics, and Application. 
 \emph{Correlated Data Analysis: Modeling, Analytics, and Application.} Book Webpage/Supplementary Material. Springer,
NY. 
}

\keyword{datasets}
