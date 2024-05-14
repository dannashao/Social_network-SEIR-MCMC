library(epinet)
library(network) #plot
library(bayestestR) #from easystats, for CI

# This script shows how to simulate an epidemic with epinet #
# First, it creates a contact network with random distance, #
# then run a simulated epidemic on this contact network.    #

set.seed(1)

## SIMULATE CONTACT NETWORK ##

# Setting network parameters:
# Setting total number of nodes: 50
N <- 50 
# Assign a random 2-dimensional position for each node
simCov <- data.frame(id = 1:N, xpos = runif(N), ypos = runif(N))
# Consider only two covariates, the overall density = 1 and Euclidean distance
simDyadCov <- BuildX(simCov, binaryCol = list(c(2,3)), binaryFunc = "euclidean")
# Set incremental log-odds of an edge decrease by 7 for each unit distance
simeta <- c(0,-7)

# Simulate the network
simnet <- SimulateDyadicLinearERGM(N = N, dyadiccovmat = simDyadCov, eta = simeta)
simNet <- as.network(simnet)
simCoord <- data.matrix(data.frame(simCov[,2], simCov[,3]))
plot(simNet, usearrows = 0, coord = simCoord)



## SIMULATE EPIDEMIC ##

# Using beta=1, k_I=3, theta_I=7, k_E=3, theta_E=7
simepi <- SEIR.simulator(M=simnet, N=N, beta=1, ki=3, thetai=7, ke=3, latencydist="gamma")
plot(simepi, e.col = "slategrey", i.col = "red")

## MCMC
# Set MCMC parameters
simMcmcinput <- MCMCcontrol(nsamp = 200000, thinning = 100, etapropsd = c(1,1))
# With assigned priors
simPriors <- priorcontrol(etaprior = c(0, 10, 0, 10),
                          bprior = c(0, 4), tiprior = c(1, 15), teprior = c(1, 15),
                          keprior = c(1, 7), kiprior = c(1, 7), priordists="uniform")
# Run the MCMC with above settings
simOut <- epinet(~xpos.ypos.L2Dist, epidata = simepi, dyadiccovmat = simDyadCov,
                 mcmcinput = simMcmcinput, priors = simPriors)