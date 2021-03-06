% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/math.R
\name{calculate_tube_angle}
\alias{calculate_tube_angle}
\title{Calculate the angle for a position in the rotor}
\usage{
calculate_tube_angle(N)
}
\arguments{
\item{N}{Scalar integer, the number of total positions in the rotor.}
}
\value{
Numeric vector with circular angles (theta) for all integers <= N.
}
\description{
Calculate the angle for a position in the rotor
}
\examples{
calculate_tube_angle(32)
}
