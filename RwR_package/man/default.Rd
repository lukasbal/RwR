\name{default}
\alias{default}
\docType{data}
\title{
Data on Danish companies in the period 2013-2016 extracted from annual reports and enriched by 
data on competition and economic activity in spatial proximity of the company.
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data("default")}
\format{
  A data frame with 636855 observations on the following 16 variables.
  \describe{
    \item{\code{fiscal_start}}{a Date}
    \item{\code{fiscal_end}}{a Date}
    \item{\code{default}}{a factor with levels \code{0} \code{1}}
    \item{\code{equity}}{a numeric vector}
    \item{\code{profit}}{a numeric vector}
    \item{\code{assets}}{a numeric vector}
    \item{\code{solidity_ratio}}{a numeric vector}
    \item{\code{liquidity_ratio}}{a numeric vector}
    \item{\code{gearing}}{a numeric vector}
    \item{\code{return_on_assets}}{a numeric vector}
    \item{\code{CVR}}{a character vector}
    \item{\code{start}}{a Date}
    \item{\code{end}}{a Date}
    \item{\code{industry_type}}{a character vector}
    \item{\code{econ_activity}}{a numeric vector}
    \item{\code{competition_density}}{a numeric vector}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
The dataset is a subset of a dateset constructed and used by Sebastian Pedersen, 
Lasse Petersen, Simon Harmat & Nikolaj Tham to win the Business Analytics Challenge 2017 organized 
by Danske Bank.
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
Bankruptcy Modelling - a Machine Learning Approach

Sebastian Pedersen, Lasse Petersen, Simon Harmat & Nikolaj Thams
}
\examples{
data(default)
## maybe str(default) ; plot(default) ...
}
\keyword{datasets}
