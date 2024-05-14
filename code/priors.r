# PRIOR GROUP TEST
# This file contains priors that can be tried on and shows how each parameter influences the output
#
# Results:
# 1. k doesn't really change
# 2. beta fully decided by prior if assumed uniform, doesn't really change under gamma
# 3. theta fully decided by prior if assumed uniform, behaves wired under gamma



# full uniform
priors <- priorcontrol(etaprior = c(0, 0, 0, 0, 0, 0, 0, 0),
                       bprior = c(0, 4), tiprior = c(0.25, 0.75), teprior = c(0.25, 1),
                       keprior = c(8, 20), kiprior = c(15, 25), priordists = "uniform")

## >exp_beta(0.01,100), uni_k(0,100), Gamma_t(0.01,100) ####
priorG <- priorcontrol(bprior = c(0.01,100), teprior = c(0.01,100), tiprior = c(0.01,100),
                       keprior = c(0, 100), kiprior = c(0, 100), 
                       kipriordist = "uniform", kepriordist = "uniform",
                       etaprior = c(0, 1, 0, 1, 0, 1, 0, 1))
# change eta spread
priorGe <- priorcontrol(bprior = c(0.01,100), teprior = c(0.01,100), tiprior = c(0.01,100),
                       keprior = c(0, 100), kiprior = c(0, 100), 
                       kipriordist = "uniform", kepriordist = "uniform",
                       etaprior = c(0, 3, 0, 3, 0, 3, 0, 3))
# change eta mean
priorGeM <- priorcontrol(bprior = c(0.01,100), teprior = c(0.01,100), tiprior = c(0.01,100),
                       keprior = c(0, 100), kiprior = c(0, 100), 
                       kipriordist = "uniform", kepriordist = "uniform",
                       etaprior = c(0, 1, -0.5, 1, -0.0003, 1, -0.001, 1))
# change exp_beta(1,1)
priorGeMd <- priorcontrol(bprior = c(1,1), teprior = c(0.01,100), tiprior = c(0.01,100),
                         keprior = c(0, 100), kiprior = c(0, 100), 
                         kipriordist = "uniform", kepriordist = "uniform",
                         etaprior = c(0, 1, -0.5, 1, -0.0003, 1, -0.001, 1))
# change exp_beta(0.1,10)
priorGeMd2 <- priorcontrol(bprior = c(0.1,10), teprior = c(0.01,100), tiprior = c(0.01,100),
                          keprior = c(0, 100), kiprior = c(0, 100), 
                          kipriordist = "uniform", kepriordist = "uniform",
                          etaprior = c(0, 1, -0.5, 1, -0.0003, 1, -0.001, 1))
# change exp_beta(2,20), Gamma_t(1,1)
priorGeM2 <- priorcontrol(bprior = c(2,20), teprior = c(1,1), tiprior = c(1,1),
                         keprior = c(0, 100), kiprior = c(0, 100), 
                         kipriordist = "uniform", kepriordist = "uniform",
                         etaprior = c(0, 1, -0.5, 1, -0.0003, 1, -0.001, 1))
# change exp_beta(0.1,10), Gamma_t(0.1,10)
priorG2 <- priorcontrol(bprior = c(0.1,10), teprior = c(0.1,10), tiprior = c(0.1,10),
                       keprior = c(0, 100), kiprior = c(0, 100), 
                       kipriordist = "uniform", kepriordist = "uniform",
                       etaprior = c(0, 1, 0, 1, 0, 1, 0, 1))

## exp_beta(0.1,10), Gamma_t(0.1,10), >Gamma_k(0.01,100) ####
priorb <-priorcontrol(bprior = c(0.1,10), teprior = c(0.1,10), tiprior = c(0.1,10),
                      keprior = c(0.01, 100), kiprior = c(0.01, 100), 
                      etaprior = c(0, 1, 0, 1, 0, 1, 0, 1))
# change Gamma_k(0.1,10)
priorb2 <-priorcontrol(bprior = c(0.1,10), teprior = c(0.1,10), tiprior = c(0.1,10),
                      keprior = c(0.1, 10), kiprior = c(0.1, 10), 
                      etaprior = c(0, 1, 0, 1, 0, 1, 0, 1))
# change Gamma_k(1,1)
priorb3 <-priorcontrol(bprior = c(0.1,10), teprior = c(0.1,10), tiprior = c(0.1,10),
                       keprior = c(1, 1), kiprior = c(1, 1), 
                       etaprior = c(0, 1, 0, 1, 0, 1, 0, 1))
# change Gamma_k(2,10)
priorb4 <-priorcontrol(bprior = c(0.1,10), teprior = c(0.1,10), tiprior = c(0.1,10),
                       keprior = c(2, 10), kiprior = c(2, 10), 
                       etaprior = c(0, 1, 0, 1, 0, 1, 0, 1))
# change Gamma_k(3,5)
priorb5 <-priorcontrol(bprior = c(0.1,10), teprior = c(0.1,10), tiprior = c(0.1,10),
                       keprior = c(3, 5), kiprior = c(3, 5), 
                       etaprior = c(0, 1, -0.5, 1, -0.0003, 1, -0.001, 1))

