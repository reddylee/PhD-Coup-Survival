library(MASS)
library(vegan)
library(foreign)
library(rjags)
library(SnowballC)
library(rworldmap)
library(RColorBrewer)
library(classInt)
library(dplyr)




 
# -----------------------------------------------------------------------------------
# Figure 4: Incumbent takeovers (total number of onsets) across the world 1918-2019
# -------------------------------------------------  ----------------------------------    
       
       
 takeover <- read.dta(file="takeoveruler_sums.dta")
# country labels to the map
sPDF <- joinCountryData2Map(takeover , joinCode = "ISO_N3", nameJoinColumn = "iso3n2", verbose=TRUE)


out.file <- paste("takeoverruler_alltime.pdf",sep="")
pdf(file=out.file, height=4, width=7)
par(mar=c(4,1,2,1))
classInt <- classIntervals(sPDF$takeover, n=6, style="fixed",  fixedBreaks=c(0, 1, 2, 3, 4, 5, 6))
catMethod=classInt$brks
#Selecting diverging palette
colourPalette <- brewer.pal(6,"Greys")
#Drawing the map
mapParams <- mapCountryData(sPDF,nameColumnToPlot="takeover", 
                            #catMethod="fixed", 
                            catMethod=catMethod,
                            mapTitle="",
                            colourPalette=colourPalette,
                            #oceanCol="lightblue",
                            missingCountryCol="white", 
                            addLegend="FALSE"
                            #borderCol="black"
)

#adding legend
do.call( addMapLegend, c( mapParams, legendLabels="all", 
                          labelFontSize=0.5,legendShrink=0.6,
                           legendWidth=0.5, legendIntervals="page"))
dev.off() 





