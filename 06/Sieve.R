n <- 10000

#Sequence Of N Numbers
x <- seq(1:n)
y <- replicate(n,TRUE)

#create an empty vector to store prime numbers
prime <- c()

for (i in 1:n){
  #1 is Neither Prime Nor Composite
  if (i == 1){
    y[i] <- FALSE
  }
  #Special Prime Numbers 2 & 3
  else if (i>1 && i<4){
    y[i] <- TRUE
    prime<append(prime,x[i])
  }
  #Marking Multiples of 2,3 & 5 as NON PRIME NUMBERS
  else
    {
    for (p in prime){
      if(i%%p==0){
        y[i] <- FALSE
      }
      
    }
  }
  #Catching & Storing the Prime Numbers in a Vector Named "Prime"
  if(y[i]%%x[i]==1){
    writeLines(paste("Prime Found",x[i]))
    prime<-append(prime,x[i])
  }  
}

writeLines("\n")
print(paste("Prime Numbers till ",n," are: "))
print(prime)
