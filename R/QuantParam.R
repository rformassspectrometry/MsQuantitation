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
#' MS quantitation can be performed at the MS1 or MS2 (and 3)
#' levels. Additionally, quantitation can be label-free or
#' labelled. These two states are defined by the `msLevel` (an
#' integer) and `label` (a logical) parameters.
#'
#' Additional details about the quantitation method are defined as a
#' named list, as described in the 'Details' section. The example
#' below illustrates how to defined labelled (`label = TRUE`) MS2
#' (`msLevel = 2L) quantitation using TMT 10-plex isobaric tagging
#' (defined by the `TMT10` [ReporterIons()] instance).
#'
#' @details
#' 
#' Labelled MS2 Quantitation:
#'
#' - The `params` need only to contain a single mandatory element, a
#'   [ReporterIons()] instance, named `reporters`.
#'
#' Labelled MS3 Quantitation:
#'
#' - The `params` need to contain a mandatory element, a
#'   [ReporterIons()] instance, named `reporters`.
#'
#' - Two optional character strings, named `acquisitionNum` and
#'   `precScanNum`, containing the respective column names of the
#'   acquition number and precursor scan acquisition numbers in the
#'   raw data to be quantified. The default values are
#'   `"acquisitionNum"` and `"precScanNum"` respectively, which match
#'   the names in standard `Spectra` objects.
#' 
#'
#' @author Laurent Gatto
#'
#' @examples
#'
#' ## default (empty) parameters
#' QuantParam()
#'
#' isEmpty(QuantParam())
#'
#' ## MS2 quantitation using TMT10 plex
#' QuantParam(msLevel = 2L,
#'            label = TRUE,
#'            params = list(reporters = TMT10))
#'
#' ## MS3 quantitation using TMT16 plex and non-standard acquisition
#' ## number and precursor scan acqusition number
#' QuantParam(msLevel = 2L, label = TRUE,
#'            params = list(reporters = TMT10,
#'                          acqusitionNum = "aquisition_number",
#'                          preScanNum = "prec_scan_number"))
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
#' @slot label
#'
#' @slot params named `list()` of additional parameters. 
setClass("QuantParam",
         contains = "Param",
         slots = c(msLevel = "integer",
                   label = "logical",
                   params = "list"))

setValidity("QuantParam",
            function(object) {
                if (isEmpty(object))
                    return(TRUE)
                ## Non empty object validity
                msg <- character()
                ## params validity (must be a named list)
                if (length(object@params)) {
                    nms <- names(object@params)
                    if (is.null(nms) | any(nms == ""))
                        msg <- c(msg, "All parameters must be named.")
                }
                ## MS level validity
                if (is.na(object@msLevel)) {
                    msg <- c(msg, "MS level must be defined.")
                } else {
                    if (!object@msLevel %in% 1:3)
                        msg <- c(msg, "MS level must be 1, 2 or 3.")
                }
                ## Label falidity
                if (is.na(object@label))
                    msg <- c(msg, "Label must be defined.")                
                if (length(msg)) msg
                else TRUE
            })


#' @importFrom S4Vectors isEmpty
#'
#' @param x A instance of class `QuantParam`.
#' 
#' @rdname QuantParam
setMethod("isEmpty", "QuantParam",
          function(x) is.na(x@msLevel) & is.na(x@label) & !length(x@params))

#' @importFrom methods new
#'
#' @export
#'
#' @param msLevel `integer(1)` indicating the MS levels to be
#'     quantified. Default is `NA`.
#'
#' @param label `logical(1)` defining is labelled or label-free
#'     quantitation. Default is `NA`.
#' 
#' @param params `list()` containing additional method-specific
#'     quantitation parameters. The list must be named.
QuantParam <- function(msLevel = NA_integer_,
                       label = NA,
                       params = list())
    new("QuantParam",
        msLevel = msLevel, label = label, params = params)
