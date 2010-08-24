## Ryan Elmore
## 12 Aug 2010
## MLS R setup file

## Copyright (c) 2010, under the Simplified BSD License.  
## For more information on FreeBSD see: 
##      http://www.opensource.org/licenses/bsd-license.php
## All rights reserved.                      

## I don't even know what that means, but other repositories tend to
##  have something similar (if not exact -- Thanks Drew Conway)! 

setwd(wd.path)

mls.reg.dat <- read.table("../data/mls_reg_season_20100812.csv",
  header = F, sep = ";", )

mls.reg.dat$V1 <- as.character(mls.reg.dat$V1)
names(mls.reg.dat) <- c("team", "year", "games", "goals", "assists", "shots", 
                        "sog", "pg", "pa", "fc", "fs", "yc", "rc", "so", "sv", 
                        "svp", "gaa", "hg", "h_tot", "h_avg", "ag", "a_tot", 
                        "a_avg")

## Libraries
library(ggplot2)

