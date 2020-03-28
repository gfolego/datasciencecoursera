library(shiny)
data("trees")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    selectedData <- reactive({
        dat <- trees[, c(input$xcol, input$ycol)]
        dat <- data.frame(xcol=dat[,1], ycol=dat[,2])
    })
    
    model <- reactive({
        dat <- selectedData()
        mod <- lm(ycol ~ xcol, dat)
    })

    output$plot <- renderPlot({
        dat <- selectedData()
        mod <- model()
        plot(x=dat$xcol, y=dat$ycol,
             xlab=input$xcol, ylab=input$ycol,
             pch = 20, col="blue")
        abline(mod, col="red")
    })
    
    output$cor <- renderText({
        dat <- selectedData()
        val <- round(cor(dat$xcol, dat$ycol), 4)
        paste0("<br/>", "Correlation: ", val, "<br/>")
    })
    
    output$coefs <- renderText({
        mod <- model()
        slope <- round(coef(mod)[2], 4)
        inter <- round(coef(mod)[1], 4)
        paste0("<br/>", "Slope: ", slope, "<br/>",
               "Intercept: ", inter)
    })
})
