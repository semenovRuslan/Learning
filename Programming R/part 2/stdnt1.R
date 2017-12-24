makeCacheMatrix <- function(x = matrix()) { 
        m <- NULL 
        set <- function(y) { 
                 x <<- y 
                 m <<- NULL 
         } 
         get <- function() x 
         setsolve <- function(matrix) m <<- matrix 
         getsolve <- function() m 
         list(set = set, get = get, 
              setsolve = setsolve, 
              getsolve = getsolve) 
 } 

 
 ## The above function caches the given matrix and creates functions that are called 
 ## within the "cacheSolve" function found below.  
 
 
 cacheSolve <- function(x, ...) { 
         m <- x$getsolve() 
         if(!is.null(m)) { 
                 message("getting cached data") 
                 return(m) 
         } 
         data <- x$get() 
         m <- solve(data, ...) 
         x$setsolve(m) 
         m 
 } 

 
