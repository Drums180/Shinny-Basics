library(shiny)

ui <- fluidPage(navbarPage("Web App", 
                           tabPanel("Complete Name", 
                                    sidebarPanel(tags$h3("Enter your data:"),
                                                 textInput("first_name", "First Name:", ""),
                                                 textInput("second_name", "Second Name:", ""),
                                                 textInput("last_name", "Last Name:", "")
                                                 ),
                                    mainPanel(h2("Your complete name is:"),
                                              verbatimTextOutput("complete_name")
                                              )
                                    ),
                           tabPanel("Stats",
                                    sidebarPanel(tags$h3("Time to practice our statistics:"),
                                                 numericInput("n1", "First Number:", ""),
                                                 numericInput("n2", "Second Number:", ""),
                                                 numericInput("n3", "Third Number:", ""),
                                                 numericInput("n4", "Forth Number:", ""),
                                                 numericInput("n5", "Fifth Number:", ""),
                                    ),
                                    mainPanel(h2("So this is what your data gives us:"),
                                              verbatimTextOutput("stats")
                                              )
                                    ),
                           tabPanel("App 3"),
                           tabPanel("App 4"),
                           tabPanel("App 5")
                           )
                )

server <- function(input, output) {
  
  output$complete_name <- renderText({
    paste(input$first_name, input$second_name, input$last_name, sep=" ")
  })
  
  output$stats <- renderText({
    numbers <- c(input$n1, input$n2, input$n3, input$n4, input$n5)
    numbers <- numbers[!is.na(numbers)]
    
    if(length(numbers) > 0) {
      mean_val <- mean(numbers)
      median_val <- median(numbers)
      range_val <- range(numbers)
      
      mean_val_f <- formatC(mean_val, format = "f", digits = 1)
      median_val_f <- formatC(median_val, format = "f", digits = 1)
      range_val_f1 <- formatC(range_val[1], format = "f", digits = 1)
      range_val_f2 <- formatC(range_val[2], format = "f", digits = 1)
      
      stats_text <- sprintf("Mean: %s\nMedian: %s\nRange: %s - %s", mean_val_f, median_val_f, range_val_f1, range_val_f2)
    } else {
      stats_text <- "Please enter at least one number."
    }
  
    stats_text
  })
}

shinyApp(ui=ui,server=server)

