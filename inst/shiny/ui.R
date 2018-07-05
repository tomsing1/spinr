# Define UI for application that draws a histogram
shinyUI(
  
  fluidPage(
    # Application title
    titlePanel("Can you balance the centrifuge?"),
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
      sidebarPanel(
        # fix alignment of
        alignCheckBoxGroup(),
        radioButtons("rotor_size",
                     label = h4("Rotor size"),
                     choices = list("12" = 12, "16" = 16, "24" = 24, "32" = 32),
                     selected = "12", inline = TRUE),
        uiOutput("occupied"),
        uiOutput("button"),
        actionButton("reset", "Reset"),
        br(),
        br(),
        imageOutput("image")
      ),
      # Show a plot of the generated distribution
      mainPanel(
        uiOutput("task"),
        plotOutput("rotorPlot"),
        mainPanel(
          verbatimTextOutput("result")
        )
      )
    )
  ))
