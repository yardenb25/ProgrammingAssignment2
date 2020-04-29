## Put comments here that give an overall description of what your
## functions do

## x <<- y creates x, which is then retrieved by get(). Note that get is also a base function and is being overwritten here. 
I would advocate in avoiding this, even though it's confined to a function. An ad hoc solution would be to reach base get function through 
base::get.

makeCacheMatrix <- function(x = matrix()) {
j <- NULL
set <- function(y) {
  x <<- y
  j <<- NULL
}
get <- function()x
setInverse <- function(inverse)j <<- inverse
getInverse <- function()j
list(set = set, get = get,
     setInverse = setInverse,
     getInverse = getInverse)
}


## In this code I return the matrix which is the inverse of x using getInverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        j <- x$getInverse()
        if(!is.null(j)){
        message("getting cached data")
        return(j)
        }
        mat <- x$get()
        j <- solve(mat, ...)
        x$setInverse(j)
}
