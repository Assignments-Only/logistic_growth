#Script to plot data and model

growth_data <- read.csv("experiment.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- 879 #initial number of the population

r <- 0.01 #growth rate

K <- 60000000207 #carrying capacity

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()

#scale_y_continuous(trans='log10')

ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10') + 
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()

sink(file = "package-versions.txt")
sessionInfo()
sink()
