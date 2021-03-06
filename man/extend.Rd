% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/read.gatingML.cytobank.R
\name{extend}
\alias{extend}
\alias{extend.ellipsoidGate}
\alias{extend.polygonGate}
\alias{extend.rectangleGate}
\title{extend the gate to the minimum and maximum limit of both dimensions based on the bounding information.}
\usage{
extend(gate, bound, data.range = NULL, plot = FALSE)

\method{extend}{polygonGate}(gate, bound, data.range = NULL, plot = FALSE)

\method{extend}{rectangleGate}(gate, ...)

\method{extend}{ellipsoidGate}(gate, ...)
}
\arguments{
\item{gate}{a flowCore filter/gate}

\item{bound}{numeric matrix representing the bouding information parsed from gatingML. Each row corresponds to a channel.
rownames should be the channel names. colnames should be c("min", "max")}

\item{data.range}{numeric matrix specifying the data limits of each channel. It is used to set the extended value of vertices and must has the same structure as 'bound'.
when it is not supplied, c(-.Machine$integer.max, - .Machine$integer.max) is used.}

\item{plot}{whether to plot the extended polygon.}

\item{...}{other arguments}
}
\value{
a flowCore filter/gate
}
\description{
It is equivalent to the behavior of shifting the off-scale boundary events into the gate boundary that is describled in
bounding transformation section of gatingML standard.
}
\details{
The advantage of extending gates instead of shifting data are two folds:
1. Avoid the extra computation each time applying or plotting the gates
2. Avoid changing the data distribution caused by adding the gates

Normally this function is not used directly by user but invoked when parsing GatingML file exported from Cytobank.
}
\examples{
sqrcut <- matrix(c(300,300,600,600,50,300,300,50),ncol=2,nrow=4)
colnames(sqrcut) <- c("FSC-H","SSC-H")
pg <- polygonGate(filterId="nonDebris", sqrcut)
pg
bound <- matrix(c(100,3e3,100,3e3), byrow = TRUE, nrow = 2, dimnames = list(c("FSC-H", "SSC-H"), c("min", "max")))
bound
pg.extened <- extend(pg, bound, plot = TRUE)
}

