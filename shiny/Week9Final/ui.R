#
# This is the user-interface definition for the Week 9 final progect.
#

library(shiny)

shinyUI(fluidPage(
        
        titlePanel("Predict MPG!  This app will provide predicted automobile MPG based on Weight for two types of 
                   Transmitions.  Just use the slider to pick your weight in 1000s of LBS, and
                   hit submit.  Results will be graphed on the plot and a numerical prediction will be shown 
                   at the bottom, for both types of transmissions.  If you are only interested in one type of transmission, you can 
                   turn either type on/off with the check boxes."),
        
        sidebarLayout(
                sidebarPanel(
                        sliderInput("sliderWT", "What is the Weight of the car (in 1000s of lbs)?", 1.5, 5.5, value = 3.2),
                        checkboxInput("showModel1", "Show/Hide Automatic Transmissions", value = TRUE),            
                        checkboxInput("showModel2", "Show/Hide Manual Transmissions", value = TRUE),
                        submitButton("Submit")
                ),
                mainPanel(
                        plotOutput("plot1"),
                        h3("Predicted MPG for Automatic Transmissions:"),
                        textOutput("pred1"),
                        h3("Predicted MPG for Manual Transmissions:"),
                        textOutput("pred2")
                )
        )
))