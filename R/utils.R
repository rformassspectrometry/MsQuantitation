#' @title Quantifies a Single Peak in a Peak Matrix
#' 
#' @param mz `numeric(1)` with the target m/z value to be quantified.
#' 
#' @param x A peak `matrix` with two columns, named `"intensity"` and
#'     `"mz"`.
#' 
#' @param w `numeric(1)` with the width around the target m/z value.
#'
#' @importFrom MsCoreUtils between
#'
#' @noRd
.quantify_peak <- function(mz, x, w) {
    mzs <- x[, "mz"]
    ints <- x[, "intensity"]    
    mz_region <- MsCoreUtils::between(mzs, c(mz - w, mz + w))
    ints <- ints[mz_region]
    max(ints)
}

#' @title Quantifies Peaks in a Peak Matrix
#'
#' @description
#'
#' The `quantifyPeakMatrix()` and `quantifyPeakMatrixList()` functions
#' will identify the highest peaks in a set of regions around one or
#' more target m/z (calculated as `mz` +/- `w`) and return the highest
#' intensities therein. If no peak is identified in a target region,
#' `NA` is returned for that region.
#'
#' @param x Either a single or a list of peak matrices, each with two
#'     columns, named `"intensity"` and `"mz"`.
#' 
#' @param mzs `numeric()` with the target m/z values to be
#'     quantified. 
#' 
#' @param w `numeric(1)` with the width around the target m/z value.
#' 
#' @return `quantifyPeakMatrix()` returns a `numeric` of length
#'     equal to `length(mzs)` with the intensity of the highest
#'     peak. `quantifyPeakMatrixList()` returns a `matrix` of
#'     dimension `length(x)` by `length(mzs)`.
#'
#' @author Laurent Gatto
#'
#' @noRd
#' 
#' @examples
#'
#' p <- data.frame(mz = 1:10, intensity = sort(runif(10)))
#' p
#'
#' ## intensity of peak at mz 5 
#' quantifyPeakMatrix(as.matrix(p), 5, 0)
#'
#' ## max intensity of peaks at mz 4 to 6
#' quantifyPeakMatrix(as.matrix(p), 5, 1)
#'
#' ## max intensity of peaks at mz 2 to 8
#' quantifyPeakMatrix(as.matrix(p), 5, 3)
#'
#' ## max intensity (all peaks)
#' quantifyPeakMatrix(as.matrix(p), 5, 5)
#'
#' ## also max intensity (even when w is out of bounds)
#' quantifyPeakMatrix(as.matrix(p), 5, 10)
#'
#' ## Multiple target m/z values
#' quantifyPeakMatrix(as.matrix(p), c(3, 6, 9), 1)
#'
#' ## Same for a list of peaks matrices
#' lp <- list(as.matrix(p), as.matrix(p), as.matrix(p))
#' quantifyPeakMatrixList(lp, c(3, 6, 9), 1)
quantifyPeakMatrix <- function(x, mzs, w = 0.05)
    sapply(mzs, .quantify_peak, x, w)

#' @importFrom BiocParallel bplapply
quantifyPeakMatrixList <- function(x, mzs, w = 0.05, ...) {
    ans <- bplapply(x, quantifyPeakMatrix, mzs, w, ...)
    do.call(rbind, ans)
}
