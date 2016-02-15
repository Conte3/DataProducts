Miles per Galon Predictor
========================================================
author: Henrique Conte
date: February 14th, 2016

Introduction
========================================================

This project was developed as the Regression Models' Course Project, and than it was adapted as a Shint app, in order for the model to be tested.

The app basically gets the mtcars dataset, and using a linear regression using only the most meaningfull variables, creates a predictor, as will be shown and explained in the slides that follows.

Building a Model
========================================================
We start with getting and cleaning the data and building a model that best represents the influences on mpg.

```r
if(!exists("mtcars"))  data("mtcars")
mtcars$am   <- factor(mtcars$am,labels = c("Automatic","Manual"))
mtcars$cyl  <- factor(mtcars$cyl);  mtcars$vs   <- factor(mtcars$vs)
mtcars$gear <- factor(mtcars$gear); mtcars$carb <- factor(mtcars$carb)
#Creating a linear fit and checking which variables will make the best fit
fit1 <- lm(mpg~.,data=mtcars)
bestfit <- step(fit1,direction = "both")
```

Analysing the influences
========================================================
With this model, we can determine how does each variable influences the mpg

```r
data.frame(summary(bestfit)$coef[,1])
```

```
            summary.bestfit..coef...1.
(Intercept)                33.70832390
cyl6                       -3.03134449
cyl8                       -2.16367532
hp                         -0.03210943
wt                         -2.49682942
amManual                    1.80921138
```

Concluding the analysis
========================================================
This conclusions assume that all other variables are fixed:   
1. When other influencing variables are considered, the manual transmission is **1.81** miles per gallon better than the automatic   
2. 6 cyls has a **-3.03** mpg and 8 cyls have **-2.16**   
3. Every 1 increase in HP will result in **-0.03** in mpg   
4. Every 1000 lb increase in weight will result in **-2.50** in mpg   
   
So with this, we make the predictions based on the user's selections, folowing the formula bellow:
```
predict(bestfit,newdata = data.frame(cyl=input$cylx,wt=input$wtx,
          hp=input$hpx,am=input$amx))
```
