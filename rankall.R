library(dplyr)
rankall <- function (outcome, num = "best") {
    source("ranked.R")
    rank <- ranked(outcome)
    state_list <- unique(rank[,2])
    rank_vector <- c()
    rownum <- num
    outCol <- switch(outcome,
                     "heart attack" = as.numeric(3),
                     "heart failure" = as.numeric(4),
                     "pneumonia" = as.numeric(5)
    )

    for (i in 1:length(state_list)) {
        st_data <- rank[grep(state_list[i],rank$state),]
        
        if (num == "best") {
            rownum = 1
        }
        if (num == "worst") {
            rownum = as.numeric(nrow(orderdata))
        }
        
        rank_vector <- append(rank_vector, as.character(orderdata[rownum,1]))
        rank_vector <- append(rank_vector, as.character(state_list[i]))
        rownum <- num
    }
