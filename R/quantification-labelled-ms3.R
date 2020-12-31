quantify_labelled_ms3 <- function(x, reporters, ...) {
    x_quant <- filterMsLevel(x, 3L)
    ans <- lapply(split(x_quant, x_quant$dataOrigin),
                  quantify_1_labelled_ms,
                  reporters, ...,
                  msLevel = 3L)
    ## don't use the full filenames 
    names(ans) <- make.unique(basename(names(ans)))
    ## need to update the rowdata of each assay
    QFeatures(ans)
}
