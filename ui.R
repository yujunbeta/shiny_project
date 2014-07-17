library(shiny)
library(ggplot2)
library(datasets)

dataset<-iris

shinyUI(pageWithSidebar(
 
  headerPanel("Display of the Iris Data in R"),
  sidebarPanel(
    
    selectInput('x', 'X', names(dataset)),
    selectInput('y', 'Y', names(dataset)),
    selectInput('color', 'Color', c('None', names(dataset))),
 
    checkboxInput('smooth', 'Smooth'),
    
    h3("support document"),
    h4("The goal of this app is help you understand the structure of the Iris data.You can choose the X-lab and Y-lab to draw the scatter plot of this data set.You also can color the species use the variable species.Smooth method is also applied to help you understand the relationship between each variable. ")
    ),
 
  mainPanel(
    plotOutput('plot')
  )
))