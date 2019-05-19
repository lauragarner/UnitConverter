#
# The server logic that actually performs the conversion and returns the values to be displayed in a table.

library(shiny)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        tableValues <- reactive({
                
                data.frame(
                        Measure = c("Milligrams (mg)",
                                 "Grams (g)",
                                 "Kilograms (kg)",
                                 "Pounds (lb)",
                                 "Ounces (oz)"),
                        Value = as.numeric(c(mg_fun(input$Measure),
                                                g_fun(input$Measure),
                                                kg_fun(input$Measure),
                                                lb_fun(input$Measure),
                                                oz_fun(input$Measure))),
                        stringsAsFactors = FALSE)
                
        })
        
        # Show the values in an HTML table ----
        output$values <- renderTable({
                tableValues() 
        }, width = 400, digits = 6)
        
        mg_fun <- function(val) {
                if(val == "Milligrams (mg)"){input$Weight}
                        else if(val == "Grams (g)"){input$Weight * 1000 }
                        else if(input$Measure == "Kilograms (kg)"){input$Weight * 1000000}
                        else if (input$Measure == "Ounces (oz)"){input$Weight * 28349.5231}
                        else if (input$Measure == "Pounds (lb)"){input$Weight * 453592.37}
                
        }
        
        g_fun <- function(val) {
                if(val == "Milligrams (mg)"){input$Weight / 1000}
                        else if(val == "Grams (g)"){input$Weight}
                        else if(input$Measure == "Kilograms (kg)"){input$Weight * 1000}
                        else if (input$Measure == "Ounces (oz)"){input$Weight * 28.3495231}
                        else if (input$Measure == "Pounds (lb)"){input$Weight * 453.59237}
                
        }
        
        kg_fun <- function(val) {
                if(val == "Milligrams (mg)"){input$Weight / 1000000}
                        else if(val == "Grams (g)"){input$Weight/1000}
                        else if(input$Measure == "Kilograms (kg)"){input$Weight}
                        else if (input$Measure == "Ounces (oz)"){input$Weight * .0283495231}
                        else if (input$Measure == "Pounds (lb)"){input$Weight * .45359237}
                
        }
        
        lb_fun <- function(val) {
                if(val == "Milligrams (mg)"){input$Weight / 453592.37}
                        else if(val == "Grams (g)"){input$Weight/453.59237}
                        else if(input$Measure == "Kilograms (kg)"){input$Weight/.45359237}
                        else if (input$Measure == "Ounces (oz)"){input$Weight / 16}
                        else if (input$Measure == "Pounds (lb)"){input$Weight}
                
        }
        
        oz_fun <- function(val) {
                if(val == "Milligrams (mg)"){input$Weight / 28349.5231}
                        else if(val == "Grams (g)"){input$Weight/1000}
                        else if(input$Measure == "Kilograms (kg)"){input$Weight/.0283495231}
                        else if (input$Measure == "Ounces (oz)"){input$Weight}
                        else if (input$Measure == "Pounds (lb)"){input$Weight *16}
                
        }
})