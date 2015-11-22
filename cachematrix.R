## My function is to look at whether an input matrix is cached or not, if yes, return directly the resulf; if not, calculate and return the result

## makeCacheMatrix is a function to create the inverse of the input matrix, cacheSolve is a function to check if the input matrix is cached or not.

makeCacheMatrix <- function(x = matrix()) {
  inversematrix <- NULL
  set <- function(y){
    x <<- y
    inversematrix <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) matrixinverse <<- solve
  getinverse <- function() matrixinverse
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


cacheSolve <- function(x, ...) {
  matrixinverse <- x$getinverse()
  if(!is.null(matrixinverse)){
    message("getting cached data")
    return(matrixinverse)
  }
  data <- x$get()
  matrixinverse <- solve(data, ...)
  x$setinverse(matrixinverse)
  matrixinverse
}

