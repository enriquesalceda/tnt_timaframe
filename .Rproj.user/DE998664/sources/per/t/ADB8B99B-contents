# plumber.R
library(plumber)

# Suburbs handling and normalization START
suburbs <- read.csv(file="suburbs.csv", header = FALSE, sep = ",")

normalize_suburbs <- function(x) {
  (x-min(x)) / (max(x) - min(x))
}

suburbs_normalized <- as.data.frame(lapply(suburbs[2], normalize_suburbs))
full_normalized_suburbs = cbind(suburbs, suburbs_normalized)
names(full_normalized_suburbs) <- c("a", "b", "c")

normal_suburb <- function(suburb_name){
  full_normalized_suburbs[full_normalized_suburbs == suburb_name,]$c  
}
# Suburbs handling and normalization END

# Postcode handling and normalization START
postcodes <- read.csv(file="postcodes.csv", header = FALSE, sep = ",")

normalize_postcodes <- function(x) {
  (x-min(x)) / (max(x) - min(x))
}

postcodes_normalized <- as.data.frame(lapply(postcodes[2], normalize_postcodes))
full_normalized_postcodes = cbind(postcodes, postcodes_normalized)
names(full_normalized_postcodes) <- c("a", "b", "c")

normal_postcode <- function(postcode_number){
  full_normalized_postcodes[full_normalized_postcodes == postcode_number,]$c  
}
# Postcodes handling and normalization END

# States handling and normalization START
states <- read.csv(file="states.csv", header = FALSE, sep = ",")

normalize_states <- function(x) {
  (x-min(x)) / (max(x) - min(x))
}

states_normalized <- as.data.frame(lapply(states [2], normalize_states))
full_normalized_states = cbind(states, states_normalized)
names(full_normalized_states) <- c("a", "b", "c")

normal_state <- function(state_name){
  full_normalized_states[full_normalized_states == state_name,]$c  
}
# States handling and normalization END

# Get training set START
training_experiment <- read.csv(file="experiment_last.csv", header = FALSE, sep = ",")
View(training_experiment)

# Get training set END 

# plumber.R

#' Echo the parameter that was sent in
#' @param delivery_suburb
#' @param delivery_postcode
#' @param delivery_state
#' @param pickup_postcode
#' @param pickup_suburb
#' @param pickup_state
#' @get /echo

function(delivery_suburb="", delivery_postcode="", delivery_state="", pickup_postcode="", pickup_suburb="", pickup_state=""){
  library(class)
  normalized_pickup_state <- normal_state(pickup_state)
  normalized_pickup_suburb <- normal_suburb(pickup_suburb)
  normalized_pickup_postcode <- normal_postcode(pickup_postcode)
  
  normalized_delivery_state <- normal_state(delivery_state)
  normalized_delivery_suburb <- normal_suburb(delivery_suburb)
  normalized_delivery_postcode <- normal_postcode(delivery_postcode)
  
  # algorithm order
  
  object_for_prediction = c(
    normalized_delivery_suburb,
    normalized_delivery_postcode,
    normalized_delivery_state,
    
    normalized_pickup_postcode,
    normalized_pickup_suburb,
    normalized_pickup_state
    )
  
  print('object for prediction START')
  print(object_for_prediction)
  print('object for prediction END')
  
  data_prediction <- knn(training_experiment[1:17317,-7], object_for_prediction, training_experiment[1:17317, 7], k=1)
  
  list(
    delivery_state=delivery_state,
    delivery_suburb=delivery_suburb,
    delivery_postcode=delivery_postcode,
    pickup_state=pickup_state,
    pickup_postcode=pickup_postcode,
    pickup_suburb=pickup_suburb,
    normalized_pickup_state = normalized_pickup_state,
    normalized_pickup_suburb = normalized_pickup_suburb,
    normalized_pickup_postcode = normalized_pickup_postcode,
    normalized_delivery_state = normalized_delivery_state,
    normalized_delivery_suburb = normalized_delivery_suburb,
    normalized_delivery_postcode = normalized_delivery_postcode,
    predicted_value = data_prediction
    )
}

