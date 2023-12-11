a<-c(1,2,3)
b<-c(4,5,6)
c<-c(7,8,9)

#Using Column Bind Function
Matrix<-cbind(a,b,c)
print("3x3 Matrix:")
print(Matrix)

#Another Method
Vector <- c(a,b,c)
Matrix <- matrix(data = Vector,byrow = TRUE, ncol = 3)
print(Matrix)