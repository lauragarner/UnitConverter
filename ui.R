# User interface for entering weights and having them converted into a variety of other units

library(shiny)


shinyUI(fluidPage(
  
  # Application title
  titlePanel("Unit converter for weight "),
  
  # Sidebar with a selection list for measure of weight being converted and a numeric input for the user to provide the value
  sidebarLayout(
    sidebarPanel(
            h5("Instructions: Enter a value into the weight field and then choose the measure that you are weighing in.
               The table in the main panel will show that measure of weight converted into various other units."),
            numericInput("Weight", "Enter weight here", value = 1),
            selectInput("Measure",
                   "Unit of weight to be converted",
                   choices = c("Milligrams (mg)", "Grams (g)", "Kilograms (kg)", "Pounds (lb)", "Ounces (oz)"))
    
       
       ),
    
    # Return a table with the provided weight converted into various units
    mainPanel(
            tableOutput("values")

    )
  )
))
