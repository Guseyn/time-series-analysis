# read csv file
data <- read.csv('data.csv', header = TRUE)
xLength <- length(data$date)
xPointsForDates <- 1:xLength

for (i in 1:10) {
  for (j in (i + 1):10) {
    pdfName <- sprintf('rplot_y%d_and_y%d.pdf', i, j)
    # Open a pdf file
    pdf(pdfName)
    # Create a plot
    plot(x = xPointsForDates, y = data[[sprintf('y%d', i)]],
         pch = 16, frame = FALSE,
         xlab = 'dates', ylab = 'y', col = '#2E9FDF')
    points(x = xPointsForDates, y = data[[sprintf('y%d', j)]], col = '#Df2E7E', pch = 16)
    # Close the pdf file
    dev.off() 
    # Print that PDF is generated
    print(sprintf('PDF %s with charts for y%d and y%d is generated', pdfName, i, j))
  }
}

for (i in 1:10) {
  for (j in (i + 1):10) {
    pngName <- sprintf('rplot_y%d_and_y%d.png', i, j)
    # Open a pdf file
    png(pngName)
    # Create a plot
    plot(x = xPointsForDates, y = data[[sprintf('y%d', i)]],
         pch = 16, frame = FALSE,
         xlab = 'dates', ylab = 'y', col = '#2E9FDF')
    points(x = xPointsForDates, y = data[[sprintf('y%d', j)]], col = '#Df2E7E', pch = 16)
    # Close the pdf file
    dev.off() 
    # Print that PDF is generated
    print(sprintf('PNG %s with charts for y%d and y%d is generated', pdfName, i, j))
  }
}
