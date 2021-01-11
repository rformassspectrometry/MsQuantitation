library(testthat)
library(MsQuantitation)

## ----------------------------------------
## test data used in
## - test_quantify.R
## - test_quantitation_labelled_ms.R
spd <- DataFrame(msLevel = rep(1:3, 3),
                 scanIndex = 1:9,
                 rtime = seq(10, 100, length.out = 9),
                 dataOrigin = rep("f.mzML", 9),
                 acquisitionNum = 1:9,
                 precScanNum = as.integer(c(NA, 1, 2, NA, 4, 5, NA, 7, 8)))
spd$mz <- list(sort(runif(10, 100, 1000)), mz(TMT10), mz(TMT10),
               sort(runif(10, 100, 1000)), mz(TMT10), mz(TMT10),
               sort(runif(10, 100, 1000)), mz(TMT10), mz(TMT10))
spd$intensity <- list(runif(10, 1e4, 1e5), 1:10, 1:10,
                      runif(10, 1e4, 1e5), 10:1, 10:1,
                      runif(10, 1e4, 1e5), seq(10, 100, length.out = 10),
                      seq(10, 100, length.out = 10))
spd <- Spectra(spd)

## expected results
m <- matrix(c(1:10, 10:1, seq(10, 100, length.out = 10)),
              nrow = 3, byrow = TRUE)
colnames(m)  <- reporterNames(TMT10)


test_check("MsQuantitation")
