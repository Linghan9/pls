%% $Id: stdize.Rd 46 2005-07-18 09:37:43Z bhm $
\encoding{latin1}
\name{stdize}
\alias{stdize}
\alias{predict.stdized}
\alias{makepredictcall.stdized}
\title{Standardization of Data Matrices}
\description{
  Performs standardization (centering and scaling) of a data matrix.
}
\usage{
stdize(x, center = TRUE, scale = TRUE)
\method{predict}{stdized}(object, newdata, \dots)
\method{makepredictcall}{stdized}(var, call)
}
\arguments{
  \item{x, newdata}{numeric matrices.  The data to standardize.}
  \item{center}{logical value or numeric vector of length equal to the
    number of coloumns of \code{x}.}
  \item{scale}{logical value or numeric vector of length equal to the
    number of coloumns of \code{x}.}
  \item{object}{an object inheriting from class \code{"stdized"}, normally
    the result of a call to \code{stdize}.}
  \item{var}{A variable.}
  \item{call}{The term in the formula, as a call.}
  \item{\dots}{other arguments.  Currently ignored.}
}
\details{
  \code{makepredictcall.stdized} is an internal utility function; it is noe
  meant for interactive use.  See \code{\link{makepredictcall}} for details.

  If \code{center} is \code{TRUE}, \code{x} is centered by subtracting
  the coloumn mean from each coloumn.  If \code{center} is a numeric
  vector, it is used in place of the coloumn means.

  If \code{scale} is \code{TRUE}, \code{x} is scaled by dividing each
  coloumn by its sample standard deviation.  If \code{scale} is a
  numeric vector, it is used in place of the standard deviations.
}
\value{
  Both \code{stdize} and \code{predict.stdized} return a scaled and/or
  centered matrix, with attributes \code{"stdized:center"} and/or
  \code{"stdized:scale"} the vector used for centering and/or scaling.
  The matrix is given class \code{c("stdized", "matrix")}.
}
\author{Bj�rn-Helge Mevik and Ron Wehrens}
\note{
  \code{stdize} is very similar to \code{\link[base]{scale}}.  The
  difference is that when \code{scale = TRUE}, \code{stdize} divides the
  coloumns by their standard deviation, while \code{scale} uses the
  root-mean-square of the coloumns.  If \code{center} is \code{TRUE},
  this is equivalent, but in general it is not.
}
\seealso{\code{\link{mvr}}, \code{\link{pcr}}, \code{\link{plsr}},
  \code{\link{msc}}, \code{\link[base]{scale}}}
\examples{
data(NIR)
## Direct standardization:
Ztrain <- stdize(NIR$X[NIR$train,])
Ztest <- predict(Ztrain, NIR$X[!NIR$train,])

## Used in formula:
mod <- plsr(y ~ stdize(X), ncomp = 6, data = NIR[NIR$train,])
pred <- predict(mod, newdata = NIR[!NIR$train,]) # Automatically standardized
}
\keyword{regression}
\keyword{multivariate}