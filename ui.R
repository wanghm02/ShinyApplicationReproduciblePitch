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