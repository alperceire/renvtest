server <- function(input, output) {
  output$distPlot <- renderPlot({
    ggplot2::ggplot(ggplot2::diamonds, aes(carat)) +
      geom_histogram()
  })
}

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      sliderInput("obs", "Number of observations:", min = 10, max = 500, value = 100)
    ),
    mainPanel(plotOutput("distPlot"))
  )
)

shiny::shinyApp(ui = ui, server = server)
