% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/g2_microsats.R
\name{g2_microsats}
\alias{g2_microsats}
\title{Estimating g2 from microsatellite data}
\usage{
g2_microsats(genotypes, nperm = 0, nboot = 0, CI = 0.95, verbose = TRUE)
}
\arguments{
\item{genotypes}{\code{data.frame} with individuals in rows and loci in columns,
containing genotypes coded as 0 (homozygote), 1 (heterozygote) and \code{NA} (missing)}

\item{nperm}{Number of permutations for testing the hypothesis that the empirical g2-value is higher than the g2 for random associations between 
individuals and genotypes.}

\item{nboot}{Number of bootstraps for estimating a confidence interval}

\item{CI}{Confidence interval (default to 0.95)}

\item{verbose}{If FALSE, nothing will be printed to show the status of bootstraps and permutations.}
}
\value{
g2_microsats returns an object of class "inbreed".
The functions `print` and `plot` are used to print a summary and to plot the distribution of bootstrapped g2 values and CI.

An `inbreed` object from \code{g2_microsats} is a list containing the following components:

\item{call}{function call.}
\item{g2}{g2 value}
\item{p_val}{p value from permutation test}
\item{g2_permut}{g2 values from permuted genotypes}
\item{g2_boot}{g2 values from bootstrap samples}
\item{CI_boot}{confidence interval from bootstraps}
\item{se_boot}{standard error of g2 from bootstraps}
\item{nobs}{number of observations}
\item{nloc}{number of markers}
}
\description{
Estimating g2 from microsatellite data
}
\details{
Calculates g2 from smaller datasets. The underlying formula is compationally expensive 
         due to double summations over all paits of loci (see David et al. 2007). 
         Use convert_raw to convert raw genotypes (with 2 columns per locus) into
         the required format.
}
\examples{
data(mouse_msats)
# tranform raw genotypes into 0/1 format
genotypes <- convert_raw(mouse_msats)
(g2_mouse <- g2_microsats(genotypes, nperm = 1000, nboot = 100, CI = 0.95))

}
\author{
Martin A. Stoffel (martin.adam.stoffel@gmail.com) &
        Mareike Esser (messer@techfak.uni-bielefeld.de)
}
\references{
David, P., Pujol, B., Viard, F., Castella, V. and Goudet, J. (2007),
Reliable selfing rate estimates from imperfect population genetic data. Molecular Ecology,
16: 2474
}

