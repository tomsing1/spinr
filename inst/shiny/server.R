shinyServer(function(input, output, session) {
  N <- reactive(as.integer(input$rotor_size))
  ToPlace <- reactive({
    sample(seq(2, ceiling(N()/2)), size = 1)
  })
  Placed <- reactive(as.integer(input$occupied))
  
  Remaining <- reactive({
    ToPlace() - length(Placed())
  })
  
  Loading <- reactive({
    req(N())
    df <- calculate_positions(N())
    df$occupied <- FALSE
    df[as.integer(Placed()), "occupied"] <- TRUE
    return(df)
  })
  
  Balanced <- eventReactive(input$goButton, {
    is_balanced(Loading())
  })

  observeEvent(input$reset, {
    session$reload()
  })
  
  output$task <- renderUI({
    req(Remaining())
    if (Remaining() > 0) {
      return(h3(sprintf("Please load %s more tubes!", Remaining())))
    } else if (Remaining() < 0) {
      return(h3(sprintf("Please unload %s tubes!", -Remaining())))
    } else {
      return(h3("You have loaded all of your tubes!"))
    }
  })
  
  output$button <- renderUI({
    if (Remaining() == 0L) {
      actionButton("goButton", "Start the centrifuge!")
    } else {
      NULL
    }
  })
  output$occupied <- renderUI({
    req(N())
    checkboxGroupInput("occupied",
                       label = h4("Occupied positions"), 
                       choices = setNames(
                         seq.int(N()),
                         formatC(seq.int(N()), width = 2)),
                       inline = TRUE)
  })
  
  output$rotorPlot <- renderPlot({
    req(N())
    sizes = setNames(c(18, 15, 12, 10), c(12, 16, 24, 32))
    text_sizes = setNames(c(10, 10, 8, 6), c(12, 16, 24, 32))
    plot_rotor(Loading(), size = sizes[match(N(), names(sizes))],
               text_size = text_sizes[match(N(), names(sizes))])
  })
  
  output$image <- renderImage({
    if(is.null(Balanced())) {
      return(NULL)
    }
    if (Balanced() == TRUE) {
      return(
        list(src = file.path("images", sample(image_success, 1)),
             alt = "You're awesome!",
             width = 200)
      )
    } else {
      return(
        list(src = file.path("images", sample(image_fails, 1)),
             alt = "Try again...",
             width = 200)
      )
    }
  }, deleteFile = FALSE)
})
