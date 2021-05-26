# growthcurver_analysis.R
# Script for analyzing growth curve data; can analyze up to 96 wells of growth curve data
# See https://cran.r-project.org/web/packages/growthcurver/vignettes/Growthcurver-vignette.html for more information regarding data format
# Updated: 2021-05-20, Amanda Garcia (akgarcia@arizona.edu)



### PREP DATA ###

# Clear environment
rm(list = ls())

#Load libraries
library(growthcurver)

# Import data with comma-separated vales; replace with appropriate path and file name
data <- read.table(file = "Data/growthcurve_data.csv", header = TRUE, sep = ",", fileEncoding="UTF-8-BOM")


### ANALYZE DATA FOR 96-WELL-PLATE GROWTH CURVES ###

# Correct data with self-provided blank measurements in "blank" column of data table; outputs fitted growth curvers to pdf in "Output" folder
gc_summary_plate <- SummarizeGrowthByPlate(data, 
                                           plot_fit = TRUE, plot_file = "Output/growthcurve_plots.pdf")

# Write summary file with growth parameters
write.table(gc_summary_plate, "Output/growthcurve_summary.txt", sep = "\t")