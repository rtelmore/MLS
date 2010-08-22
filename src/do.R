## Ryan Elmore
## 12 Aug 2010
## MLS graph

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

ggsave("../figures/gpg_mls_2.png",hei=7,wid=7)
 
## Edit the data
mls.reg.dat$h_tot <- as.numeric(gsub(",", "", mls.reg.dat$h_tot))
mls.reg.dat$h_avg <- as.numeric(gsub(",", "", mls.reg.dat$h_avg))
mls.reg.dat$a_tot <- as.numeric(gsub(",", "", mls.reg.dat$a_tot))
mls.reg.dat$a_avg <- as.numeric(gsub(",", "", mls.reg.dat$a_avg))



## Shots on goal vs fs by team and by year
ggplot(data = mls.reg.dat, aes(x = a_tot, y = sog)) + geom_point() + 
  facet_wrap(~ team)
 
ggplot(data = mls.reg.dat, aes(x = fs, y = fc, col = team)) + 
  geom_point() + facet_wrap(~ year)
  
  fill = )) + 
  geom_tile() + scale_fill_continuous(name = "away")

ggplot(data = mls.reg.dat, aes(x = year, y = shots)) + 
  geom_point(col="navy") + geom_smooth()
  

ggplot(data = mls.reg.dat, aes(x = year, y = sog)) + 
  geom_point(col="navy")
  
ggplot(data = mls.reg.dat, aes(x = year, y = sog/shots)) + 
  geom_point(col="navy")
