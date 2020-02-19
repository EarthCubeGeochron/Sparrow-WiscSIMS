library(jsonlite)

source("d18O10SIMSimport.R")
Output = d18O10SIMSimport("/Test-Data/20140212_d18O_BenTest.xlsx")

Output<-toJSON(Output)
Output<-prettify(Output)

print(Output)
