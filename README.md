# HACKATON PROJECT: Predicting provided delivery time frames by TNT

This is a work in progress, at this moment the prediction accuracy is 80%.

## How to run a server locally

1. Open the project with RStudio.
2. Go to your console and run the following commands:

```R
> library(plumber)
> p <- plumb("plumber.R")
> p$run(port = 5762)
```

3. Then you can access to this portal locally `http://127.0.0.1:5762/__swagger__/`

## TODOS

A list of the first things that come to my mind at the moment, probably there
are gonna be more:

1. Refactor the `plumber.R` file, at this moment that file is handling
   everything. The data normalization and the KNN should be on a different
   place.
2. The list of suburbs that we have at the moment are the suburbs that have been
   used by TNT shipments. Any suburb that has not been used by TNT it won't
   appear on this list. However, this list is limited from 1/January/2018 and
   also we removed shipments coming from big companies.
3. Create a well balanced dataset with a normal distribution of shipments. This
   means to get a uniform list of all the states using the majority of the
   suburbs and postcodes.
4. Improve the endpoint, we just have the `echo` endpoint.
5. Add authentication to the web service.
5. Handle request errors properly.
7. Show better errors as a web service.
