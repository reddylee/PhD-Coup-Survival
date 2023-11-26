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
# Appendix Figure 3: Takeover Events, 1918–2019
# -------------------------------------------------  ----------------------------------



takeover <- read.dta(file="takeovers_sums.dta")
# country labels to the map
sPDF <- joinCountryData2Map(takeover , joinCode = "ISO_N3", nameJoinColumn = "iso3n2", verbose=TRUE)


-------------------------------------------

out.file <- paste("takeovers_sums.pdf",sep="")
pdf(file=out.file, height=4, width=7)
par(mar=c(4,1,2,1))

#Setting up class intervals for continuous variable
classInt <- classIntervals(sPDF$takeover, n=7, style="fixed",  fixedBreaks=c(0, 1, 2, 3, 5, 7, 10, 13))
catMethod=classInt$brks
colourPalette <- brewer.pal(8,"Reds")


#Drawing the map

mapParams <- mapCountryData(sPDF,nameColumnToPlot="takeover", 
                            #catMethod="fixed", 
                            catMethod=catMethod,
                            mapTitle="",
                            colourPalette=colourPalette,                           
                            missingCountryCol="white", 
                            addLegend="FALSE"                            
)

#adding legend
do.call( addMapLegend, c( mapParams, legendLabels="all", 
                          labelFontSize=0.5,legendShrink=0.8,
                           legendWidth=0.5, legendIntervals="page"))
dev.off() 



