#' @title Quantitation of Raw MS Data
#'
#' @description
#'
#' @rdname quantify-methods.Rd
#'
#' @param object An instance of class [Spectra()].
#'
#' @param param An instance of class [QuantParam()] that defines the
#'     quantitation method. 
#' 
#' @return An instance of [QFeatures()].
#' 
#' @importFrom ProtGenerics quantify
setMethod("quantify", "Spectra",
          function(object, param, ...) {
              TRUE
          })
