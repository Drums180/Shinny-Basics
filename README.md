# Shinny-Basics Shiny App Example

## Description

This repository contains examples of Shiny applications. Shiny is an R package that allows for the interactive visualization of data analysis. Included is a basic example demonstrating the core concepts of a Shiny app, including the UI (User Interface) and server components.

## Shiny App Structure

In Shiny, there are two main components: the UI and the server. The UI defines the layout and appearance of your app, while the server script provides the logic and functionality.

### Example Code

Here is a simple Shiny app example:

```{r}
library(shiny)

# Define UI
ui <- fluidPage(
  # App content goes here
)

# Define server logic
server <- function(input, output) {
  # Server code goes here
}

# Run the app
shinyApp(ui = ui, server = server)
```

## Server Function
The server part of a Shiny app is defined by a function that takes input and output parameters. Here's an example of configuring the server:

```{r}
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
        stats_text <- sprintf("Mean: %s, Median: %s, Range: %s - %s", mean_val, median_val, range_val[1], range_val[2])
      } else {
        stats_text <- "Please enter at least one number."
      }
      stats_text
    })
}
```

## User Interface (UI)
The UI for a Shiny app is defined using various layout functions and control widgets. Here's an example UI definition:

```{r}
ui <- fluidPage(
  navbarPage("Web App",
    tabPanel("Complete Name",
      sidebarPanel(
        textInput("first_name", "First Name:", ""),
        textInput("second_name", "Second Name:", ""),
        textInput("last_name", "Last Name:", "")
      ),
      mainPanel(
        verbatimTextOutput("complete_name")
      )
    ),
    tabPanel("Stats",
      sidebarPanel(
        numericInput("n1", "First Number:", NA),
        numericInput("n2", "Second Number:", NA),
        numericInput("n3", "Third Number:", NA),
        numericInput("n4", "Fourth Number:", NA),
        numericInput("n5", "Fifth Number:", NA)
      ),
      mainPanel(
        verbatimTextOutput("stats")
      )
    )
  )
)
```

## Getting Started

To run this example:

1. Ensure you have R and the Shiny package installed.
2. Clone this repository to your local machine.
3. Open R and set your working directory to the cloned repo folder.
4. Run the app by executing the R script containing the Shiny app code.

## Prerequisites

- R programming language
- Shiny package installed in R

## Contributing

Contributions are welcome! If you have suggestions or improvements, please open an issue or pull request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.


