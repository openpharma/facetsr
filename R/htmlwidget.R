#' Explorer data using facets
#'
#' @description This function generate htmlwidget object that using facets from Google Pair
#'
#' @seealso \href{https://pair-code.github.io/facets/}{Facets Google pair website}
#' @param data put data depends from facets type
#' - facets-dive - data frame (multi table is not supported yet)
#' - facets-overview - data frame or list of data frame as list of list
#' @param type one of the type of facets c("facets-dive", "facets-overview")
#' @param width width for html widget
#' @param height height for html widget by default 600
#' @param elementId id of the element
#' @return the htmlwidget
#' @examples
#' \donttest{
#' # Use predefined function or standard facets
#' # facets dive
#' facets_dive(iris)
#'
#' # facets overview
#' facets_overview(iris)
#' facets_overview(list(list(data = iris, name = "iris"), list(data = cars, name = "cars")))
#' }
#' @examples \donttest{inst/examples/app.R}
#' @name facets
#' @export
facets <- function(
  data = list(), type = c("facets-dive", "facets-overview"), width = NULL,
  height = 600, elementId = NULL
) {
  # allows only possible types
  type <- match.arg(type)

  if (identical(type, "facets-overview") && is.data.frame(data))
    data <- list(list(data = data, name = "data.frame"))

  # forward options using x
  x <- list(
    json = jsonlite::toJSON(data),
    height = height,
    type = type
  )

  # create widget
  htmlwidgets::createWidget(
    name = "facetsr",
    x,
    width = width,
    height = height,
    package = "facetsr",
    elementId = elementId
  )
}

#' Predefined factes-dive
#'
#' @param ... arguments to facets wihout type
#' @rdname facets
#' @export
facets_dive <- function(...) {
  facets(..., type = "facets-dive")
}

#' Predefined factes-overview
#'
#' @param ... arguments to facets wihout type
#' @rdname facets
#' @export
facets_overview <- function(...) {
  facets(..., type = "facets-overview")
}


#' Shiny bindings for facets
#'
#' Output and render functions for using facets within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended. \code{height} will probably not
#'   have an effect; instead, use the \code{height} parameter in
#'   \code{\link[facets]{facets}}.
#' @param expr An expression that generates a facets canvas
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name facets-shiny
#' @export
facets_output <- function(outputId, width = "100%", height = "auto") {
  htmlwidgets::shinyWidgetOutput(outputId, "facetsr", width, height, package = "facetsr")
}

#' @rdname facets-shiny
#' @export
render_facets <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) expr <- substitute(expr) # force quoted
  htmlwidgets::shinyRenderWidget(expr, facets_output, env, quoted = TRUE)
}
