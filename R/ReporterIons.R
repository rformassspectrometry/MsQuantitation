#' @export
#'
#' @rdname ReporterIons
iTRAQ4 <- ReporterIons(
    name = "iTRAQ4",
    reporterNames = c("iTRAQ4.114", "iTRAQ4.115",
                      "iTRAQ4.116", "iTRAQ4.117"),
    mz = c(114.1112, 115.1083, 116.1116, 117.1150),
    width = 0.05)

#' @export
#'
#' @rdname ReporterIons
iTRAQ5 <- ReporterIons(
    name = "iTRAQ5",
    reporterNames = c("iTRAQ5.114", "iTRAQ5.115",
                      "iTRAQ5.116", "iTRAQ5.117",
                      "iTRAQ5.145"),
    mz = c(114.1112, 115.1083, 116.1116, 117.1150, 145.1),
    width = 0.05)

#' @export
#'
#' @rdname ReporterIons
iTRAQ8 <- ReporterIons(
    name = "iTRAQ8",
    reporterNames = c("iTRAQ8.113", "iTRAQ8.114",
                      "iTRAQ8.115", "iTRAQ8.116",
                      "iTRAQ8.117", "iTRAQ8.118",
                      "iTRAQ8.119", "iTRAQ8.121"),
    mz = c(113.10787, 114.11123, 115.10826, 116.11162,
           117.11497, 118.11201, 119.1153, 121.1220),
    width = 0.05)

#' @export
#'
#' @rdname ReporterIons
iTRAQ9 <- ReporterIons(
    name = "iTRAQ9",
    reporterNames = c("iTRAQ9.113", "iTRAQ9.114",
                      "iTRAQ9.115", "iTRAQ9.116",
                      "iTRAQ9.117", "iTRAQ9.118",
                      "iTRAQ9.119", "iTRAQ9.121",
                      "iTRAQ9.305"),
    mz = c(113.10787, 114.11123, 115.10826, 116.11162,
           117.11497, 118.11201, 119.1153, 121.1220, 305.1),
    width = 0.05)


#' @export
#'
#' @rdname ReporterIons
TMT10HCD <- ReporterIons(
    name = "TMT10HCD",
    reporterNames = c("126", "127N", "127C", "128N", "128C",
                      "129N", "129C", "130N", "130C", "131"),
    mz = c(126.127725,  ## 126
           127.12476,   ## 127N
           127.131079,  ## 127C
           128.128114,  ## 128N
           128.134433,  ## 128C
           129.131468,  ## 129N
           129.137787,  ## 129C
           130.134822,  ## 130N
           130.141141,  ## 130C
           131.138176), ## 131
    width = 0.002)

#' @export
#'
#' @rdname ReporterIons
TMT10 <- TMT10HCD

#' @export
#'
#' @rdname ReporterIons
TMT10ETD <- ReporterIons(
    name = "TMT10ETD",
    reporterNames = c("126", "127N", "127C", "128N",
                      "128C", "129N", "129C", "130N",
                      "130C", "131"),
    mz = c(
        114.127725,  ## 126
        115.12476,   ## 127N
        114.127725,  ## 127C
        115.12476,   ## 128N
        116.134433,  ## 128C
        117.131468,  ## 129N
        116.134433,  ## 129C
        117.131468,  ## 130N
        118.141141,  ## 130C
        119.138176), ## 131
    width = 0.002)

#' @export
#'
#' @rdname ReporterIons
TMT11HCD <- ReporterIons(
    name = "TMT11HCD",
    reporterNames = c("126", "127N", "127C", "128N", "128C",
                      "129N", "129C", "130N", "130C", "131N",
                      "131C"),
    mz = c(126.127725,  ## 126
           127.12476,   ## 127N
           127.131079,  ## 127C
           128.128114,  ## 128N
           128.134433,  ## 128C
           129.131468,  ## 129N
           129.137787,  ## 129C
           130.134822,  ## 130N
           130.141141,  ## 130C               
           131.138176,  ## 131N
           131.144499), ## 131C
    width = 0.002)

#' @export
#'
#' @rdname ReporterIons
TMT11 <- TMT11HCD

#' @export
#'
#' @rdname ReporterIons
TMT16HCD <- ReporterIons(
    name = "TMT16HCD",
    reporterNames = c("126", "127N",
                      "127C", "128N", "128C", "129N",
                      "129C", "130N", "130C", "131N",
                      "131C", "132N", "132C", "133N",
                      "133C", "134N"),
    mz = c(126.127726,  ## 126
           127.124761,  ## 127N
           127.131081,  ## 127C
           128.128116,  ## 128N
           128.134436,  ## 128C
           129.131471,  ## 129N
           129.13779,   ## 129C
           130.134825,  ## 130N
           130.141145,  ## 130C 
           131.13818,   ## 131N
           131.1445,    ## 131C
           132.141535,  ## 132N
           132.147855,  ## 132C
           133.14489,   ## 133N
           133.15121,   ## 133C
           134.148245), ## 134N
    width = 0.002)

#' @export
#'
#' @rdname ReporterIons
TMT16 <- TMT16HCD

#' @export
#'
#' @rdname ReporterIons
TMT6 <- ReporterIons(
    name = "TMT6",
    reporterNames = c("TMT6.126", "TMT6.127", "TMT6.128",
                      "TMT6.129", "TMT6.130", "TMT6.131"),
    mz = c(126.127725, 127.131079, 128.134433, 129.137787,
           130.141141, 131.138176),
    width = 0.05)

#' @export
#'
#' @rdname ReporterIons
TMT6b <- ReporterIons(
    name = "TMT6",
    reporterNames = c("TMT6.126", "TMT6.127", "TMT6.128",
                      "TMT6.129", "TMT6.130", "TMT6.131"),
    mz = c(126.127725, 127.124760, 128.134433, 129.131468,
           130.141141, 131.138176),
    width = 0.05)

#' @export
#'
#' @rdname ReporterIons
TMT7 <- ReporterIons(
    name = "TMT7",
    reporterNames = c("TMT7.126", "TMT7.127",
                      "TMT7.128", "TMT7.129",
                      "TMT7.130", "TMT7.131",
                      "TMT7.230"),
    mz = c(126.127725,
           127.131079,
           128.134433,
           129.137787,
           130.141141,
           131.138176,
           230.17),
    width = 0.05)

#' @export
#'
#' @rdname ReporterIons
TMT7b <- ReporterIons(
    name = "TMT7",
    reporterNames = c("TMT7.126", "TMT7.127",
                      "TMT7.128", "TMT7.129",
                      "TMT7.130", "TMT7.131",
                      "TMT7.230"),
    mz = c(126.127725,
           127.124760,
           128.134433,
           129.131468,
           130.141141,
           131.138176,
           230.17),
    width = 0.05)
