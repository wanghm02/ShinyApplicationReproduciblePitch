Reproducible Pitch Presnetation Describes my Shiny Application
========================================================
author: Huamiao Wang
date: Feb 10, 2017
autosize: true

Application Description
========================================================

The objective of this application is to guess an integer 
between 1 and 1000 (inclusive) and compare it to the 
computer's selection. Here is the procedure to run the 
application:

- Guess a number 

- Input the number and press "Go"

- The application automatically compares your guess and the computer's selection

Code about Computer's selection and comparison
========================================================

```r
library(shiny)
#the computer guesses an integer between 1 and 1000
number <- floor(runif(1,1,1001))
number
```

```
[1] 759
```

```r
#function to compare computer's selection and the guess
numberGuessed <- function(guess, number) {
  returnValue <- "Nothing entered yet."
  if (guess > 1000) {
    returnValue <- '> 1000.\nPlease select between 1 and 1000.'
  }
  else if (guess < 1) {
    returnValue <- '< 1.\nPlease select between 1 and 1000.'
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
```

ui.R
========================================================

```r
library(shiny)

shinyUI( pageWithSidebar(
        # Application title
        headerPanel("Guess The Number!"),
        
        sidebarPanel(

                textInput('guess', 'Number', value = ""),
                h5('Please press \'Go!\' only on your first attempt'),
                actionButton("goButton", "Go!")
        ), 
        mainPanel(
                h2('Guess an integer between 1 and 1000'),
                h5('The objective of this game is to guess an integer between
                   1 and 1000 (inclusive) and compare to the computer\'s
                   selection'),
                h3('Results of guess'),
                h4('You entered'),
                verbatimTextOutput("inputValue"),
                h4('Which is...'),
                verbatimTextOutput("outputValue"),
                h5('The application will continue running even after you have guessed 
                   the number correctly. This is to be improved in the future.')
                )
                )
)
```

<!--html_preserve--><div class="container-fluid">
<div class="row">
<div class="col-sm-12">
<h1>Guess The Number!</h1>
</div>
</div>
<div class="row">
<div class="col-sm-4">
<form class="well">
<div class="form-group shiny-input-container">
<label for="guess">Number</label>
<input id="guess" type="text" class="form-control" value=""/>
</div>
<h5>Please press 'Go!' only on your first attempt</h5>
<button id="goButton" type="button" class="btn btn-default action-button">Go!</button>
</form>
</div>
<div class="col-sm-8">
<h2>Guess an integer between 1 and 1000</h2>
<h5>The objective of this game is to guess an integer between
                   1 and 1000 (inclusive) and compare to the computer's
                   selection</h5>
<h3>Results of guess</h3>
<h4>You entered</h4>
<pre id="inputValue" class="shiny-text-output"></pre>
<h4>Which is...</h4>
<pre id="outputValue" class="shiny-text-output"></pre>
<h5>The application will continue running even after you have guessed 
                   the number correctly. This is to be improved in the future.</h5>
</div>
</div>
</div><!--/html_preserve-->


server.R
========================================================


```r
shinyServer( 
        function(input, output) {
                output$inputValue <- renderPrint({as.numeric(input$guess)})
                output$outputValue <- renderText({
                        if (input$goButton == 0) "Please input a number"
                        else if (input$goButton >= 1) numberGuessed(as.numeric(input$guess), number)
                })
        }
)
```
