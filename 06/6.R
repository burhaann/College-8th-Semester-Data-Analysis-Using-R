primeNumbers <- function(n) {
  if (n >= 2) {
    x = seq(2, n)
    print(paste("x sequence =",x))
    prime = c()
    print(paste("c = ",(prime)))
    for (i in seq(2, n)) {
      if (any(x == i)) {
        prime = c(prime, i)
        print(paste("prime before",(prime)))
  #A value in x will finally be false if i is Not a prime, else true.
        radio <-  x %% i
        print(paste("radio = ",(radio)))
        wool <- radio != 0
        print(paste("wool = ",(wool)))
        x = c(x[wool], i)
        print(paste("prime after",(x)))
      }
    }
    return(prime)
  }
  else 
  {
    stop("Input number should be at least 2.")
  }
} 
primeNumbers(5)
