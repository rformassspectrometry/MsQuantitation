#' @title Reporter Ions Class
#'
#' @aliases ReporterIons-class
#'
#' @name ReporterIons
#'
#' @description
#'
#' The `ReporterIons` class defines a set of isobaric reporter ions
#' that are used for quantification of labelled MS2 data, e.g. iTRAQ
#' (isobaric tag for relative and absolute quantitation) or TMT
#' (tandem mass tags).
#'
#' Many commercial reporter ions are readily available. Custom
#' instances can be created with the `ReporterIons()` function.
#'
#' @references
#'
#' Ross PL, Huang YN, Marchese JN, Williamson B, Parker K, Hattan S,
#' Khainovski N, Pillai S, Dey S, Daniels S, Purkayastha S, Juhasz P,
#' Martin S, Bartlet-Jones M, He F, Jacobson A, Pappin
#' DJ. *Multiplexed protein quantitation in Saccharomyces cerevisiae
#' using amine-reactive isobaric tagging reagents.* Mol Cell
#' Proteomics, 2004 Dec;3(12):1154-69. Epub 2004 Sep 22. PubMed
#' PMID: 15385600.
#'
#' Thompson A, Schäfer J, Kuhn K, Kienle S, Schwarz J, Schmidt G,
#' Neumann T, Johnstone R, Mohammed AK, Hamon C. *Tandem mass tags: a
#' novel quantification strategy for comparative analysis of complex
#' protein mixtures by MS/MS.* Anal Chem. 2003 Apr
#' 15;75(8):1895-904. Erratum in: Anal Chem. 2006 Jun
#' 15;78(12):4235. Mohammed, A Karim A and Anal Chem. 2003 Sep
#' 15;75(18):4942. Johnstone, R. PubMed PMID: 12713048.
#' 
#' @author Laurent Gatto
#'
#' @examples
#'
#' ## Manual construction of a ReporterIons instance:
#' ReporterIons(description = "4-plex iTRAQ",
#'              name = "iTRAQ4",
#'              reporterNames = c("iTRAQ4.114", "iTRAQ4.115",
#'                                "iTRAQ4.116", "iTRAQ4.117"),
#'              mz = c(114.1, 115.1, 116.1, 117.1),
#'              width = 0.05)
#' 
#' ## Some pre-defined reporter ions constructors:
#' TMT10
#'
#' iTRAQ4
#'
#' TMT10[1:5]
#'
#' reporterNames(TMT10)
#'
#' names(TMT10)
#'
#' mz(TMT10)
#'
#' width(TMT10)
#'
#' as(TMT10, "DataFrame")
NULL


#' @slot name `character(1)` naming the instance.
#' 
#' @slot reporterNames `character()` of length equal to the number of
#'     reporter ions in the instance. Used to uniquely name each ion.
#'
#' @slot description `character(1)` with a free-text description of
#'     the instance. Default is an empty character.
#'
#' @slot mz `numeric()` with the reporter ions' m/z values.
#'
#' @slot width `numeric(1)` defining the region where the reporter
#'     ion can be expected. This region is calculated as `mz` +/-
#'     `width` for earch reporter ion.
#'
#' @exportClass ReporterIons
#'
#' @rdname ReporterIons
setClass("ReporterIons",
         slots = c(
             name = "character",
             reporterNames = "character",
             description = "character",
             mz = "numeric",
             width = "numeric"))

#' @export ReporterIons
#'
#' @importFrom methods new
#'
#' @param name Parameter to set the `name` slot.
#'
#' @param reporterNames Parameter to set the `reporterNames` slot.
#'
#' @param description Parameter to set the `description`
#'     slot. Default is `""`.
#'
#' @param mz Parameter to set the `mz` slot.
#'
#' @param width Parameter to set the `width` slot.
ReporterIons <- function(name, reporterNames,
                         description = "",
                         mz, width) {    
    if (length(mz) != length(reporterNames))
        stop("Length 'mz' and 'reporterNames' must be identical.")
    if (anyDuplicated(reporterNames)) {
        message("Reporter names must be unique.")
        reporterNames <- make.unique(reporterNames)
    }
    if (length(mz) != length(reporterNames)) {
        message("Setting reporter name.")
        reporterNames <- paste(name, mz, sep = ".")
    }
    new("ReporterIons",
        name = name,
        reporterNames = reporterNames,
        description = description,
        mz = mz,
        width = width)
}

#' @rdname ReporterIons
#'
#' @exportMethod show
#'
#' @param object An instance of class `ReporterIons`.
setMethod("show", "ReporterIons",
          function(object) {
              cat("Object of class \"", class(object), "\"\n",sep = "")
              cat(object@name, ": '",
                  object@description,
                  "' with ", length(object@mz),
                  " reporter ions\n", sep = "")
              if (length(object@mz)) {
                  for (i in 1:length(object@mz))
                      cat(" - [", object@reporterNames[i],
                          "] ", object@mz[i], " +/- ",
                          object@width, "\n", sep = "")
              }
              invisible(NULL)
          })


#' @rdname ReporterIons
#'
#' @param x An instance of class `ReporterIons`.
#'
#' @param i `numeric()` to subset `x`.
#'
#' @param j ignored.
#'
#' @param drop ignored.
#'
#' @export
setMethod("[", "ReporterIons",
          function(x, i = "numeric", j = "missing", drop = "missing") {
              if (max(i) > length(x@mz) | min(i) < 1)
                  stop("subscript out of bonds")
              new("ReporterIons",
                  name = paste0(x@name, "[", paste(i, collapse = ":"), "]"),
                  description = paste0("subset of ", x@description),
                  reporterNames = x@reporterNames[i],
                  mz = x@mz[i],
                  width = x@width)
          })
              
#' @rdname ReporterIons
#'
#' @export
setMethod("length", "ReporterIons", function(x) length(x@mz))

#' @rdname ReporterIons
#'
#' @exportMethod mz
setMethod("mz", "ReporterIons", function(object) object@mz)

#' @rdname ReporterIons
#'
#' @exportMethod width
#'
#' @importFrom BiocGenerics width
setMethod("width", "ReporterIons", function(x) x@width)

#' @export
#'
#' @rdname ReporterIons
reporterNames <- function(x) {
    stopifnot(inherits(x, "ReporterIons"))
    x@reporterNames
}

#' @export
#'
#' @rdname ReporterIons
#'
#' @importFrom methods validObject
#'
#' @param value A value for replacement.
"reporterNames<-" <- function(x, value) {
    stopifnot(inherits(x, "ReporterIons"))
    value <- as.character(value)
    if (length(value) != length(x))
        stop(paste0("Please provide names for ",
                    length(x),
                    " ions."))
    x@reporterNames <- value
    if (validObject(x)) x
}

        

#' @exportMethod description
#'
#' @rdname ReporterIons
#'
#' @importFrom Biobase description
setMethod("description", "ReporterIons",
          function(object) object@description)

#' @rdname ReporterIons
#'
#' @exportMethod names
setMethod("names", "ReporterIons",
          function(x) x@name)

#' @importFrom  S4Vectors DataFrame
#'
#' @importFrom methods setAs
#'
#' @export
setAs("ReporterIons", "DataFrame",
      function(from)
          DataFrame(name = names(from),
                    reporterName = reporterNames(from),
                    mz = mz(from),
                    width = width(from)))
