pks <- matrix(c(seq(1.0, 10, 1), c(1:6, 4:1)),
              ncol = 2)
colnames(pks) <- c("mz", "intensity")

test_that(".quantify_peaks() work", {
    expect_identical(MsQuantitation:::.quantify_peak(6, pks, 0), 6)
    expect_identical(MsQuantitation:::.quantify_peak(6, pks, 1), 6)
    expect_identical(MsQuantitation:::.quantify_peak(5, pks, 1), 6)
    expect_equal(MsQuantitation:::.quantify_peak(5, pks, 0), 5)
    expect_equal(MsQuantitation:::.quantify_peak(1, pks, 10), 6)
    expect_equal(MsQuantitation:::.quantify_peak(1, pks, 3), 4)
    pks[5, 2] <- NA_real_
    expect_equal(MsQuantitation:::.quantify_peak(5, pks, 0), NA_real_)
    expect_equal(MsQuantitation:::.quantify_peak(5, pks, 10), NA_real_)
    expect_equal(MsQuantitation:::.quantify_peak(1, pks, 3), 4)    
})


test_that("quantifyPeakMatrix() works", {
    expect_identical(quantifyPeakMatrix(pks, 5, w = 0.05), 5)
    expect_identical(quantifyPeakMatrix(pks, 5, w = 0), 5)
    expect_identical(quantifyPeakMatrix(pks, 5, w = 1), 6)
    expect_identical(quantifyPeakMatrix(pks, c(1:10), w = 0), pks[, 2])
    expect_identical(quantifyPeakMatrix(pks, c(10:1), w = 0), pks[10:1, 2])
    expect_identical(quantifyPeakMatrix(pks, c(1, 3, 6), w = 0),
                     pks[c(1, 3, 6), 2])
    
})


test_that("quantifyPeakMatrixList() works", {
    pl <- list(pks, pks)
    expect_identical(quantifyPeakMatrixList(pl, 5, w = 0.05),
                     matrix(c(5, 5), ncol = 1))
    expect_identical(quantifyPeakMatrixList(pl, 1:10, w = 0.05),
                     matrix(c(pks[, 2], pks[, 2]),
                            ncol = 10, byrow = TRUE))    
})