## thetae~G(0,20); thetai~G(0,400); beta~Exp(0,0.3);, >Gamma_k(0.01,100) ####
priorc <-priorcontrol(bprior = c(0,20), teprior = c(0,20), tiprior = c(0,400),
                      keprior = c(0.01, 100), kiprior = c(0.01, 100), 
                      etaprior = c(0, 1, -0.5, 1, -0.0003, 1, -0.001, 1))
# change Gamma_k(0.1,10)
priorc2 <-priorcontrol(bprior = c(0,20), teprior = c(0,20), tiprior = c(0,400),
                       keprior = c(0.1, 10), kiprior = c(0.1, 10), 
                       etaprior = c(0, 1, -0.5, 1, -0.0003, 1, -0.001, 1))
# change Gamma_k(0.1,1)
priorc3 <-priorcontrol(bprior = c(0,20), teprior = c(0,20), tiprior = c(0,400),
                       keprior = c(0.1, 1), kiprior = c(0.1, 1), 
                       etaprior = c(0, 1, -0.5, 1, -0.0003, 1, -0.001, 1))
# change Gamma_k(1,10)
priorc4 <-priorcontrol(bprior = c(0,20), teprior = c(0,20), tiprior = c(0,400),
                       keprior = c(1, 10), kiprior = c(1, 10), 
                       etaprior = c(0, 1, -0.5, 1, -0.0003, 1, -0.001, 1))
# change Gamma_k(10,100)
priorc5 <-priorcontrol(bprior = c(0,20), teprior = c(0,20), tiprior = c(0,400),
                       keprior = c(10, 100), kiprior = c(10, 100), 
                       etaprior = c(0, 1, -0.5, 1, -0.0003, 1, -0.001, 1))
# change Gamma_k(1,100)
priorc6 <-priorcontrol(bprior = c(0,20), teprior = c(0,20), tiprior = c(0,400),
                       keprior = c(10, 100), kiprior = c(10, 100), 
                       etaprior = c(0, 1, -0.5, 1, -0.0003, 1, -0.001, 1))
# change Gamma_k(3,7)
priorc7 <-priorcontrol(bprior = c(0,20), teprior = c(0,20), tiprior = c(0,400),
                       keprior = c(3, 7), kiprior = c(3, 7), 
                       etaprior = c(0, 1, -0.5, 1, -0.0003, 1, -0.001, 1))

# PRIOR0
priorc0 <-priorcontrol(bprior = c(0,20), teprior = c(0,20), tiprior = c(0,20),
                      keprior = c(0,20), kiprior = c(0, 1), 
                      kipriordist = "uniform",
                      etaprior = c(0, 1, -0.5, 1, -0.0003, 1, -0.001, 1))

## Full uni test ####                      
prior0 <- priorcontrol(etaprior = c(0, 1, 0, 1, 0, 1, 0, 1),
                       bprior = c(0, 1), tiprior = c(0, 1), teprior = c(0, 1),
                       keprior = c(0, 1), kiprior = c(0, 1), priordists = "uniform")
# b(0,5), k(0,20)
prior1 <- priorcontrol(etaprior = c(0, 1, 0, 1, 0, 1, 0, 1),
                       bprior = c(0, 5), tiprior = c(0, 1), teprior = c(0, 1),
                       keprior = c(0, 20), kiprior = c(0, 20), priordists = "uniform")
# b(0,2000), k(0,200)
prior2 <- priorcontrol(etaprior = c(0, 1, 0, 1, 0, 1, 0, 1),
                       bprior = c(0, 2000), tiprior = c(0, 1), teprior = c(0, 1),
                       keprior = c(0, 200), kiprior = c(0, 200), priordists = "uniform")
# b(0,2000), k(0,200) with eta change
prior3 <- priorcontrol(etaprior = c(0, 1, -0.5, 1, -0.0003, 1, -0.001, 1),
                       bprior = c(0, 2000), tiprior = c(0, 1), teprior = c(0, 1),
                       keprior = c(0, 200), kiprior = c(0, 200), priordists = "uniform")
# b(0,2000), t(0,10), k(0,200) with eta change
prior4 <- priorcontrol(etaprior = c(0, 1, -0.5, 1, -0.0003, 1, -0.001, 1),
                       bprior = c(0, 2000), tiprior = c(0, 10), teprior = c(0, 10),
                       keprior = c(0, 200), kiprior = c(0, 200), priordists = "uniform")
# b(0,1.5), t(3,7), k(3,7)
prior5 <- priorcontrol(etaprior = c(0, 1, -0.5, 1, -0.0003, 1, -0.001, 1),
                       bprior = c(0, 1.5), tiprior = c(3, 7), teprior = c(3, 7),
                       keprior = c(3, 7), kiprior = c(3, 7), priordists = "uniform")
#
prior6 <- priorcontrol(etaprior = c(0, 1, -0.5, 1, -0.0003, 1, -0.001, 1),
                       bprior = c(0, 1000), tiprior = c(1, 1000), teprior = c(1, 1000),
                       keprior = c(1, 1000), kiprior = c(1, 1000), priordists = "uniform")

