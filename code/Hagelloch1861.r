library(epinet)
library(coda)
library(bayesplot)

# This script shows how to reproduce the result from the original research #
# using the Hagelloch1861 data and the original parameter settings,        #
# together with how to do MCMC convergence tests and do trace plot         #


## SETTINGS
examplemcmcinput <- MCMCcontrol(nsamp = 10000000, thinning = 1000,
                                 extrathinning = 10, burnin = 2000000, seed = 2,
                           etapropsd = c(rep(0.05, times = 3), 0.005))
examplepriors <- priorcontrol(etaprior = c(0, 3, 0, 3, 0, 3, 0, 3 / 40),
                         bprior = c(0, 4), tiprior = c(0.25, 0.75), teprior = c(0.25, 1),
                         keprior = c(8, 20), kiprior = c(15, 25), priordists = "uniform")
exampleout <- epinet(~ `Classroom 1` + `Classroom 2` + `House Distance`,
                epidata = HagellochTimes, dyadiccovmat = HagellochDyadCov,
                mcmcinput = examplemcmcinput, priors = examplepriors)


## POTENTIAL BUG RESOLVE: you might need to modify some function in the package by
## trace(epibayesmcmc,edit=T)
## then add 
## etapriordist <- rep("normal", times = etapars)
## at line 15

Hagelloch1861 <- exampleout

plot(Hagelloch1861, index = 100)

apply(Hagelloch1861$eta, 2, ess) # effective sample size 

# MCMC convergence test
geweke.diag(as.mcmc(Hagelloch1861$eta)) 
geweke.diag(as.mcmc(Hagelloch1861$beta))
geweke.diag(as.mcmc(Hagelloch1861$ki))
geweke.diag(as.mcmc(Hagelloch1861$thetai))
geweke.diag(as.mcmc(Hagelloch1861$ke))
geweke.diag(as.mcmc(Hagelloch1861$thetae))

# Plotting the posteriors
par(mfrow=c(2,2))
hist(Hagelloch1861[["ki"]],breaks="FD",main=NULL)
hist(Hagelloch1861[["thetai"]],breaks="FD",main=NULL)
hist(Hagelloch1861[["ke"]],breaks="FD",main=NULL)
hist(Hagelloch1861[["thetae"]],breaks="FD",main=NULL)

# Trace plot for eta
mcmc_trace(Hagelloch1861[["eta"]],facet_args = list(nrow=2,ncol=4))
mcmc_intervals(Hagelloch1861[["eta"]],pars=c("Household","`Classroom 1`","`Classroom 2`","`House Distance`","`Male Match`","`Female Match`","`Age Diff`"))
