
library(shiny)

#the computer guesses an integer between 1 and 1000
number <- floor(runif(1,1,1001))


numberGuessed <- function(guess, number) {
        returnValue <- "Nothing entered yet."
        if (guess > 1000) {
                returnValue <- 'Above 1000.\nPlease make a selection between 1 and 1000.'
        }
        else if (guess < 1) {
                returnValue <- 'Below 1.\nPlease make a selection between 1 and 1000.'
        }
        else if (guess > number) {
                returnValue <- 'Higher than the computer\'s selection.'
        }
        else if (guess < number) {
                returnValue <- 'Lower than the computer\'s selection.'
        }
        else if (guess == number) {
                returnValue <- 'Correct!'
        }
        returnValue

}
shinyServer( 
        function(input, output) {
                output$inputValue <- renderPrint({as.numeric(input$guess)})
                output$outputValue <- renderText({
                        if (input$goButton == 0) "Please input a number"
                        else if (input$goButton >= 1) numberGuessed(as.numeric(input$guess), number)
                })
        }
)
