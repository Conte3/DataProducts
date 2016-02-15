#Reference for building the project
#https://github.com/zero323/developing-data-products-shiny
library(markdown)

if(!exists("mtcars"))  data("mtcars")
mtcars$am   <- factor(mtcars$am,labels = c("Automatic","Manual"))
mtcars$cyl  <- factor(mtcars$cyl);  mtcars$vs   <- factor(mtcars$vs)
mtcars$gear <- factor(mtcars$gear); mtcars$carb <- factor(mtcars$carb)

bestfit <- lm(mpg ~ cyl + hp + wt + am,data=mtcars)

shinyServer(  
  function(input, output, session) {    
    values      <- reactiveValues()
    values$cyl  <- c("4","6","8")
    values$wt   <- c(1.513:5.424)
    values$hp   <- c(52:335)
    values$am   <- factor(c('Automatic','Manual'))
    
    output$cylControls <- renderUI({
      radioButtons('cylx', 'Number of Cylinders:', values$cyl, selected=values$cyl[1])
      })
    
    output$wtControls <- renderUI({
      sliderInput('wtx','Weight:',min = values$wt[1],max = values$wt[length(values$wt)],value = values$wt[1])
    })
    
    output$hpControls <- renderUI({
      sliderInput('hpx','Horse Power:',min = values$hp[1],max = values$hp[length(values$hp)],value = values$hp[1])
    })
    
    output$amControls <- renderUI({
      radioButtons('amx', 'Transmission Type:', c('Automatic', 'Manual'), selected='Automatic')
    })
    
    
    output$prediction <- renderPrint(
    round(predict(bestfit,newdata = data.frame(cyl=input$cylx,wt=input$wtx,hp=input$hpx,am=input$amx))[1],2)
    )
  }
)