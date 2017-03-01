#
# This is the server logic for MPG app from Shiny 2.2 lecture. 
# To run hit the Run App button above.
#

library(shiny)
data("mtcars")
mtcars0 <- subset(mtcars, am == "0")

shinyServer(function(input, output) {
        data("mtcars")
        mtcars0 <- subset(mtcars, am == "0")
        mtcars1 <- subset(mtcars, am == "1")
        
        
#        model1 <- lm(mtcars$mpg[mtcars$am=="0"] ~ mtcars$wt[mtcars$am=="0"])
#        model2 <- lm(mtcars$mpg[mtcars$am=="1"] ~ mtcars$wt[mtcars$am=="1"])

        model1 <- lm(mpg ~ wt, data = mtcars0)
        model2 <- lm(mpg ~ wt, data = mtcars1)
                
        model1pred <- reactive({
                wtInput <- input$sliderWT
                if(input$showModel1){
                predict(model1, newdata = data.frame(wt = wtInput))
                }        
        })
        
        model2pred <- reactive({
                wtInput <- input$sliderWT
                if(input$showModel2){
                predict(model2, newdata = data.frame(wt = wtInput))
                }
        })
        
        output$plot1 <- renderPlot({
                wtInput <- input$sliderWT
                
                plot(mtcars$mpg, mtcars$wt, xlab = "Weight (1000 lbs)",
                     ylab = "MPG", bty = "n", pch = 16,
                     xlim = c(1, 6), ylim = c(10, 35))
                
                if(input$showModel1){
                        abline(model1, col = "red", lwd =2)
                }
                if(input$showModel2){
                        abline(model2, col = "blue", lwd = 2)
                }
                
                legend(4, 30, c("Auto", "Manual"), pch = 16,
                       col = c("red", "blue"), bty = "n", cex = 1.2)
                
                points(mtcars$wt,mtcars$mpg,pch=20,col=ifelse(mtcars$am=="0", "red", "blue"))
                points(wtInput, model1pred(), col = "red", bty = "n", cex = 3, pch = 18)
                points(wtInput, model2pred(), col = "blue", bty = "n", cex = 3, pch = 18)
       
        })
       
         
        output$pred1 <- renderText({
                model1pred()
        })
        
       
     
        output$pred2 <- renderText({
                model2pred()
        })   
      
        
})