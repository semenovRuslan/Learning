test<-function(){
	## 1
	library(datasets)
	ds<-iris
	selCol<-subset(ds, Species=='virginica', select=c('Sepal.Length'))
	print(colMeans(selCol))

	## 2
	print(apply(iris[, 1:4], 1, mean))

	## 3
	ds<-mtcars
	print(tapply(ds$mpg, mtcars$cyl, mean)) 

	##4
	print(tapply(mtcars$hp, mtcars$cyl, mean))
	selCol1<-subset(ds, cyl==4, select=c('hp'))
	selCol2<-subset(ds, cyl==8, select=c('hp'))
	print(colMeans(selCol1)-colMeans(selCol2))
}

makeCache <- function() {
	source('cachematrix.R')
	a<-makeCacheMatrix()
	a$set(matrix(1:4,2,2))
	cacheSolve(a)
}
