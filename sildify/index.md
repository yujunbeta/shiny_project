---
title       : Brief Introduction to My Shiny App
subtitle    : Developing Data Products Peer Assignment
author      : yujunbeta
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
url     :
    assets: ../assets
widgets     : [bootstrap]            # {mathjax, quiz, bootstrap}
mode        : standalone # {standalone, draft}


---

##  My Shining App

![picture1](F:/coursera/Data Science/peer assignment/shiny_project/sildify/assets/img/my_app.png)

The goal of this app is help you understand the structure of the Iris data.


--- 

## Details about My App
+ Usage  
You can choose the X-lab and Y-lab to draw the scatter plot of this data set.You also can color the species use the variable species.Smooth method is also applied to help you understand the relationship between each variable.

+ Iris Data  
This famous (Fisher's or Anderson's) iris data set gives the measurements in centimeters of the variables sepal length and width and petal length and width, respectively, for 50 flowers from each of 3 species of iris. The species are Iris setosa, versicolor, and virginica.


```r
head(iris)
```

```
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1          5.1         3.5          1.4         0.2  setosa
## 2          4.9         3.0          1.4         0.2  setosa
## 3          4.7         3.2          1.3         0.2  setosa
## 4          4.6         3.1          1.5         0.2  setosa
## 5          5.0         3.6          1.4         0.2  setosa
## 6          5.4         3.9          1.7         0.4  setosa
```




---

## ui.R
```
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
```

---
## server.r
```
library(shiny)
library(ggplot2)
library(datasets)
dataset<-iris
shinyServer(function(input, output) {
  output$plot <- reactivePlot(function() {
    p <- ggplot(dataset, aes_string(x=input$x, y=input$y)) + geom_point()
    if (input$color != 'None')
      p <- p + 
        aes_string(color=input$color) + 
        theme(legend.position="top")
    if (input$smooth)
      p <- p + 
        geom_smooth() + 
        theme(legend.position="top")
    print(p)
  }, height=400)
})
```




