\name{toenail}
\alias{toenail}
\docType{data}
\title{The toenail infection data}

\description{
   The data consist of up to seven binary observations
on each of 294 subjects who had been randomly
assigned to one of two treatment groups. The observations,
taken at regularly scheduled time points, are coded as 1 if
the subject's infection was severe and 0 otherwise. The interest is
to investigate if the two treatments differ
and if the percentage of severe infections decreased over time.
}
\usage{data(toenail)}
\format{
  A data frame with 1568 observations on the following 4 variables.
  \describe{
    \item{\code{idnum}}{The index for individuals.}
    \item{\code{treatn}}{The treatment binary covariate.}
    \item{\code{y}}{The subject's infection binary response.}
    \item{\code{time}}{The time indicator.}
     }
}
\source{
         Madsen L., Fang Y. (2011). .Regression Analysis for Discrete Longitudinal Data.
\emph{Biometrics}, in press.
}

\keyword{datasets}
