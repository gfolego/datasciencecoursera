library(shiny)

data("trees")
vars <- names(trees)
    
# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Exploring the Trees dataset"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            "Pick the variables of interest",
            selectInput("xcol", "X Variable", vars, selected=vars[1]),
            selectInput("ycol", "Y variable", vars, selected=vars[2]),
            htmlOutput("cor"),
            htmlOutput("coefs")
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("plot"),
        )
    )
))
