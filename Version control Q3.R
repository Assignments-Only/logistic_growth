##Code for Question 3

# Load necessary package
library(ggplot2)

# Parameters for the equations
y0 <- 879          # Initial value
r <- 0.01          # Growth rate
K <- 60000000207   # Carrying capacity
t <- seq(0, 4980, by = 60) # Time range obtained from experiment.csv

# Exponential growth equation
y_exp <- y0 * exp(r * t)

# Logistic growth equation
y_logistic <- K / (1 + ((K - y0) / y0) * exp(-r * t))

# Combine the data into a data frame
data <- data.frame(
  Time = rep(t, 2),
  Value = c(y_exp, y_logistic),
  Model = rep(c("Exponential", "Logistic"), each = length(t))
)

# Plot the data
ggplot(data, aes(x = Time, y = log(Value), color = Model)) +
  geom_line(size = 1) +
  labs(
    title = "Exponential vs Logistic Growth",
    x = "Time(min)",
    y = "log_Population",
    color = "Model"
  ) +
  theme_minimal()
