library(jsonlite)
library(httr)

source("d18O10SIMSimport.R")

FileName <- "/Test-Data/20140212_d18O_BenTest.xlsx"
Output = d18O10SIMSimport(FileName)


AnalysisFrame <- function(Input){

  ####Function to create nested structure from parsed
  #   excell files in R

  # File <- Input$File
  #
  # Comment <- Input$Comment

  d18OVSMOW <- list(value = Input$d18OVSMOW,
                    type = list(parameter = "d18OVSMOWxls",
                                unit = 'permille'))

  SD2ext <- list(value = Input$SD2ext,
                 type = list(parameter = "SD2ext",
                             unit = 'permille'))

  IMF <- list(value = Input$IMF,
              type = list(parameter = "IMF",
                          unit = 'permille'))

  d18Omeas <- list(value = Input$d18Omeas,
                   type = list(parameter = "d18Omeas",
                               unit = "permille"))

  SE2int <- list(value = Input$SE2int,
                 type = list(parameter = "SE2int",
                             unit = "permille"))

  O16cps <- list(value = Input$O16cps,
                 type = list(parameter = "O16cps",
                             unit = 'Gcounts/sec'))

  `IP(nA)` <- list(value = Input$`IP(nA)`,
                   type = list(parameter = "IP(nA)",
                               unit = 'nA'))

  Yield <- list(value = Input$Yield,
                type = list(parameter = "Yield",
                            unit = 'Gcounts/sec/nA'))

  DATETIME <- list(value = Input$DATETIME,
                   type = list(parameter = "Date",
                               unit = NA))

  AnalysisLength <- list(value = Input$AnalysisLength,
                         type = list(parameter = "AnalysisLength",
                                     unit = "minutes"))

  X <- list(value = Input$X,
            type = list(parameter = "X",
                        unit = 'micrometers'))

  Y <- list(value = Input$Y,
            type = list(parameter = "Y",
                        unit = 'micrometers'))

  DTFAX <- list(value = Input$DTFAX,
                type = list(parameter = "DTFAX",
                            unit = "bits"))
  DTFAY <- list(value = Input$DTFAY,
                type = list(parameter = "DTFAY",
                            unit = "bits"))
  Mass <- list(value = Input$Mass,
               type = list(parameter = "Mass",
                           unit = "???"))
  OHO <- list(value = Input$OHO,
              type = list(parameter = "OHO",
                          unit = "Ratio"))

  MATERIAL <- list(value = Input$MATERIAL,
                   type = list(parameter = "MATERIAL",
                               unit = "GuessMaterial"))

  GROUPNUM <- list(value = Input$GROUPNUM,
                   type = list(parameter = "GROUPNUM",
                               unit = "GuessGroup"))

  GUESS.SAMP <- list(value = Input$GUESS.SAMP,
                     type = list(parameter = "GUESS.SAMP",
                                 unit = "GuessSample"))

  MOUNTNUM <- list(value = Input$MOUNTNUM,
                   type = list(parameter = "MOUNTNUM",
                               unit = "GuessMountnum"))

  GROUPNUM <- list(value = Input$GROUPNUM,
                   type = list(parameter = "GROUPNUM",
                               unit = "GuessGroup"))

  UNIQUEGRP <- list(value = Input$DTFAX,
                    type = list(parameter = "DTFAX",
                                unit = "bits"))

  REL_YIELD <- list(value = Input$REL_YIELD,
                    type = list(parameter = "REL_YIELD",
                                unit = "%"))

  REL_OHO <- list(value = Input$REL_OHO,
                  type = list(parameter = "REL_OHO",
                              unit = "ratio"))

  BRACKET2SD <- list(value = Input$BRACKET2SD,
                     type = list(parameter = "BRACKET2SD",
                                 unit = "permille"))

  STDd18O <- list(value = Input$STDd18O,
                  type = list(parameter = "STDd18O",
                              unit = "permille"))

  STDd18Opdb <- list(value = Input$STDd18Opdb,
                     type = list(parameter = "STDd18O",
                                 unit = "permille"))

  DatumList <- list(
                 d18OVSMOW,
                 SD2ext,
                 IMF,
                 d18Omeas,
                 SE2int,
                 O16cps,
                 `IP(nA)`,
                 Yield,
                 #DATETIME,
                 AnalysisLength,
                 X,
                 Y,
                 DTFAX,
                 DTFAY,
                 Mass,
                 OHO,
                 #MATERIAL,
                 GROUPNUM,
                 #GUESS.SAMP,
                 #MOUNTNUM,
                 UNIQUEGRP,
                 REL_YIELD,
                 REL_OHO,
                 BRACKET2SD,
                 STDd18O,
                 STDd18Opdb
               )

  # Analysis <- list(
  #   name="d18O measurement",
  #   datum=DatumList
  # )

  ix <- 1
  fout <- list()
  for(i in 1:length(DatumList)) {
    k <- DatumList[[i]]
    if(!is.na(DatumList[[i]]$value)) {
      fout[[ix]] <- DatumList[[i]]
      ix <- ix + 1
    }
  }

  #sapply(DatumList, function(x) print(x[[1]]["value"]))
  # sapply(DatumList, function(x) print(x[[1]]$value))
  #
  # filtered <- filter(DatumList,  function(item){
  #   return(Negate(is.na(item$value)))
  # })

  return(fout)
}


analysisList <- list()

ix <- 1
for(i in 2:3){
  datumList <- AnalysisFrame(Output[i,])
  analysisList[[ix]] <- list(name="d18O measurement",
                  datum = datumList)
  ix <- ix + 1
}

Session = list(
  name="Test session",
  sample=list(name='Test sample'),
  date="2020-01-01T00:00:00",
  analysis=analysisList
)



# CompiledOutput <- list(filename=FileName,
#                         data=Output2)

#JSONOUTPUT <- toJSON(Session, auto_unbox=TRUE, pretty=TRUE)

# testJson <- list(
#   date="2020-01-01T00:00:00",
#   sample=list(name='Test sample')
# )

request <- list(
  filename=NA,
  data=Session
)

JSONOUTPUT <- toJSON(request, auto_unbox=TRUE, pretty=TRUE, na="null")

print(JSONOUTPUT)

# PUT(url="http://backend:5000/api/v1/import-data/session", body=request, encode = "json")

PUT(url="http://backend:5000/api/v1/import-data/session", body=JSONOUTPUT, encode = "json")
