#' @title Quantiation Parameters
#'
#' @aliases QuantParam-class
#'
#' @name QuantParam
#' 
#' @description
#'
#' Quantitation of mass spectrometry data is implemented through the
#' [quantify()] method, that converts raw data objects such as
#' [Spectra()] into [QFeatures()] objects that store and hande
#' quantitative data. Quantitation methods for MS data a numerous and
#' varied, and the exact method to be applied on the raw data is
#' paramterised by a `QuantParam` instance, i.e. a dedicated class
#' that stores all the parameters needed to perform a specific
#' quantitation method. 
#'
#' @author Laurent Gatto
#'
#' @examples
#'
#' ## The default (empty) parameters
#' QuantParam()
#'
#' ## MS2 quantitation using TMT10 plex
#' QuantParam(msLevel = 2L, params = list(reporters = TMT10))
NULL


#' @exportClass QuantParam
#'
#' @rdname QuantParam
#'
#' @importClassesFrom ProtGenerics Param
#'
#' @slot msLevel `integer(1)` indicating the MS level the quantitation
#'     will be performed on.
#'
#' @slot params named `list()` of additional parameters. 
setClass("QuantParam",
         contains = "Param",
         slots = c(msLevel = "integer",
                   params = "list"))

setValidity("QuantParam",
            function(object) {
                msg <- character()
                if (length(object@params)) {
                    nms <- names(object@params)
                    if (is.null(nms) | any(nms == ""))
                        msg <- c(msg, "All parameters must be named.")
                }
                if (length(msg)) msg
                else TRUE
            })

#' export QuantParam
#'
#' @importFrom methods new
#'
#' @export
#'
#' @param msLevel `integer(1)` indicating the MS levels to be
#'     quantified.
#' 
#' @param params `list()` containing additional method-specific
#'     quantitation parameters.
QuantParam <- function(msLevel = integer(),
                       params = list())
    new("QuantParam", msLevel = msLevel, params = params)
