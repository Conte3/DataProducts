library(shiny)

library(markdown)

shinyUI(
  navbarPage("Mpg Predictor",
             tabPanel("Prediction",
                      sidebarPanel(    
                        h3('Select parameters of the car'),
                        uiOutput("cylControls"),
                        uiOutput("wtControls"),
                        uiOutput("hpControls"),
                        uiOutput("amControls")), 
                      mainPanel(    
                        h3('Results of the Prediction'),
                        h4('The mileage that will most likely be achieved under this circunstance is:'),
                        verbatimTextOutput("prediction"),
                        h3('How to use:'),
                        h4('In order to make a car mpg simulation, 
                           select the desired Number of Cylinders, 
                           the Weight (in lb/1000),
                           the Horse Power and if the Transmition Type of the car.'),
                        h3('For more information'),
                        h4('Check out the "About the Predictor" page, for detailed information on how the calculations are made')
                      )
              )
             ,
             tabPanel("About the Predictor",
                      mainPanel(
                        includeMarkdown("include.md")
                      )
             )
  )
  )