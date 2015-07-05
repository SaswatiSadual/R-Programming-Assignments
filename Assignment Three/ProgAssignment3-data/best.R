## This function will find out the best hospital in terms of least 30-day mortality rate according to the given 
## state and the outcome (disease)

## Input: The input given will be the state (acronym) and the outcome ("heart attack", "heart failure", :pneumonia)
## Output: The output will be the name of the hospital of that state for the particular outcome

best <- function(state, outcome) {
  
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character",na.strings="Not Available")
  
  ## Check that state and outcome are valid
  validOutcome = c("heart attack","heart failure","pneumonia")
  if (!outcome %in% validOutcome) { stop("invalid outcome")}
  
  validState = unique(data[,7])
  if (!state %in% validState) {stop("invalid state")}
  
  ## convert outcome name into column name
  fullColName <- c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
  colName <- fullColName[match(outcome,validOutcome)]
  
  ## Return hospital name in that state with lowest 30-day death rate
  data.state <- data[data$State==state,]
  id_minimum <- which.min(as.double(data.state[,colName]))
  data.state[id_minimum,"Hospital.Name"]
}

##best("MD", "heart attack")