test_that("QuantParam() works", {
    expect_true(validObject(QuantParam()))
    expect_true(isEmpty(QuantParam()))
    expect_true(validObject(QuantParam(msLevel = 1L,
                                       label = TRUE)))
    expect_true(validObject(QuantParam(msLevel = 2L,
                                       label = TRUE,
                                       params = list(reporters = TMT10))))
    ## errors for NA slots or unnamed list
    expect_error(QuantParam(msLevel = 1L))
    expect_error(QuantParam(label = TRUE))
    expect_error(QuantParam(param = list(a = 1)))
    expect_error(validObject(QuantParam(msLevel = 1L,
                                        label = TRUE,
                                        param = list(1, 2))))
    expect_error(QuantParam(msLevel = 0L,
                            label = TRUE,
                            param = list(a = 1)))
})
