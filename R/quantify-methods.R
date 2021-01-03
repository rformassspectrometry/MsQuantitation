#' @title Quantitation of Raw MS Data
#'
#' @description
#'
#' The `quantify()` method is the entry point for quantitation of raw
#' mass spectrometry data. The raw data is contained in a [Spectra()]
#' object while the details and parameters of the quantitation method
#' are defined in a dedicated [QuantParam()].
#'
#' @aliases quantify quantify,Spectra
#'
#' @rdname quantify-methods.Rd
#'
#' @param object An instance of class [Spectra()].
#'
#' @param param An instance of class [QuantParam()] that defines the
#'     quantitation method.
#'
#' @param ... additional parameters controlled parallel processing of
#'     the data. See [BiocParallel::bplapply()] for details.
#' 
#' @return An instance of [QFeatures()] with as many assays as there
#'     where acquisitions (files) in `object`.
#' 
#' @importFrom ProtGenerics quantify
#'
#' @examples
#'
#' ## ----------------------------------------
#' ## Labelled MS2 quantitation
#' ## ----------------------------------------
#' 
#' ## Test data from the msdata package
#' f <- msdata::proteomics(pattern = "01.mzML.gz", full.names = TRUE) 
#' rw <- Spectra(f)
#'
#' ## Quantitation parameters
#' p <- QuantParam(msLevel = 2L, label = TRUE,
#'                 params = list(reporters = TMT6))
#' p
#' 
#' quantify(rw, p)
#'
#' ## Simulate data from 2 files
#' rw <- filterMsLevel(rw, 2L) 
#' rw <- setBackend(rw, MsBackendDataFrame())
#' 
#' rw$dataOrigin <- sample(c("file1", "file2"),
#'                         length(rw),
#'                         replace = TRUE)
#'
#' quantify(rw, p)
#'
#' ## ----------------------------------------
#' ## Labelled MS3 quantitation
#' ## ----------------------------------------
#'
#' ## Test data from the msdata pakage
#' basename(f <- msdata::proteomics(pattern = "MS3TMT11", full.names = TRUE))
#' x <- Spectra(f)
#'
#' ## Quantitation parameters
#' p <- QuantParam(msLevel = 3L, label = TRUE,
#'                 params = list(reporters = TMT11))
#' p
#'
#' quantify(x, p)
setMethod("quantify", "Spectra",
          function(object, param, ...) {
              if (!missing(param) & !inherits(param, "QuantParam"))
                  stop("Please provide quantitation parameters.")
              if (missing(param) | isEmpty(param))
                  stop("Please provide quantitation parameters.")
              if (param@msLevel == 1) {
                  stop("MS1 quantitation not available.")
              } else { ## MS level 2 or 3
                  if (param@label) {
                      reporters <- param@params[["reporters"]]
                      if (is.null(reporters))
                          stop("Reporters must be defined for labelled MS2/3 quantitation.")
                      if (param@msLevel == 2L) 
                          quantify_labelled_ms2(object, reporters = reporters, ...)
                      else ## MS3
                          quantify_labelled_ms3(object, reporters = reporters, ...)

                  } else {
                      stop("Label-free MS2 quantitation not available.")
                  }
              }

          })
