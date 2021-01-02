test_that("Reporter ion classes", {
    expect_s4_class(iTRAQ4, "ReporterIons")
    expect_s4_class(iTRAQ5, "ReporterIons")
    expect_s4_class(iTRAQ8, "ReporterIons")
    expect_s4_class(iTRAQ9, "ReporterIons")
    expect_s4_class(TMT10HCD, "ReporterIons")
    expect_s4_class(TMT10, "ReporterIons")
    expect_s4_class(TMT10ETD, "ReporterIons")
    expect_s4_class(TMT11HCD, "ReporterIons")
    expect_s4_class(TMT11, "ReporterIons")
    expect_s4_class(TMT16HCD, "ReporterIons")
    expect_s4_class(TMT16, "ReporterIons")
    expect_s4_class(TMT6, "ReporterIons")
    expect_s4_class(TMT6b, "ReporterIons")
    expect_s4_class(TMT7, "ReporterIons")
    expect_s4_class(TMT7b, "ReporterIons")
})


test_that("ReporterIons are valid", {
    expect_true(validObject(iTRAQ4))
    expect_true(validObject(iTRAQ5))
    expect_true(validObject(iTRAQ8))
    expect_true(validObject(iTRAQ9))
    expect_true(validObject(TMT10HCD))
    expect_true(validObject(TMT10))
    expect_true(validObject(TMT10ETD))
    expect_true(validObject(TMT11HCD))
    expect_true(validObject(TMT11))
    expect_true(validObject(TMT16HCD))
    expect_true(validObject(TMT16))
    expect_true(validObject(TMT6))
    expect_true(validObject(TMT6b))
    expect_true(validObject(TMT7))
    expect_true(validObject(TMT7b))    
})

test_that("ReporterIons() work", {
    ri <- ReporterIons(name = "test",
                       reporterNames = paste0("ri", 1:4),
                       mz = 1:4,
                       width = 0.01)
    expect_length(ri, 4)
    expect_identical(names(ri), "test")
    expect_identical(mz(ri), 1:4)
    expect_identical(width(ri), 0.01)
    expect_identical(reporterNames(ri), paste0("ri", 1:4))
    expect_null(show(ri))
    ri <- ri[1:2]
    expect_length(ri, 2)
    expect_identical(names(ri), "test[1:2]")
    expect_identical(mz(ri), 1:2)
    expect_identical(width(ri), 0.01)
    expect_identical(reporterNames(ri), paste0("ri", 1:2))
    reporterNames(ri) <- letters[1:2]
    expect_identical(reporterNames(ri), c("a", "b"))
    expect_error(ri[1:3])
    expect_error(ReporterIons(name = "test",
                       reporterNames = paste0("ri", 1:4),
                       mz = 1:2,
                       width = 0.01))
    expect_message(ri <- ReporterIons(name = "test",
                                      reporterNames = c("ri", "ri"),
                                      mz = 1:2,
                                      width = 0.01))
    expect_identical(reporterNames(ri), c("ri", "ri.1"))
    expect_error(reporterNames(ri) <- letters[1:3])
})
