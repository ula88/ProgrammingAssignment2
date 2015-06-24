## Functions to work with a cached inverse of a matrix
## to save processing time.

## This function creates other functions to get and set
## a matrix and its inverse.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m 
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## This function attempts to get the cached data and return it.
## If there is no cached data it will be created by the function.

cacheSolve <- function(x, ...) {
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setsolve(m)
  m
}
