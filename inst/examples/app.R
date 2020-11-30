# Simple shiny example
library(shiny)
library(facetsr)

server <- function(input, output, session) {
  output$facets_overview <- render_facets({
    facets_overview(list(list(data = iris, name = "iris"), list(data = cars, name = "cars")))
  })

  output$facets_dive <- render_facets({
    facets_dive(iris)
  })


}


ui <- fluidPage(
  titlePanel("Simple facets example"),
  facets_output("facets_overview"),
  facets_output("facets_dive")
)

shinyApp(ui = ui, server = server)
