test_that("quantify() error work", {
    expect_error(quantify(spd), "Please provide quantitation parameters.")
    expect_error(quantify(spd, QuantParam()),
                 "Please provide valid quantitation parameters.")
    expect_error(quantify(spd, spd),
                 "Please provide valid quantitation parameters.")
    expect_error(quantify(spd, "QuantParam"),
                 "Please provide valid quantitation parameters.")
})


test_that("quantify() unavailable quantitations", {
    p <- QuantParam(msLevel = 1L, label = TRUE)
    expect_error(quantify(spd, p),
                 "MS1 quantitation not available.")
    p <- QuantParam(msLevel = 1L, label = FALSE)
    expect_error(quantify(spd, p),
                 "MS1 quantitation not available.")
    p <- QuantParam(msLevel = 2L, label = FALSE)
    expect_error(quantify(spd, p),
                 "Label-free MS2 quantitation not available.")
    p <- QuantParam(msLevel = 2L, label = TRUE)
    expect_error(quantify(spd, p),
                 "Reporters must be defined for labelled MS2/3 quantitation.")
})
