.onLoad <- function(libname, pkgname) {

  op <- options()
  op.tidynhl <- list(
    tidynhl.data.table = TRUE
  )
  toset <- !(names(op.tidynhl) %in% names(op))
  if(any(toset)) options(op.tidynhl[toset])
  invisible()

}
