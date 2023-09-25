#Simulação jogar a moeda

# toss a coin
(moeda <- c('cara', 'coroa'))

sample(moeda, size = 3)

sample(moeda, size = 3,replace = T)

sample(moeda, size = 10,replace = T)


# Fazer experimento replicável
set.seed(6525)
sample(moeda, size = 4, replace = TRUE)


num_flips <- 1000

# flips simulation
(flips <- sample(moeda, size = num_flips, replace = TRUE))

freqs <- table(flips)
freqs


flips <- sample(moeda, size = num_flips, replace = TRUE)
freqs <- table(flips)
freqs


cara_freq <- cumsum(flips == 'cara') / 1:num_flips



plot(cara_freq,      # vector
     type = 'l',      # line type
     lwd = 2,         # width of line
     col = 'tomato',  # color of line
     las = 1,         # orientation of tick-mark labels
     ylim = c(0, 1),  # range of y-axis
     ylab = "Frequência Relativa")  # y-axis label
abline(h = 0.1, col = 'gray50')



