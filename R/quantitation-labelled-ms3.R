#' @import Spectra
#'
#' @importFrom SummarizedExperiment SummarizedExperiment
#'
#' @importFrom S4Vectors SimpleList
#'
#' @importFrom methods as
#'
#' @details
#'
#' While quantitation is performed at the MS3 level to populate the
#' assay slot, the SummarizedExperiment's rowData stems from the
#' MS2-level data. The matching between the MS3 scans and their
#' corresponding precursor MS2 scans is performed by matching two
#' variables of `spectraData(x)`. These two variables correspond to
#' the characters defined in `acquistionNum` and `precScanNum`, that
#' by default contain `"acquisitionNum"` (the acquisition numbers of
#' all spectra) and `"precScanNum"` (the acquisition number of
#' precursor scans). These defaults work with standard `Spectra`
#' objects.
#'
#' @param x A `Spectra` object.
#'
#' @param reporters A `ReporterIons` object.
#'
#' @param acquistionNum `character(1)` rowData column name defining all scan
#'     acquisition numbers. Default is `"acquistionNum"`.
#'
#' @param precScanNum `character(1)` rowData column name defining the
#'     precursor scan acquisition numbers . Default is
#'     `"precScanNum"`.
#'
#' @param ... Additional parameters passed to
#'     [BiocParallel::bplally()].
#'
#' @noRd
quantify_1_labelled_ms3 <- function(x, reporters,
                                    acquistionNum = "acquisitionNum",
                                    precScanNum = "precScanNum",
                                    ...) {
    stopifnot(length(acquisitionNum) == 1)
    stopifnot(length(precScanNum) == 1)
    x3 <- filterMsLevel(x, 3L)
    pks <- peaksData(x3)
    ans <- quantifyPeakMatrixList(pks, mz(reporters), w = width(reporters), ...)
    colnames(ans) <- reporterNames(reporters)
    i <- match(x3[[precScanNum]], x[[acquistionNum]])
    SummarizedExperiment(assays = SimpleList(ans),
                         rowData = spectraData(x)[i, ],
                         colData = as(reporters, "DataFrame"))
}


#' @title Labelled MS3 Quantitation
#'
#' @description
#'
#' Function that converses a `Spectra` instance into an object of
#' class `QFeatures` by quantifying reporter ions of the MS3
#' spectra. The assays rowData are pulled from the respective MS2
#' precursor scans.
#'
#' @param x An instance of class [Spectra] with MS2 and MS3 spectra.
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
