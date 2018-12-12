# normalise input suburb
suburbs <- read.csv(file="suburbs.csv", header = FALSE, sep = ",")
View(suburbs)

normalize_suburbs <- function(x) {
  (x-min(x)) / (max(x) - min(x))
}

suburbs_normalized <- as.data.frame(lapply(suburbs[2], normalize_suburbs))
View(suburbs_normalized)
full_normalized_suburbs = cbind(suburbs, suburbs_normalized)
names(full_normalized_suburbs) <- c("a", "b", "c")
View(full_normalized_suburbs)

y = "Lane Cove"

x <- full_normalized_suburbs[full_normalized_suburbs == y,]

print(x$c)




# Get file on R
original_tnt_data_set <- read.table(file.choose(), sep = ',')
View(original_tnt_data_set)

training <- original_tnt_data_set[1:17317, -7]
View(training)

test <- original_tnt_data_set[17318:17417, -7] 
View(test)

library(class)

data_prediction <- knn(training, test, original_tnt_data_set[1:17317, 7], k=1)

View(data_prediction)

test <- original_tnt_data_set[17318:17417, -7]

typeof(test)

View(test)
View(test$V1)

small <- c(0.111, 0.222, 0.333, 0.444 ,0.555, 0.666)

data_prediction <- knn(training, small, original_tnt_data_set[1:17317, 7], k=1)

View(data_prediction)

total <- rbind(test, small)
View(total)
nrow(total)
       


View(suburbs)

suburbs$V2



rocco <- read.csv(file="experiment_last.csv", header = FALSE, sep = ",")
View(rocco)
