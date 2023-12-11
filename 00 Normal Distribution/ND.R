# Create a sequence of numbers between -10 and 10 incrementing by 0.1.
x <- seq(-10, 10, by = .1)

# Choose the mean as 2.5 and standard deviation as 2
y <- dnorm(x, mean = 2.5, sd = 2)
z = rnorm(100000)

plot(density(z))
