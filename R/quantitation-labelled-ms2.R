#' @import Spectra
#'
#' @importFrom SummarizedExperiment SummarizedExperiment
#'
#' @importFrom S4Vectors SimpleList
#'
#' @importFrom methods as
#'
#' @noRd
quantify_1_labelled_ms2 <- function(x, reporters, ...) {
    pks <- peaksData(x)
    ans <- quantifyPeakMatrixList(pks, mz(reporters), w = width(reporters), ...)
    colnames(ans) <- reporterNames(reporters)
    SummarizedExperiment(assays = SimpleList(ans),
                         rowData = spectraData(x),
                         colData = as(reporters, "DataFrame"))
}

#' @title Labelled MS2 Quantitation
#'
#' @description
#'
#' Function that converses a `Spectra` instance into an object of
#' class `QFeatures` by quantifying reporter ions of the MS2 spectra.
#'
#' @param x An instance of class [Spectra] with MS2 spectra.
#'
#' @param reporters An instance of class [ReporterIons].
#'
#' @param ... Additional parameters passed to [BiocParallel::bplapply()].
#'
#' @return A instance of class [QFeatures] with as many assays as
#'     there where acquisitions in `x`.
#'
#' @import QFeatures
#'
#' @author Laurent Gatto
quantify_labelled_ms2 <- function(x, reporters, ...) {
    x <- filterMsLevel(x, 2L)
    ans <- lapply(split(x, x$dataOrigin),
                  quantify_1_labelled_ms2,
                  reporters, ...)
    ## don't use the full filenames 
    names(ans) <- make.unique(basename(names(ans)))
    QFeatures(ans)
}
