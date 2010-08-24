## Ryan Elmore
## 12 Aug 2010
## MLS graph

## Copyright (c) 2010, under the Simplified BSD License.  
## For more information on FreeBSD see: 
##      http://www.opensource.org/licenses/bsd-license.php
## All rights reserved.                      

## I don't even know what that means, but other repositories tend to
##  have something similar (if not exact -- Thanks Drew Conway)! 

wd.path <- "~/Side_Projects/Sports/MLS/src/"

## Dependencies:
source(paste(wd.path, "load.R", sep=""))
  
ggplot(data = mls.reg.dat, aes(x=year, y=team, fill=goals/games)) + 
  geom_tile() + 
  scale_fill_continuous(name = "goals/game")
  
ggsave("../figures/gpg_mls_1.png",hei=7,wid=7)

## Consolidate team names
mls.reg.dat$team[mls.reg.dat$team == "MetroStars"] <- "New York Red Bulls"
mls.reg.dat$team[mls.reg.dat$team == "Dallas Burn"] <- "FC Dallas"
mls.reg.dat$team[mls.reg.dat$team == "San Jose Clash"] <- 
  "San Jose Earthquakes"

ggplot(data = mls.reg.dat, aes(x=year, y=team, fill=goals/games)) + 
  geom_tile() +
  scale_fill_continuous(name="goals/game")

ggsave("../figures/gpg_mls_2.png", hei = 7, wid = 7)
 
## Edit the data
mls.reg.dat$h_tot <- as.numeric(gsub(",", "", mls.reg.dat$h_tot))
mls.reg.dat$h_avg <- as.numeric(gsub(",", "", mls.reg.dat$h_avg))
mls.reg.dat$a_tot <- as.numeric(gsub(",", "", mls.reg.dat$a_tot))
mls.reg.dat$a_avg <- as.numeric(gsub(",", "", mls.reg.dat$a_avg))



## Trying to find some interesting stuff...

## Subset of teams
team.sub <- c("San Jose Earthquakes", "New York Red Bulls",
              "New England Revolution", "Los Angeles Galaxy",
              "Kansas City Wizards", "FC Dallas", "D.C. United",
              "Columbus Crew", "Colorado Rapids", "Chicago Fire")
mls.reg.sub <- subset(mls.reg.dat, team %in% team.sub)

mls.reg.sub$prior.2003 <- mls.reg.sub$year <= 2002

ggplot(data = mls.reg.sub, aes(x=year, y=team, fill=goals/games)) + 
  geom_tile() + 
  scale_fill_continuous(name = "goals/game")

ggplot(data = mls.reg.sub, aes(x = year, y = sog/shots)) + 
  geom_point(col="navy") + geom_smooth(col = I("darkred")) +
  scale_y_continuous("shots on goal per shot")

ggsave("../figures/shots_on_goal_per_shot.png", hei = 7, wid = 7)

ggplot(data = mls.reg.sub, aes(x = year, y = sog/goals)) + 
  geom_point(col = "navy") + geom_smooth(col = I("darkred")) +
  scale_y_continuous("shots on goal per goal")

ggsave("../figures/shots_on_goal_per_goal.png", hei = 7, wid = 7)

ggplot(data = mls.reg.sub, aes(x = year, y = assists/goals)) + 
  geom_point(col = "navy") + geom_smooth(col = I("darkred"))

last_plot() + scale_y_continuous(name = "assists per goal")

ggsave("../figures/assists_per_goal.png", hei = 7, wid = 7)

ggplot(data = mls.reg.sub, aes(x = year, y = assists/goals, col = prior.2003)) +
  scale_y_continuous(name = "assists per goal") + 
  geom_point() + 
  scale_colour_manual(values = c("forestgreen", "red")) + 
  opts(legend.position = "none") + 
  geom_smooth() 

# last_plot() + scale_colour_discrete("", breaks = c(TRUE, FALSE), 
#   labels = c("< 2003", ">= 2003"))

ggsave("../figures/assists_per_goal_split.png", hei = 7, wid = 7)

ggplot(data = mls.reg.sub, aes(x = year, y = assists)) +
  geom_point() + geom_smooth() 

ggsave("../figures/assists.png", hei = 7, wid = 7)

ggplot(data = mls.reg.sub, aes(x = year, y = goals)) +
  geom_point() + geom_smooth() 

ggsave("../figures/goals.png", hei = 7, wid = 7)

ggplot(data = mls.reg.sub, aes(x = year, y = goals, col = prior.2003)) +
  geom_point() + 
  scale_colour_manual(values = c("forestgreen", "red")) + 
  opts(legend.position = "none") + 
  geom_smooth() 
              