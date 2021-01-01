#' @import Spectra
#'
#' @importFrom SummarizedExperiment SummarizedExperiment
#'
#' @importFrom S4Vectors SimpleList
#'
#' @importFrom methods as
quantify_1_labelled_ms3 <- function(x, reporters, ...) {
    x3 <- filterMsLevel(x, 3L)
    pks <- peaksData(x3)
    ans <- quantifyPeakMatrixList(pks, mz(reporters), w = width(reporters), ...)
    colnames(ans) <- paste(names(reporters), round(mz(reporters), 2), sep = "_")
    i <- match(x3$precScanNum, x$acquisitionNum)
    SummarizedExperiment(assays = SimpleList(ans),
                         rowData = rowData(aspectraData(x)[i, ],
                         colData = as(reporters, "DataFrame"))
}


quantify_labelled_ms3 <- function(x, reporters, ...) {
    ## need MS level 3 for quantitation and level 2 for identification
    x <- filterMsLevel(x, 2:3)
    ans <- lapply(split(x, x$dataOrigin),
                  quantify_1_labelled_ms3,
                  reporters, ...)
    ## don't use the full filenames 
    names(ans) <- make.unique(basename(names(ans)))
    QFeatures(ans)
}
