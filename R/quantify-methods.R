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
#' @param ... additional parameters (currently ignored).
#' 
#' @return An instance of [QFeatures()].
#' 
#' @importFrom ProtGenerics quantify
setMethod("quantify", "Spectra",
          function(object, param, ...) {
              TRUE
          })
