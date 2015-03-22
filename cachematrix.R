## A pair of functions to calculate and cache the inverse of a matrix "x"


## Create a list of four functions to calculate, store and retrieve the inverse of matrix "x"
makeCacheMatrix <- function(x = matrix()) {

## clear cache
      mat <- NULL

## function to pass the input matrix to "x", and clear cache, as the inverse of this new matrix has not been calculated
      set <- function(y) {
            x <<- y
            mat <<- NULL
      }

## function to return the input matrix "x"
      get <- function() x

## function to pass the received matrix ("matrix") to the cache (for cachesolve, this will be the inverse matrix of x)
      setmatrix <- function(matrix) mat <<- matrix

## function to return the cached inverse matrix
      getmatrix <- function() mat

## return the created functions in a list
      list(set = set, get = get,
           setmatrix = setmatrix,
           getmatrix = getmatrix)
  
}


## Returns the inverse of a matrix, retrieveing it from cache if available

cacheSolve <- function(x, ...) {
      

      mat <- x$getmatrix()
      
## Check if a cached value is available, and if there is, return it
      
      if(!is.null(mat)) {
            message("getting cached data")
            return(mat)
      }
      
## If no cached value, calculate inverse and store in cache

      data <- x$get()
      mat <- solve(data, ...)
      x$setmatrix(mat)
      mat

}
