% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/shortcut.R
\name{shortcut}
\alias{sc}
\alias{shortcut}
\title{Create Shortcuts}
\usage{
shortcut(file = NULL, url = read_clip(), open = TRUE, check.ext = TRUE)

sc(file = NULL, url = read_clip(), open = TRUE, check.ext = TRUE)
}
\arguments{
\item{file}{The name of the output file.  Defaults to attempt to create in 
working directory using the \code{\link[base]{basename}} of \code{url}.  
Using \code{""} results in printing to the console.}

\item{url}{A url to redirect to.}

\item{open}{logical.  If \code{TRUE} \code{shortcut} attempts to open the 
file in a default browser.}

\item{check.ext}{logical.  If \code{TRUE} check for and add an HTML file 
extension to file.}
}
\description{
Creates an HTML file that redirects to a specified link.
}
\examples{
shortcut(url = "http://www.talkstats.com/")
\dontrun{
shortcut(url = "http://trinker.github.io/card/contact", file = "tyler")
}
}

