#' @name facetsr
#'
#' @title facetsr
#'
#' @description This is facets R wrapper
#'
#' @details This is htmlwidget librray.
#' @importFrom utils packageName
#' @import htmltools
#' @import htmlwidgets
NULL

#' Access files in the current app
#'
#' @param ... Character vector specifying directory and or file to
#'     point to inside the current package.
#' @examples
#' \dontrun{
#' inst_path("")
#' }
#' @export
inst_path <- function(...) {
  system.file(..., package = packageName())
}
