library(forecast)
library(tseries)
library(tidyverse)

data <- read.csv('data.csv', header = TRUE)

for (i in 1:10) {
  y <- data[[sprintf('y%d', i)]]
  yTS <- ts(y, start = c(2020, 6), frequency=12)
  fit <- auto.arima(yTS)
  accuracy(fit)

  pdfName <- sprintf('y%d_arima.pdf', i)
  # Open a pdf file
  pdf(pdfName)
  plot(forecast(fit, 12), xlab = "Date", ylab = "Units", main = "ARIMA Forecast for Case-Shiller Index")
  # Close the pdf file
  dev.off() 
  # Print that PDF is generated
  print(sprintf('PDF %s for y%d arima is generated', pdfName, i))
}
