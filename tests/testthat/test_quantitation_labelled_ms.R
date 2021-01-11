test_that("quantify_labelled_ms*() works", {
    q2 <- MsQuantitation:::quantify_labelled_ms2(spd, TMT10)
    q3 <- MsQuantitation:::quantify_labelled_ms3(spd, TMT10,
                                                 "acquisitionNum", "precScanNum")
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


test_that("quantify,Spectra work", {
    p2 <- QuantParam(msLevel = 2L, label = TRUE,
                     params = list(reporters = TMT10))
    res2 <- quantify(spd, p2)

    p3 <- QuantParam(msLevel = 3L, label = TRUE,
                     params = list(reporters = TMT10))
    res3 <- quantify(spd, p3)

    q2 <- MsQuantitation:::quantify_labelled_ms2(spd, TMT10)
    expect_identical(q2, res2)
    q3 <- MsQuantitation:::quantify_labelled_ms3(spd, TMT10,
                                                 "acquisitionNum", "precScanNum")
    expect_identical(q3, res3)
})
