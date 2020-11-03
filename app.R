library(shiny)
library(ggplot2)

server <- function(input, output) {
  output$distPlot <- renderPlot({
    ggplot2::ggplot(ggplot2::diamonds, aes(carat)) +
      geom_histogram()
  })
  output$lib <- shiny::renderText(paste("libpaths : ", .libPaths(), "\n",
                                        "cache : ", renv:::renv_paths_cache()))
}

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      sliderInput("obs", "Number of observations:", min = 10, max = 500, value = 100)
    ),
    mainPanel(plotOutput("distPlot"), shiny::textOutput("lib"))
  )
)

shiny::shinyApp(ui = ui, server = server)
