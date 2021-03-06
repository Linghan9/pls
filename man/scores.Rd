%% $Id: scores.Rd 92 2006-09-20 17:44:25Z bhm $
\encoding{latin1}
\name{scores}
\alias{scores}
\alias{scores.default}
\alias{loadings}
\alias{loadings.default}
\alias{loading.weights}
\alias{Yscores}
\alias{Yloadings}
\title{Extract Scores and Loadings from PLSR and PCR Models}
\description{
  These functions extract score and loading matrices from fitted
  \code{mvr} models.
}
\usage{
scores(object, \dots)
\method{scores}{default}(object, \dots)

loadings(object, \dots)
\method{loadings}{default}(object, \dots)

loading.weights(object)

Yscores(object)

Yloadings(object)
}
\arguments{
  \item{object}{a fitted model to extract from.}
  \item{\dots}{extra arguments, currently not used.}
}
\details{
  All functions extract the indicated matrix from the fitted model, and
  will work with any object having a suitably named component.

  The default \code{scores} and \code{loadings} methods also handle
  \code{prcomp} objects (their scores and loadings components are called
  \code{x} and \code{rotation}, resp.), and add an attribute
  \code{"explvar"} with the variance explained by each component, if
  this is available.  (See \code{\link{explvar}} for details.)
}
\value{
  A matrix with scores or loadings.
}
\author{Ron Wehrens and Bj�rn-Helge Mevik}
\note{
  There is a \code{loadings} function in package \pkg{stats}.  It simply
  returns any element named \code{"loadings"}.  See
  \code{\link[stats]{loadings}} for details.  The function can be
  accessed as \code{stats::loadings(...)}.
}
\seealso{\code{\link{mvr}}, \code{\link{coef.mvr}}}
\examples{
data(yarn)
plsmod <- plsr(density ~ NIR, 6, data = yarn)
scores(plsmod)
loadings(plsmod)[,1:4]
}
\keyword{regression}
\keyword{multivariate}
