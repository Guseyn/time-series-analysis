# install.packages("vars", repos = "http://cran.us.r-project.org")
library(vars)

data <- read.csv('data.csv', header = TRUE)

# y1 and y5 are cointegrated

y1 <- data$y1
y5 <- data$y5

v1 <- cbind(y1, y5)
colnames(v1) <- cbind('y1', 'y5')

Model1 <- VAR(v1, p = 1, type = "const", season = NULL, exog = NULL) 
summary(Model1)

# y2 and y3 are cointegrated

y2 <- data$y2
y3 <- data$y3

v2 <- cbind(y2, y3)
colnames(v2) <- cbind('y2', 'y3')

Model2 <- VAR(v2, p = 1, type = "const", season = NULL, exog = NULL) 
summary(Model2)

# y4 and y10 are cointegrated

y4 <- data$y4
y10 <- data$y10

v3 <- cbind(y4, y10)
colnames(v3) <- cbind('y4', 'y10')

Model3 <- VAR(v3, p = 1, type = "const", season = NULL, exog = NULL) 
summary(Model3)

# y6 and y10 are cointegrated

y6 <- data$y6
y9 <- data$y9

v4 <- cbind(y6, y9)
colnames(v4) <- cbind('y6', 'y9')

Model4 <- VAR(v4, p = 1, type = "const", season = NULL, exog = NULL) 
summary(Model4)


# y1 = y1.l1 + y5.l1 + const 
# y1.l1 = -0.066, y5.l1 = 0.481, const = 0.476

# y5 = y1.l1 + y5.l1 + const 
# y1.l1 = -0.058, y5.l1 = 0.473, const = 0.056

# y1(t) = y1.l1 * y1(t-1) + y5.l1 * y2(t-1) + const
# y2(t) = y1.l1 * y1(t-1) + y5.l1 * y2(t-1) + const

#### HERE WE BUILD VAR MODEL FOR COINTEGRATED TIME SERIES Y1 and Y5

minX <- 1
maxX <- 200
xPointsForDates <- minX:maxX
l11 <- -0.066
l12 <- 0.481
c1 <- 0.476
l21 <- -0.058
l22 <- 0.473
c2 <- 0.056

y1_var = c(y1[300])
y5_var = c(y5[300])

index <- 2

for (i in (minX + 1):(maxX)) {
  y1_var[index] = l11 * y1_var[index - 1] + l12 * y5_var[index - 1] + c1
  y5_var[index] = l21 * y1_var[index - 1] + l22 * y5_var[index - 1] + c2
  index = index + 1
}

pdfName <- 'y1_and_y5_var_model.pdf'
# Open a pdf file
pdf(pdfName)
# Create a plot
plot(x = xPointsForDates, y = y1_var,
     type='l',
     pch = 16, frame = FALSE,
     xlab = 'dates', ylab = 'y', col = '#2E9FDF')
lines(x = xPointsForDates, y = y5_var, col = '#Df2E7E', pch = 16)
# Close the pdf file
dev.off() 
# Print that PDF is generated
print(sprintf('PDF %s with charts for VAR Model (y1 and y5) is generated', pdfName))

#### HERE WE BUILD VAR MODEL FOR COINTEGRATED TIME SERIES Y2 and Y3

minX <- 1
maxX <- 200
xPointsForDates <- minX:maxX
l11 <- -0.313
l12 <- 3.503
c1 <- 3.417
l21 <- -0.272
l22 <- 3.492
c2 <- 0.229

y2_var = c(y2[300])
y3_var = c(y3[300])

index <- 2

for (i in (minX + 1):(maxX)) {
  y2_var[index] = l11 * y2_var[index - 1] + l12 * y3_var[index - 1] + c1
  y3_var[index] = l21 * y2_var[index - 1] + l22 * y3_var[index - 1] + c2
  index = index + 1
}

pdfName <- 'y2_and_y3_var_model.pdf'
# Open a pdf file
pdf(pdfName)
# Create a plot
plot(x = xPointsForDates, y = y2_var,
     type='l',
     pch = 16, frame = FALSE,
     xlab = 'dates', ylab = 'y', col = '#2E9FDF')
lines(x = xPointsForDates, y = y3_var, col = '#Df2E7E', pch = 16)
# Close the pdf file
dev.off() 
# Print that PDF is generated
print(sprintf('PDF %s with charts for VAR Model (y2 and y3) is generated', pdfName))

#### LET'S COMPARE WITH NOT COINTEGRATED Y1 and Y6

minX <- 1
maxX <- 200
xPointsForDates <- minX:maxX
l11 <- 157.317
l12 <- -3.957
c1 <- 3.452
l21 <- 2.398
l22 <- 161.639
c2 <- 0.243

y6 <- data$y6

y1_var = c(y1[300])
y6_var = c(y6[300])

index <- 2

for (i in (minX + 1):(maxX)) {
  y1_var[index] = l11 * y1_var[index - 1] + l12 * y6_var[index - 1] + c1
  y6_var[index] = l21 * y1_var[index - 1] + l22 * y6_var[index - 1] + c2
  index = index + 1
}

pdfName <- 'y1_and_y6_var_model.pdf'
# Open a pdf file
pdf(pdfName)
# Create a plot
plot(x = xPointsForDates, y = y1_var,
     type='l',
     pch = 16, frame = FALSE,
     xlab = 'dates', ylab = 'y', col = '#2E9FDF')
lines(x = xPointsForDates, y = y6_var, col = '#Df2E7E', pch = 16)
# Close the pdf file
dev.off() 
# Print that PDF is generated
print(sprintf('PDF %s with charts for VAR Model (y1 and y6) is generated', pdfName))
