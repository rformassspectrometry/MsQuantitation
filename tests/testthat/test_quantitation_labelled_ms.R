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


m <- matrix(c(1:10, 10:1, seq(10, 100, length.out = 10)),
              nrow = 3, byrow = TRUE)
colnames(m)  <- reporterNames(TMT10)

test_that("quantify_labelled_ms*() works", {
    q2 <- quantify_labelled_ms2(spd, TMT10)
    q3 <- quantify_labelled_ms3(spd, TMT10, "acquisitionNum", "precScanNum")
    ## check assay
    expect_identical(assay(q2[[1]]), m)
    expect_identical(assay(q2[[1]]), assay(q3[[1]]))
    ## check rowData
    expect_identical(rowData(q2[[1]]),
                     spectraData(filterMsLevel(spd, 2)))
    expect_identical(rowData(q2[[1]]), rowData(q3[[1]]))
    ## check assays' colData
    expect_identical(colData(q2[[1]]),
                     DataFrame(as(TMT10, "DataFrame"),
                               row.names = reporterNames(TMT10)))
    expect_identical(colData(q2[[1]]), colData(q3[[1]]))
    ## check colData
    expect_identical(colData(q2),
                     DataFrame(row.names = reporterNames(TMT10)))
    expect_identical(colData(q2), colData(q3))
})
