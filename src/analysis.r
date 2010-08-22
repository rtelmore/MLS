## Ryan Elmore
## 12 Aug 2010
## MLS graph


setwd("~/Side_Projects/Sports/MLS/src/")
library(ggplot2)

mls.reg.dat <- read.table("../data/mls_reg_season_20100812.csv",
  header = F, sep = ";", )

mls.reg.dat$V1 <- as.character(mls.reg.dat$V1)
names(mls.reg.dat) <- c("team", "year", "games", "goals", "assists", "shots", 
                        "sog", "pg", "pa", "fc", "fs", "yc", "rc", "so", "sv", 
                        "svp", "gaa", "hg", "h_tot", "h_avg", "ag", "a_tot", 
                        "a_avg")
  
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

## My analysis

rs.dat <- 
  read.csv("~/Side_Projects/Sports/Simmons/length_of_baseball_games_20100802.csv", 
  header=F)
names(rs.dat) <- 
  c("team","year","mean_len","med_len","std_len","league","TNAT")


ggplot(data=rs.dat, aes(x = year, y = team, fill = med_len)) + 
  geom_tile() 
  

#+ opts(title = "Median Length of MLB Games by Team (in minutes)") 

last_plot() + geom_vline(x=c(1993,2004),lty=3)

ggsave("~/Sports/Simmons/mlb_length_3.png",hei=7,wid=7)

rs.dat$bs <- rs.dat$team=='BOS'

qplot(x=year, y=med_len, data=rs.dat, geom = c("point","smooth"), 
  span = .5, colour=bs, ylab="length of game in minutes")

last_plot() + scale_colour_discrete(name="Boston?")
last_plot() + geom_vline(x=c(1993,2004),lty=2,col="black")
ggsave("~/Sports/Simmons/mlb_length_5.png",hei=7,wid=7)

qplot(x=year, y=med_len, data=rs.dat, geom = c("point","smooth"), 
  span = .5, ylab="length of game in minutes")

last_plot() + geom_vline(x=c(1993,2004),lty=2,col="red")

ggsave("~/Sports/Simmons/mlb_length_4.png",hei=7,wid=7)

## NL vs AL
qplot(x=year, y=med_len, data=rs.dat, geom = c("point","smooth"), 
  span = .5, colour=league, ylab="length of game in minutes")


ggplot(data = mls.reg.dat, aes(x = as.numeric(gsub(",", "", 
  mls.reg.dat$a_tot)), y = sog)) + geom_point() + 
  facet_wrap(~ team)
