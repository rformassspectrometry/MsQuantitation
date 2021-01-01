#' @export
#'
#' @rdname ReporterIons
iTRAQ4 <- ReporterIons(
    name = "iTRAQ4",
    reporterNames = c("iTRAQ4_114", "iTRAQ4_115",
                      "iTRAQ4_116", "iTRAQ4_117"),
    mz = c(114.1112, 115.1083, 116.1116, 117.1150),
    width = 0.05)

#' @export
#'
#' @rdname ReporterIons
iTRAQ5 <- ReporterIons(
    name = "iTRAQ5",
    reporterNames = c("iTRAQ5_114", "iTRAQ5_115",
                      "iTRAQ5_116", "iTRAQ5_117",
                      "iTRAQ5_145"),
    mz = c(114.1112, 115.1083, 116.1116, 117.1150, 145.1),
    width = 0.05)

#' @export
#'
#' @rdname ReporterIons
iTRAQ8 <- ReporterIons(
    name = "iTRAQ8",
    reporterNames = c("iTRAQ8_113", "iTRAQ8_114",
                      "iTRAQ8_115", "iTRAQ8_116",
                      "iTRAQ8_117", "iTRAQ8_118",
                      "iTRAQ8_119", "iTRAQ8_121"),
    mz = c(113.10787, 114.11123, 115.10826, 116.11162,
           117.11497, 118.11201, 119.1153, 121.1220),
    width = 0.05)

#' @export
#'
#' @rdname ReporterIons
iTRAQ9 <- ReporterIons(
    name = "iTRAQ9",
    reporterNames = c("iTRAQ9_113", "iTRAQ9_114",
                      "iTRAQ9_115", "iTRAQ9_116",
                      "iTRAQ9_117", "iTRAQ9_118",
                      "iTRAQ9_119", "iTRAQ9_121",
                      "iTRAQ9_305"),
    mz = c(113.10787, 114.11123, 115.10826, 116.11162,
           117.11497, 118.11201, 119.1153, 121.1220, 305.1),
    width = 0.05)


#' @export
#'
#' @rdname ReporterIons
TMT10HCD <- ReporterIons(
    name = "TMT10HCD",
    reporterNames = c("TMT10_126", "TMT10_127N", "TMT10_127C",
                      "TMT10_128N", "TMT10_128C", "TMT10_129N",
                      "TMT10_129C", "TMT10_130N", "TMT10_130C",
                      "TMT10_131"),
    mz = c(126.127726,  ## 126
           127.124761,  ## 127N
           127.131081,  ## 127C
           128.128116,  ## 128N
           128.134436,  ## 128C
           129.131471,  ## 129N
           129.137790,  ## 129C
           130.134825,  ## 130N
           130.141145,  ## 130C
           131.138180), ## 131
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
    reporterNames = c("TMT10_126", "TMT10_127N", "TMT10_127C",
                      "TMT10_128N", "TMT10_128C", "TMT10_129N",
                      "TMT10_129C", "TMT10_130N", "TMT10_130C",
                      "TMT10_131"),
    mz = c(114.127725,  ## 126
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
    reporterNames = c("TMT11_126", "TMT11_127N", "TMT11_127C",
                      "TMT11_128N", "TMT11_128C", "TMT11_129N",
                      "TMT11_129C", "TMT11_130N", "TMT11_130C",
                      "TMT11_131N", "TMT11_131C"),
    mz = c(126.127726,  ## 126
           127.124761,  ## 127N
           127.131081,  ## 127C
           128.128116,  ## 128N
           128.134436,  ## 128C
           129.131471,  ## 129N
           129.137790,  ## 129C
           130.134825,  ## 130N
           130.141145,  ## 130C               
           131.138180,  ## 131N
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
    reporterNames = c("TMT16_126", "TMT16_127N", "TMT16_127C",
                      "TMT16_128N", "TMT16_128C", "TMT16_129N",
                      "TMT16_129C", "1TMT16_30N", "TMT16_130C",
                      "TMT16_131N", "TMT16_131C", "TMT16_132N",
                      "TMT16_132C", "TMT16_133N", "TMT16_133C",
                      "TMT16_134N"),
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
    reporterNames = c("TMT6_126", "TMT6_127", "TMT6_128",
                      "TMT6_129", "TMT6_130", "TMT6_131"),
    mz = c(126.127725, 127.131079, 128.134433, 129.137787,
           130.141141, 131.138176),
    width = 0.05)

#' @export
#'
#' @rdname ReporterIons
TMT6b <- ReporterIons(
    name = "TMT6",
    reporterNames = c("TMT6_126", "TMT6_127", "TMT6_128",
                      "TMT6_129", "TMT6_130", "TMT6_131"),
    mz = c(126.127725, 127.124760, 128.134433, 129.131468,
           130.141141, 131.138176),
    width = 0.05)

#' @export
#'
#' @rdname ReporterIons
TMT7 <- ReporterIons(
    name = "TMT7",
    reporterNames = c("TMT7_126", "TMT7_127",
                      "TMT7_128", "TMT7_129",
                      "TMT7_130", "TMT7_131",
                      "TMT7_230"),
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
    reporterNames = c("TMT7_126", "TMT7_127",
                      "TMT7_128", "TMT7_129",
                      "TMT7_130", "TMT7_131",
                      "TMT7_230"),
    mz = c(126.127725,
           127.124760,
           128.134433,
           129.131468,
           130.141141,
           131.138176,
           230.17),
    width = 0.05)
