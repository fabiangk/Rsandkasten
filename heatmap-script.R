#########################################################
### A) Installing and loading required packages
#########################################################

if (!require("gplots")) {
  install.packages("gplots", dependencies = TRUE)
  library(gplots)
}
if (!require("RColorBrewer")) {
  install.packages("RColorBrewer", dependencies = TRUE)
  library(RColorBrewer)
}


#########################################################
### B) Reading in data and transform it into matrix format
#########################################################

data <- read.csv("~/Desktop/test.csv", sep=";")
rnames <- data[,1]                            # assign labels in column 1 to "rnames"
mat_data <- data.matrix(data[,2:ncol(data)])  # transform column 2-5 into a matrix
rownames(mat_data) <- rnames                  # assign row names 


#########################################################
### C) Customizing and plotting the heat map
#########################################################

# creates a own color palette from red to green
my_palette <- colorRampPalette(c("red","yellow", "black"))(n = 255)

# creates a 5 x 5 inch image
##png("~/Desktop/heatmaps_in_r.png",    # create PNG for the heat map        
#    width = 10*300,        # 5 x 300 pixels
 #   height = 10*300,
  #  res = 300,            # 300 pixels per inch
  #  pointsize = 8)        # smaller font size

heatmap(mat_data, col=my_palette);

#pie(rep(1,255), col=my_palette);

#dev.off()               # close the PNG device

