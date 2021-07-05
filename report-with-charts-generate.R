## install.packages("rmarkdown", repos = "http://cran.us.r-project.org")
## install.packages("tinytex", repos = "http://cran.us.r-project.org")
## tinytex::install_tinytex()

# in terminal: export RSTUDIO_PANDOC=/Applications/RStudio.app/Contents/MacOS/pandoc

library(rmarkdown)
rmarkdown::render("report-with-charts.Rmd", clean=TRUE, output_format="pdf_document")
