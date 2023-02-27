taylor.series <- function(x, n) {
  
  num = (-1)^n
  denom = factorial(2*n + 1)
  result = (num/denom) * x^(2*n + 1)
  
  return (result)
}

taylor.sin <- function(x, eps=10^-6) { # line 1
  n <- 0 # line 2
 
  t.approx <- taylor.series(x, n) # line 3
  
  err = abs(sin(x) - t.approx) # line 4
  
  while (err > eps) { # line 5
    n = n + 1 # line 6
    
    t.approx <- t.approx + taylor.series(x, n) # line 7
    
    err = abs(sin(x) - t.approx) # line 8
    
    print(err) # line 9
  }
  
  return (n) # line 10
  
}

q1 = quantile(mtcars$mpg, c(0.25, 0.75))

mtcars$fuelcat[mtcars$mpg < q1[1]] <- "LOW"
mtcars$fuelcat[mtcars$mpg >= q1[1] & mtcars$mpg <= q1[2]] <- "MEDIUM"
mtcars$fuelcat[mtcars$mpg > q1[2]] <- "HIGH"

length(mtcars$fuelcat[mtcars$fuelcat == "LOW"])
length(mtcars$fuelcat[mtcars$fuelcat == "MEDIUM"])
length(mtcars$fuelcat[mtcars$fuelcat == "HIGH"])

mtcars <- mtcars[order(mtcars$wt),]

plot(mtcars$wt, mtcars$mpg, xlab="weight", ylab="miles per gallon")

abline(h = median(mtcars$mpg), col = "red")

text(mtcars$wt, mtcars$mpg, mtcars$fuelcat, cex = 0.7)


