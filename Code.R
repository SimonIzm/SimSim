##CKME136 Project 


##Import Datasets
EPLLeagueTable1718Updated <- read.csv("~/Certificate Data Analytics Ryerson/CKME136 - Capstone Project/Dataset/EPL/League Table/EPLLeagueTable1718Updated.csv")
View(EPLLeagueTable1718Updated)
attach(EPLLeagueTable1718Updated)

EPLLeagueTable1819Updated <- read.csv("~/Certificate Data Analytics Ryerson/CKME136 - Capstone Project/Dataset/EPL/League Table/EPLLeagueTable1819Updated.csv")
View(EPLLeagueTable1819Updated)
attach(EPLLeagueTable1819Updated)

EPLPlayerMiscellaneous1718Updated <- read.csv("~/Certificate Data Analytics Ryerson/CKME136 - Capstone Project/Dataset/EPL/Player Miscellaneous/EPLPlayerMiscellaneous1718Updated.csv")
View(EPLPlayerMiscellaneous1718Updated)
attach(EPLPlayerMiscellaneous1718Updated)

EPLPlayerMiscellaneous1819Updated <- read.csv("~/Certificate Data Analytics Ryerson/CKME136 - Capstone Project/Dataset/EPL/Player Miscellaneous/EPLPlayerMiscellaneous1819Updated.csv")
View(EPLPlayerMiscellaneous1819Updated)
attach(EPLPlayerMiscellaneous1819Updated)

EPLPlayerPassing1718Updated <- read.csv("~/Certificate Data Analytics Ryerson/CKME136 - Capstone Project/Dataset/EPL/Player Passing/EPLPlayerPassing1718Updated.csv")
View(EPLPlayerPassing1718Updated)
attach(EPLPlayerPassing1718Updated)

EPLPlayerPassing1819Updated <- read.csv("~/Certificate Data Analytics Ryerson/CKME136 - Capstone Project/Dataset/EPL/Player Passing/EPLPlayerPassing1819Updated.csv")
View(EPLPlayerPassing1819Updated)
attach(EPLPlayerPassing1819Updated)

EPLPlayerShooting1718Updated <- read.csv("~/Certificate Data Analytics Ryerson/CKME136 - Capstone Project/Dataset/EPL/Player Shooting/EPLPlayerShooting1718Updated.csv")
View(EPLPlayerShooting1718Updated)
attach(EPLPlayerShooting1718Updated)

EPLPlayerShooting1819Updated <- read.csv("~/Certificate Data Analytics Ryerson/CKME136 - Capstone Project/Dataset/EPL/Player Shooting/EPLPlayerShooting1819Updated.csv")
View(EPLPlayerShooting1819Updated)
attach(EPLPlayerShooting1819Updated)

EPLPlayerStandard1718Updated <- read.csv("~/Certificate Data Analytics Ryerson/CKME136 - Capstone Project/Dataset/EPL/Player Standard/EPLPlayerStandard1718Updated.csv")
View(EPLPlayerStandard1718Updated)
attach(EPLPlayerStandard1718Updated)

EPLPlayerStandard1819Updated <- read.csv("~/Certificate Data Analytics Ryerson/CKME136 - Capstone Project/Dataset/EPL/Player Standard/EPLPlayerStandard1819Updated.csv")
View(EPLPlayerStandard1819Updated)
attach(EPLPlayerStandard1819Updated)

library(plyr)
install.packages("tidyverse")
library(tidyverse)

##Renaming Columns

##LeagueTable
colnames(EPLLeagueTable1819Updated)[colnames(EPLLeagueTable1819Updated) %in% c("Rk", "Squad", "MP", "W", "D", "L", "GF", "GA", "Pts", "Attendance")] <- c("Season_End_Team_Ranking","Team_Name", "Team_MP", "Team_Wins", "Team_Ties", "Team_Losses", "Team_GF", "Team_GA", "Team_Season_End_Pts", "Audience_Attendance")
colnames(EPLLeagueTable1718Updated)[colnames(EPLLeagueTable1718Updated) %in% c("Rk", "Squad", "MP", "W", "D", "L", "GF", "GA", "Pts", "Attendance")] <- c("Season_End_Team_Ranking","Team_Name", "Team_MP", "Team_Wins", "Team_Ties", "Team_Losses", "Team_GF", "Team_GA", "Team_Season_End_Pts", "Audience_Attendance")
view(EPLLeagueTable1819Updated)

##PlayerShooting
colnames(EPLPlayerShooting1718Updated)[colnames(EPLPlayerShooting1718Updated) %in% c("Player", "Pos1", "Pos2", "Squad", "Born", "Gls", "PK", "Pkatt", "Sh", "SoT", "FK")]<- c("Player_Name", "Position_1", "Position_2", "Team_Name", "Birth_Year", "Gls_By_Player", "PK_By_Player", "Pkatt_By_Player", "Player_SH", "Player_SoT", "Player_FK")
colnames(EPLPlayerShooting1819Updated)[colnames(EPLPlayerShooting1819Updated) %in% c("Player", "Pos1", "Pos2", "Squad", "Born", "Gls", "PK", "Pkatt", "Sh", "SoT", "FK")]<- c("Player_Name", "Position_1", "Position_2", "Team_Name", "Birth_Year", "Gls_By_Player", "PK_By_Player", "Pkatt_By_Player", "Player_SH", "Player_SoT", "Player_FK")

##PlayerStandard
colnames(EPLPlayerStandard1718Updated)[colnames(EPLPlayerStandard1718Updated) %in% c("Player", "Pos1", "Pos2", "Squad", "Born", "MinutesPlayed", "PlayerStarts", "PlayerMinutes", "Gls", "Ast", "PK", "Pkatt", "CrdY", "CrdR")] <- c("Player_Name", "Position_1", "Position_2", "Team_Name", "Birth_Year", "Matches_Played_By_Player", "Player_Starts", "Player_Minutes_Played", "Gls_By_Player", "Ast_By_Player", "PK_By_Player", "Pkatt_By_Player", "CrdY_By_Player", "CrdR_By_Player")
colnames(EPLPlayerStandard1819Updated)[colnames(EPLPlayerStandard1819Updated) %in% c("Player", "Pos1", "Pos2", "Squad", "Born", "MinutesPlayed", "PlayerStarts", "PlayerMinutes", "Gls", "Ast", "PK", "Pkatt", "CrdY", "CrdR")] <- c("Player_Name", "Position_1", "Position_2", "Team_Name", "Birth_Year", "Matches_Played_By_Player", "Player_Starts", "Player_Minutes_Played", "Gls_By_Player", "Ast_By_Player", "PK_By_Player", "Pkatt_By_Player", "CrdY_By_Player", "CrdR_By_Player")

##PlayerPassing
colnames(EPLPlayerPassing1819Updated)[colnames(EPLPlayerPassing1819Updated) %in% c("Player", "Pos1", "Pos2", "Squad", "Born", "AstByPlayer", "KPAst", "PlayerTotalCmpPasses", "PlayerTotalAttPasses", "PlayerShortCmpPasses", "PlayerShortAttPasses", "PlayerMediumCmpPasses", "PlayerMediumAttPasses", "PlayerLongCmpPasses", "PlayerLongAttPasses", "Left", "Right", "FK", "ThroughBall", "CK", "Throwins", "PassesFinalThird", "PPA", "CrsPA")] <- c("Player_Name", "Position_1", "Position_2", "Team_Name", "Birth_Year", "Ast_By_Player", "Player_KP_Ast", "Player_Total_Cmp_Passes", "Player_Total_Att_Passes", "Player_Short_Cmp_Passes", "Player_Short_Att_Passes", "Player_Medium_Cmp_Passes", "Player_Medium_Att_Passes", "Player_Long_Cmp_Passes", "Player_Long_Att_Passes", "Player_Passes_Left_Foot", "Player_Passes_Right_Foot", "Player_Passes_Through_Ball","Player_Passes_FK", "Corner_Kicks", "Thrown_Ins", "Passes_Into_Final_Third", "Passes_Into_Penalty_Area", "Crosses_Into_Penalty_Area")
colnames(EPLPlayerPassing1718Updated)[colnames(EPLPlayerPassing1718Updated) %in% c("Player", "Pos1", "Pos2", "Squad", "Born", "AstByPlayer", "KPAst", "PlayerTotalCmpPasses", "PlayerTotalAttPasses", "PlayerShortCmpPasses", "PlayerShortAttPasses", "PlayerMediumCmpPasses", "PlayerMediumAttPasses", "PlayerLongCmpPasses", "PlayerLongAttPasses", "Left", "Right", "FK", "ThroughBall", "CK", "Throwins", "PassesFinalThird", "PPA", "CrsPA")] <- c("Player_Name", "Position_1", "Position_2", "Team_Name", "Birth_Year", "Ast_By_Player", "Player_KP_Ast", "Player_Total_Cmp_Passes", "Player_Total_Att_Passes", "Player_Short_Cmp_Passes", "Player_Short_Att_Passes", "Player_Medium_Cmp_Passes", "Player_Medium_Att_Passes", "Player_Long_Cmp_Passes", "Player_Long_Att_Passes", "Player_Passes_Left_Foot", "Player_Passes_Right_Foot", "Player_Passes_Through_Ball","Player_Passes_FK", "Corner_Kicks", "Thrown_Ins", "Passes_Into_Final_Third", "Passes_Into_Penalty_Area", "Crosses_Into_Penalty_Area")

##PlayerMiscellaneous
colnames(EPLPlayerMiscellaneous1718Updated)[colnames(EPLPlayerMiscellaneous1718Updated) %in% c("Player", "Pos1", "Pos2", "Squad", "Born", "CrdY", "CrdR", "Fls", "Fld", "Off", "Int", "SuccDribbles", "AttDribbles", "SuccDribbledPast", "DribblesTkl", "DribblesAttTkl", "DribbledPastByOpp")]<-c("Player_Name", "Position_1", "Position_2", "Team_Name", "Birth_Year", "CrdY_By_Player", "CrdR_By_Player", "Fls_Committed", "Fld_Drawn", "Offside", "Interception", "Succ_Dribbles", "Att_Dribbles", "Succ_Players_Dribbled_Past", "Dribblers_Tkl", "Dribblers_Att_tkl", "Dribbled_Past_By_Opp")
colnames(EPLPlayerMiscellaneous1819Updated)[colnames(EPLPlayerMiscellaneous1819Updated) %in% c("Player", "Pos1", "Pos2", "Squad", "Born", "CrdY", "CrdR", "Fls", "Fld", "Off", "Int", "SuccDribbles", "AttDribbles", "SuccDribbledPast", "DribblesTkl", "DribblesAttTkl", "DribbledPastByOpp")]<-c("Player_Name", "Position_1", "Position_2", "Team_Name", "Birth_Year", "CrdY_By_Player", "CrdR_By_Player", "Fls_Committed", "Fld_Drawn", "Offside", "Interception", "Succ_Dribbles", "Att_Dribbles", "Succ_Players_Dribbled_Past", "Dribblers_Tkl", "Dribblers_Att_tkl", "Dribbled_Past_By_Opp")

##Joining Tables
library(dplyr)

#EPL League Table
EPLLeague<- rbind(EPLLeagueTable1718Updated, EPLLeagueTable1819Updated)

##EPL Player Miscellaneous
EPLPlayerMisc<- rbind(EPLPlayerMiscellaneous1718Updated, EPLPlayerMiscellaneous1819Updated)

#EPL Player Passing
EPLPlayerPassing<- rbind(EPLPlayerPassing1718Updated, EPLPlayerPassing1819Updated)

#EPL Player Shooting
EPLPlayerShooting<- rbind(EPLPlayerShooting1718Updated, EPLPlayerShooting1819Updated)

#EPL Player Standard
EPLPlayerStandard<- rbind(EPLPlayerStandard1718Updated, EPLPlayerStandard1819Updated)


##Removing Columns

#EPL League Table
EPLLeague = subset(EPLLeague, select = -c(xG, xGA, GDiff, xGDiff, xGDiff.90))
view(EPLLeague)

#EPL Player Standard
EPLPlayerStandard = subset(EPLPlayerStandard, select = -c(Rk, Gls90, Ast90, G.A, G.PK, G.A.PK, xG, npxG, xA, xG.1, xA.1, xG.xA, npxG.1, npxG.xA))

#EPL Player Shooting
EPLPlayerShooting = subset(EPLPlayerShooting, select = -c(Rk, Nation, Position_1, Position_2, Age, Birth_Year, X90s, Gls_By_Player, PK_By_Player, Pkatt_By_Player, SoT., Sh.90, SoT.90, G.SoT, xG, npxG, npxG.Sh, G.xG, np.G.xG, np.G.xG))
EPLPlayerShooting = subset(EPLPlayerShooting, select = -c(G.Sh))

#EPL PLayer Passing
EPLPlayerPassing = subset(EPLPlayerPassing, select = -c(Rk, Nation, Position_1, Position_2, Age, Birth_Year, X90s, Ast_By_Player, xA, A.xA, Cmp., Cmp..1, Cmp..2, Cmp..3))
view(EPLPlayerPassing)

#EPL Player Miscellaneous
EPLPlayerMisc = subset(EPLPlayerMisc, select = -c(Rk, Nation, Position_1, Position_2, Age, Birth_Year, X90s, CrdY_By_Player, CrdR_By_Player, Succ., Tkl.))

##Joining Tables
EPLMaster = left_join(EPLPlayerStandard, EPLPlayerShooting, by = c("Player_Name", "Team_Name", "Season_Year"))
view(EPLMaster)

EPLMaster2 = left_join(EPLMaster, EPLPlayerPassing, by= c("Player_Name", "Team_Name", "Season_Year"))
view(EPLMaster2)

EPLMaster3 = left_join(EPLMaster2, EPLPlayerMisc, by = c("Player_Name", "Team_Name", "Season_Year"))

EPLFinalMasterList = left_join(EPLMaster3, EPLLeague, by = c("Team_Name", "Season_Year"))
View(EPLFinalMasterList)

install.packages("stringr")
library(stringr)

#Removing Characters from columns (lower case to removed)
EPLFinalMasterList$Nation<- gsub("^.{0,3}", "", EPLFinalMasterList$Nation)
view(EPLFinalMasterList)

##Replaced all missing values with NA
EPLFinalMasterList[EPLFinalMasterList == ""] = NA

##Changing the data types of the columns
str(EPLFinalMasterList)
EPLFinalMasterList$Position_1<- as.character(EPLFinalMasterList$Position_1)
EPLFinalMasterList$Team_Name<- as.character(EPLFinalMasterList$Team_Name)
EPLFinalMasterList$Position_2<- as.character(EPLFinalMasterList$Position_2)

##Checking for duplicates
duplicated(EPLFinalMasterList$Player_Name)
EPLFinalMasterList$Player_Name[duplicated(EPLFinalMasterList$Player_Name)]

##Summary Statistics
summary(EPLFinalMasterList)

##Table Statistics
table(Nation)
table(EPLFinalMasterList$Team_Name)
table(EPLFinalMasterList$Position_1)
table(EPLFinalMasterList$Position_2)

##CALCULATING VARIANCE AND STANDARD DEVIATION OF EACH ATTRIBUTE
install.packages("plm")
library(plm)

##Age 
sd(EPLFinalMasterList$Age, na.rm= TRUE)
var(EPLFinalMasterList$Age, na.rm = TRUE)
##Matches Played by player
sd(EPLFinalMasterList$Matches_Played_By_Player, na.rm = TRUE)
var(EPLFinalMasterList$Matches_Played_By_Player, na.rm = TRUE)
##Player starts
sd(EPLFinalMasterList$Player_Starts, na.rm = TRUE)
var(EPLFinalMasterList$Player_Starts, na.rm = TRUE)
##Minutes played
sd(EPLFinalMasterList$Player_Minutes_Played, na.rm = TRUE)
var(EPLFinalMasterList$Player_Minutes_Played, na.rm = TRUE)
##Gls by player
sd(EPLFinalMasterList$Gls_By_Player, na.rm = TRUE)
var(EPLFinalMasterList$Gls_By_Player, na.rm= TRUE)
##Ast by player
sd(EPLFinalMasterList$Ast_By_Player, na.rm = TRUE)
var(EPLFinalMasterList$Ast_By_Player, na.rm = TRUE)
##Penalty Kicks
sd(EPLFinalMasterList$PK_By_Player, na.rm = TRUE)
var(EPLFinalMasterList$PK_By_Player, na.rm = TRUE)
##Pkatt
sd(EPLFinalMasterList$Pkatt_By_Player, na.rm = TRUE)
var(EPLFinalMasterList$Pkatt_By_Player, na.rm = TRUE)
##CrdY
sd(EPLFinalMasterList$CrdY_By_Player, na.rm = TRUE)
var(EPLFinalMasterList$CrdY_By_Player, na.rm = TRUE)
##CrdR
sd(EPLFinalMasterList$CrdR_By_Player, na.rm = TRUE)
var(EPLFinalMasterList$CrdR_By_Player, na.rm = TRUE)
##SH
sd(EPLFinalMasterList$Player_SH, na.rm = TRUE)
var(EPLFinalMasterList$Player_SH, na.rm = TRUE)
##SoT
sd(EPLFinalMasterList$Player_SoT, na.rm = TRUE)
var(EPLFinalMasterList$Player_SoT, na.rm = TRUE)
##FK
sd(EPLFinalMasterList$Player_FK, na.rm = TRUE)
var(EPLFinalMasterList$Player_FK, na.rm = TRUE)
##KP Ast
sd(EPLFinalMasterList$Player_KP_Ast, na.rm = TRUE)
var(EPLFinalMasterList$Player_KP_Ast, na.rm = TRUE)
##Total Cmp Passes
sd(EPLFinalMasterList$Player_Total_Cmp_Passes, na.rm = TRUE)
var(EPLFinalMasterList$Player_Total_Cmp_Passes, na.rm = TRUE)
##Total Att Passes
sd(EPLFinalMasterList$Player_Total_Att_Passes, na.rm = TRUE)
var(EPLFinalMasterList$Player_Total_Att_Passes, na.rm = TRUE)
##Short Cmp 
sd(EPLFinalMasterList$Player_Short_Cmp_Passes, na.rm = TRUE)
var(EPLFinalMasterList$Player_Short_Cmp_Passes, na.rm = TRUE)
##Short Att
sd(EPLFinalMasterList$Player_Short_Att_Passes, na.rm = TRUE)
var(EPLFinalMasterList$Player_Short_Att_Passes, na.rm = TRUE)
##Medium Cmp
sd(EPLFinalMasterList$Player_Medium_Cmp_Passes, na.rm = TRUE)
var(EPLFinalMasterList$Player_Medium_Cmp_Passes, na.rm = TRUE)
##Mediump Att
sd(EPLFinalMasterList$Player_Medium_Att_Passes, na.rm = TRUE)
var(EPLFinalMasterList$Player_Medium_Att_Passes, na.rm = TRUE)
##Long Cmp
sd(EPLFinalMasterList$Player_Long_Cmp_Passes, na.rm = TRUE)
var(EPLFinalMasterList$Player_Long_Cmp_Passes, na.rm = TRUE)
##Long Att
sd(EPLFinalMasterList$Player_Long_Att_Passes, na.rm = TRUE)
var(EPLFinalMasterList$Player_Long_Att_Passes, na.rm = TRUE)
##Left foot passes
sd(EPLFinalMasterList$Player_Passes_Left_Foot, na.rm = TRUE)
var(EPLFinalMasterList$Player_Passes_Left_Foot, na.rm = TRUE)
##Right foot passes
sd(EPLFinalMasterList$Player_Passes_Right_Foot, na.rm = TRUE)
var(EPLFinalMasterList$Player_Passes_Right_Foot, na.rm = TRUE)
## Through Balls
sd(EPLFinalMasterList$Player_Passes_Through_Ball, na.rm = TRUE)
var(EPLFinalMasterList$Player_Passes_Through_Ball, na.rm = TRUE)
##Fk
sd(EPLFinalMasterList$Player_FK, na.rm = TRUE)
var(EPLFinalMasterList$Player_FK, na.rm = TRUE)
##Corner Kicks
sd(EPLFinalMasterList$Corner_Kicks, na.rm = TRUE)
var(EPLFinalMasterList$Corner_Kicks, na.rm = TRUE)
##Throw ins
sd(EPLFinalMasterList$Thrown_Ins, na.rm = TRUE)
var(EPLFinalMasterList$Thrown_Ins, na.rm = TRUE)
##Passes into final third
sd(EPLFinalMasterList$Passes_Into_Final_Third, na.rm = TRUE)
var(EPLFinalMasterList$Passes_Into_Final_Third, na.rm = TRUE)
##Passes into penalty area
sd(EPLFinalMasterList$Passes_Into_Penalty_Area, na.rm = TRUE)
var(EPLFinalMasterList$Passes_Into_Penalty_Area, na.rm = TRUE)
##X2CrdY
sd(EPLFinalMasterList$X2CrdY, na.rm = TRUE)
var(EPLFinalMasterList$X2CrdY, na.rm = TRUE)
##Fls committed
sd(EPLFinalMasterList$Fls_Committed, na.rm = TRUE)
var(EPLFinalMasterList$Fls_Committed, na.rm = TRUE)
##Fld Drawn
sd(EPLFinalMasterList$Fld_Drawn, na.rm = TRUE)
var(EPLFinalMasterList$Fld_Drawn, na.rm = TRUE)
##Offside
sd(EPLFinalMasterList$Offside, na.rm = TRUE)
var(EPLFinalMasterList$Offside, na.rm = TRUE)
##Crosses
sd(EPLFinalMasterList$Crosses, na.rm = TRUE)
var(EPLFinalMasterList$Crosses, na.rm = TRUE)
##Tklw
sd(EPLFinalMasterList$TklW, na.rm = TRUE)
var(EPLFinalMasterList$TklW, na.rm = TRUE)
##Interceptions
sd(EPLFinalMasterList$Interception, na.rm = TRUE)
var(EPLFinalMasterList$Interception, na.rm = TRUE)
##PKwon
sd(EPLFinalMasterList$PKwon, na.rm = TRUE)
var(EPLFinalMasterList$PKwon, na.rm = TRUE)
##PKcon
sd(EPLFinalMasterList$PKcon, na.rm = TRUE)
var(EPLFinalMasterList$PKcon, na.rm = TRUE)
##OG
sd(EPLFinalMasterList$OG, na.rm = TRUE)
var(EPLFinalMasterList$OG, na.rm = TRUE)
##Succ_Dribbles
sd(EPLFinalMasterList$Succ_Dribbles, na.rm = TRUE)
var(EPLFinalMasterList$Succ_Dribbles, na.rm = TRUE)
##Att_Dribbles
sd(EPLFinalMasterList$Att_Dribbles, na.rm = TRUE)
var(EPLFinalMasterList$Att_Dribbles, na.rm = TRUE)
##Succ Players dribbled past
sd(EPLFinalMasterList$Succ_Players_Dribbled_Past, na.rm = TRUE)
var(EPLFinalMasterList$Succ_Players_Dribbled_Past, na.rm = TRUE)
## Nutmegs
sd(EPLFinalMasterList$Nutmegs, na.rm = TRUE)
var(EPLFinalMasterList$Nutmegs, na.rm = TRUE)
## Dribblers Tkl
sd(EPLFinalMasterList$Dribblers_Tkl, na.rm = TRUE)
var(EPLFinalMasterList$Dribblers_Tkl, na.rm = TRUE)
##Dribblers att tkl
sd(EPLFinalMasterList$Dribblers_Att_tkl, na.rm = TRUE)
var(EPLFinalMasterList$Dribblers_Att_tkl, na.rm = TRUE)
## Dribbled past by opp
sd(EPLFinalMasterList$Dribbled_Past_By_Opp, na.rm = TRUE)
var(EPLFinalMasterList$Dribbled_Past_By_Opp, na.rm = TRUE)
##Team Wins
sd(EPLFinalMasterList$Team_Wins, na.rm = TRUE)
var(EPLFinalMasterList$Team_Wins, na.rm = TRUE)
##Team Ties
sd(EPLFinalMasterList$Team_Ties, na.rm = TRUE)
var(EPLFinalMasterList$Team_Ties, na.rm = TRUE)
##Team Losses
sd(EPLFinalMasterList$Team_Losses, na.rm = TRUE)
var(EPLFinalMasterList$Team_Losses, na.rm = TRUE)
##Team GF
sd(EPLFinalMasterList$Team_GF, na.rm = TRUE)
var(EPLFinalMasterList$Team_GF, na.rm = TRUE)
##Team GA
sd(EPLFinalMasterList$Team_GA, na.rm = TRUE)
var(EPLFinalMasterList$Team_GA, na.rm = TRUE)

library("ggplot2")
library("dplyr")
library("RColorBrewer")
library("ggthemes")
library("ggrepel")
library("gridExtra")
library("reshape2")
library("data.table")
library("corrplot")
install.packages("tidyr")
library(tidyr)
library(ggplot2)
library(tidyquant)
install.packages("tidyquant")
library(dplyr)



##Attacking Performances of Player in 2017-18 and 2018-19 seasons
##Goals scored by players per game
Goals_Per_Game<- EPLFinalMasterList$Gls_By_Player/EPLFinalMasterList$Matches_Played_By_Player
Goals_Per_Game
plot(Goals_Per_Game)
summary(Goals_Per_Game)

##Assists by players per game
Ast_Per_Game<- EPLFinalMasterList$Ast_By_Player/EPLFinalMasterList$Matches_Played_By_Player
Ast_Per_Game
head(Ast_Per_90_Minutes)

##Goals and Assists by player per game
Goals_Assists_Per_Game<- (EPLFinalMasterList$Gls_By_Player + EPLFinalMasterList$Ast_By_Player)/ EPLFinalMasterList$Matches_Played_By_Player
Goals_Assists_Per_Game

##Goals, Penalty Kicks and Assists by players per game
Goals_PK_Assists_Per_Game<- (EPLFinalMasterList$Gls_By_Player + EPLFinalMasterList$PK_By_Player + EPLFinalMasterList$Ast_By_Player)/ EPLFinalMasterList$Matches_Played_By_Player
Goals_PK_Assists_Per_Game

##Shots by players per game
Shots_Per_game<- EPLFinalMasterList$Player_SH/EPLFinalMasterList$Matches_Played_By_Player
Shots_Per_game

##Goals per shots
Goals_Per_SH<- EPLFinalMasterList$Gls_By_Player/EPLFinalMasterList$Player_SH
Goals_Per_SH

##Goals per shot per game
Goals_Per_SH_Per_Game<- Goals_Per_SH/ EPLFinalMasterList$Matches_Played_By_Player
Goals_Per_SH_Per_Game

##Shots on Target by Players per game
SoT_Per_Game<- EPLFinalMasterList$Player_SoT/EPLFinalMasterList$Matches_Played_By_Player
SoT_Per_Game

##Percentage of total shots on target
Percentage_SoT<- EPLFinalMasterList$Player_SoT/EPLFinalMasterList$Player_SH
Percentage_SoT

##Percentage of Total Shots on Target Per Game
Percentage_SoT_Per_Game<- Percentage_SoT/EPLFinalMasterList$Matches_Played_By_Player
Percentage_SoT_Per_Game

##Goals per shots on target 
Goals_Per_SoT<- EPLFinalMasterList$Gls_By_Player/EPLFinalMasterList$Player_SoT
Goals_Per_SoT

##Goals Per shots on target per game
Goals_Per_SoT_Per_Game<- Goals_Per_SoT/EPLFinalMasterList$Matches_Played_By_Player
Goals_Per_SoT_Per_Game

##Free Kicks Per Game
FK_Per_Game<- EPLFinalMasterList$Player_FK/EPLFinalMasterList$Matches_Played_By_Player
FK_Per_Game

##Player Key Pass Assists Per Game
KP_Ast_Per_Game<- EPLFinalMasterList$Player_KP_Ast/EPLFinalMasterList$Matches_Played_By_Player
KP_Ast_Per_Game

##Total Pass Cmp Percentage
Total_Cmp_Passes_Percentage<- (EPLFinalMasterList$Player_Total_Cmp_Passes/EPLFinalMasterList$Player_Total_Att_Passes)*100
Total_Cmp_Passes_Percentage

##Short Pass Cmp Percentage
Short_Cmp_Passes_Percentage<- (EPLFinalMasterList$Player_Short_Cmp_Passes/EPLFinalMasterList$Player_Short_Att_Passes)*100
Short_Cmp_Passes_Percentage

##Medium Pass Cmp Percentage
Medium_Cmp_Passes_Percentage<- (EPLFinalMasterList$Player_Medium_Cmp_Passes/EPLFinalMasterList$Player_Medium_Att_Passes)*100
Medium_Cmp_Passes_Percentage

##Long Pass Cmp Percentage
Long_Cmp_Passes_Percentage<-(EPLFinalMasterList$Player_Long_Cmp_Passes/EPLFinalMasterList$Player_Long_Att_Passes)*100
Long_Cmp_Passes_Percentage
summary(Long_Cmp_Passes_Percentage)

## Corner Kicks
Corner_Kicks_Per_Game<- (EPLFinalMasterList$Corner_Kicks/EPLFinalMasterList$Matches_Played_By_Player)*100
Corner_Kicks_Per_Game

## Throw_Ins
Throw_Ins_Per_Game<- (EPLFinalMasterList$Thrown_Ins/EPLFinalMasterList$Matches_Played_By_Player)*100
Throw_Ins_Per_Game

##Passes into the final third
Passes_Into_Final_Third_Per_Game<- (EPLFinalMasterList$Passes_Into_Final_Third/EPLFinalMasterList$Matches_Played_By_Player)*100
Passes_Into_Final_Third_Per_Game

##Passes Into Penalty Area
Passes_Into_Penalty_Area_Per_Game<- (EPLFinalMasterList$Passes_Into_Penalty_Area/EPLFinalMasterList$Matches_Played_By_Player)*100
Passes_Into_Penalty_Area_Per_Game

##Crosses into Penalty Area
Crosses_Into_Penalty_Area_Per_Game<- (EPLFinalMasterList$Crosses_Into_Penalty_Area/EPLFinalMasterList$Matches_Played_By_Player)*100
Crosses_Into_Penalty_Area_Per_Game

##Penalty Kicks Won
Penalty_Kicks_Won_Per_Game<- (EPLFinalMasterList$PKwon/EPLFinalMasterList$Matches_Played_By_Player)*100
Penalty_Kicks_Won_Per_Game

##Successful Dribbles
Succ_Dribbles_Completed_Percentage<- (EPLFinalMasterList$Succ_Dribbles/EPLFinalMasterList$Att_Dribbles)*100
Succ_Dribbles_Completed_Percentage

##Successful players dribbled past per game
Succ_Players_Dribbled_Past_Per_Game<- (EPLFinalMasterList$Succ_Players_Dribbled_Past/EPLFinalMasterList$Matches_Played_By_Player)
Succ_Players_Dribbled_Past_Per_Game

##Number of penalty kicks scored
Penalty_Kicks_Scored_Per_Game<- (EPLFinalMasterList$PK_By_Player/EPLFinalMasterList$Matches_Played_By_Player)
Penalty_Kicks_Scored_Per_Game

##Percentage of penalty kicks completed
Penalty_kicks_Cmp_Percentage<- (EPLFinalMasterList$PK_By_Player/EPLFinalMasterList$Pkatt_By_Player)*100
Penalty_kicks_Cmp_Percentage

##Number of goals scored out of total number of goals scored by the team
Goals_Contribution_By_Player<- (EPLFinalMasterList$Gls_By_Player/EPLFinalMasterList$Team_GF)
Goals_Contribution_By_Player

##Number of Fouls drawn per game
Fouls_Drawn_Per_Game<- (EPLFinalMasterList$Fld_Drawn/EPLFinalMasterList$Matches_Played_By_Player)
Fouls_Drawn_Per_Game

##Defensive Performances
##Tackles won per game
Tackles_Won_Per_Game<- (EPLFinalMasterList$TklW/EPLFinalMasterList$Matches_Played_By_Player)

##Interceptions
Interceptions_Per_Game<- (EPLFinalMasterList$Interception/EPLFinalMasterList$Matches_Played_By_Player)

##Dribblers tackled
Dribblers_Tackled_Per_Game<- (EPLFinalMasterList$Dribblers_Tkl/EPLFinalMasterList$Matches_Played_By_Player)

##Dribbles attempted tackles
Dribblers_Tckl_Att_Per_Game<- (EPLFinalMasterList$Dribblers_Att_tkl/EPLFinalMasterList$Matches_Played_By_Player)

##Team Goal Differences
Goal_Difference<- (EPLFinalMasterList$Team_GF - EPLFinalMasterList$Team_GA)

##Affecting the team performance in a negative way
## Number of Yellow card per game
Yellow_Cards_Per_Game<- (EPLFinalMasterList$CrdY_By_Player/EPLFinalMasterList$Matches_Played_By_Player)
Yellow_Cards_Per_Game

##Red cards Per Game
Red_Cards_Per_Game<- (EPLFinalMasterList$CrdR_By_Player/EPLFinalMasterList$Matches_Played_By_Player)

## 2 yellow cards Per Game
Two_Yellow_Cards_Per_Game<- (EPLFinalMasterList$X2CrdY/EPLFinalMasterList$Matches_Played_By_Player)

## Fouls committed
Fouls_Committed_Per_Game<- (EPLFinalMasterList$Fls_Committed/EPLFinalMasterList$Matches_Played_By_Player)

##Offsides Per Game
Offsides_Per_Game<- (EPLFinalMasterList$Offside/EPLFinalMasterList$Matches_Played_By_Player)

##OG Per Game
OG_Per_Game<- (EPLFinalMasterList$OG/EPLFinalMasterList$Matches_Played_By_Player)

##Dribbled past by an opponent Per Game
Dribbled_Past_By_OPP_Per_Game<- (EPLFinalMasterList$Dribbled_Past_By_Opp/EPLFinalMasterList$Matches_Played_By_Player)


##Goals Scored Per Age in both seasons
plot(EPLFinalMasterList$Age, EPLFinalMasterList$Gls_By_Player, xlab = "Age", ylab = "Goals Scored", main = "Number of Goals Scored by Age Between 2017-19")

##EPL Season 2017-18
EPLLeague1718<- subset(EPLFinalMasterList, EPLFinalMasterList$Season_Year == "2017-18")
EPLLeague1718

##Gls Scored in 2017-18
plot(EPLLeague1718$Age, EPLLeague1718$Gls_By_Player, xlab = "Age", ylab = "Goals Scored", main = "Number of Goals Scored by Age in 2017-18")

##Arsenal 2017-18
Arsenal1718<- subset(EPLLeague1718, Team_Name=="Arsenal")
##Goals scored in 2017-18 
plot(Arsenal1718$Age, Arsenal1718$Gls_By_Player, xlab = "Age", ylab = "Goals Scored", main = "Number of Goals Scored by Age by Arsenal Players in 2017-18")

##Bournemouth 2017-18 
Bournemouth1718<- subset(EPLLeague1718, Team_Name=="Bournemouth")
##Goals Scored in 2017-18
plot(Bournemouth1718$Age, Bournemouth1718$Gls_By_Player, xlab = "Age", ylab = "Goals Scored", main = "Number of Goals Scored by Age by Bournemouth Players in 2017-18")

##Brighton 2017-18
Brighton1718<- subset(EPLLeague1718, Team_Name=="Brighton")
##Goals Scored in 2017-18
plot(Brighton1718$Age, Brighton1718$Gls_By_Player, xlab = "Age", ylab = "Goals Scored", main = "Number of Goals Scored by Age by Brighton Players in 2017-18")

##Burnley 2017-18
Burnley1718<- subset(EPLLeague1718, Team_Name=="Burnley")
##Goals Scored in 2017-18
plot(Burnley1718$Age, Burnley1718$Gls_By_Player, xlab = "Age", ylab = "Goals Scored", main = "Number of Goals Scored by Age by Burnely Players in 2017-18")

##Chelsea
Chelsea1718<- subset(EPLLeague1718, Team_Name=="Chelsea")
##Goals Scored in 2017-18
plot(Chelsea1718$Age, Chelsea1718$Gls_By_Player, xlab = "Age", ylab = "Goals Scored", main = "Number of Goals Scored by Age by Chelsea Players in 2017-18")

##Crystal Palace
CrystalPalace1718<- subset(EPLLeague1718, Team_Name=="Crystal Palace")
##Goals Scored in 2017-18
plot(CrystalPalace1718$Age, CrystalPalace1718$Gls_By_Player, xlab = "Age", ylab = "Goals Scored", main = "Number of Goals Scored by Age by Crystal Palace Players in 2017-18")

##Everton
Everton1718<- subset(EPLLeague1718, Team_Name=="Everton")
##Goals Scored in 2017-18
plot(Everton1718$Age, Everton1718$Gls_By_Player, xlab = "Age", ylab = "Goals Scored", main = "Number of Goals Scored by Age by Everton Players in 2017-18")

##Huddersfield
Huddersfield1718<- subset(EPLLeague1718, Team_Name=="Huddersfield")
##Goals Scored in 2017-18
plot(Huddersfield1718$Age, Huddersfield1718$Gls_By_Player, xlab = "Age", ylab = "Goals Scored", main = "Number of Goals Scored by Age by Huddersfield Players in 2017-18")

##Leicester City
LeicesterCity1718<- subset(EPLLeague1718, Team_Name=="Leicester City")
##Goals Scored in 2017-18
plot(LeicesterCity1718$Age, LeicesterCity1718$Gls_By_Player, xlab = "Age", ylab = "Goals Scored", main = "Number of Goals Scored by Age by Leicester City Players in 2017-18")

##Liverpool
Liverpool1718<- subset(EPLLeague1718, Team_Name=="Liverpool")
##Goals Scored by in 2017-18
plot(Liverpool1718$Age, Liverpool1718$Gls_By_Player, xlab = "Age", ylab = "Goals Scored", main = "Number of Goals Scored by Age by Liverpool Players in 2017-18")

##Manchester City
ManchesterCity1718<- subset(EPLLeague1718, Team_Name=="Manchester City")
##Goals Scored by in 2017-18
plot(ManchesterCity1718$Age, ManchesterCity1718$Gls_By_Player, xlab = "Age", ylab = "Goals Scored", main = "Number of Goals Scored by Age by Manchester City Players in 2017-18")

##Manchester United
ManchesterUtd1718<- subset(EPLLeague1718, Team_Name=="Manchester Utd")
##Goals Scored by in 2017-18
plot(ManchesterUtd1718$Age, ManchesterUtd1718$Gls_By_Player,xlab = "Age", ylab = "Goals Scored", main = "Number of Goals Scored by Age by Manchester United Players in 2017-18")

##Newcastle United
NewcastleUnited1718<- subset(EPLLeague1718, Team_Name=="Newcastle Utd")
##Goals Scored by in 2017-18
plot(NewcastleUnited1718$Age, NewcastleUnited1718$Gls_By_Player, xlab = "Age", ylab = "Goals Scored", main = "Number of Goals Scored by Age by Newcastle United Players in 2017-18")

##Southampton
Southampton1718<- subset(EPLLeague1718, Team_Name=="Southampton")
##Goals Scored by in 2017-18
plot(Southampton1718$Age, Southampton1718$Gls_By_Player, xlab = "Age", ylab = "Goals Scored", main = "Number of Goals Scored by Age by Southampton Players in 2017-18")

##Stoke City
Stokecity1718<- subset(EPLLeague1718, Team_Name=="Stoke City")
##Goals Scored by in 2017-18
plot(Stokecity1718$Age, Stokecity1718$Gls_By_Player, xlab = "Age", ylab = "Goals Scored", main = "Number of Goals Scored by Age by Stoke City Players in 2017-18")

##Swansea City
SwanseaCity1718<- subset(EPLLeague1718, Team_Name=="Swansea City")
##Goals Scored by in 2017-18
plot(SwanseaCity1718$Age, SwanseaCity1718$Gls_By_Player, xlab = "Age", ylab = "Goals Scored", main = "Number of Goals Scored by Age by Swansea City Players in 2017-18")

##Tottenham Hotspur
Tottenham1718<- subset(EPLLeague1718, Team_Name=="Tottenham")
##Goals Scored by in 2017-18
plot(Tottenham1718$Age, Tottenham1718$Gls_By_Player, xlab = "Age", ylab = "Goals Scored", main = "Number of Goals Scored by Age by Tottenham Players in 2017-18")

##Watford
Watford1718<- subset(EPLLeague1718, Team_Name=="Watford")
##Goals Scored by in 2017-18
plot(Watford1718$Age, Watford1718$Gls_By_Player, xlab = "Age", ylab = "Goals Scored", main = "Number of Goals Scored by Age by Watford Players in 2017-18")

##West BromWich Albion
WestBrom1718<- subset(EPLLeague1718, Team_Name=="West Brom")
##Goals Scored by in 2017-18
plot(WestBrom1718$Age, WestBrom1718$Gls_By_Player, xlab = "Age", ylab = "Goals Scored", main = "Number of Goals Scored by Age by West Brom Players in 2017-18")

##West Ham United
WestHam1718<- subset(EPLLeague1718, Team_Name=="West Ham")
##Goals Scored in 2017-18
plot(WestHam1718$Age, WestHam1718$Gls_By_Player, xlab = "Age", ylab = "Goals Scored", main = "Number of Goals Scored by Age by West Ham Players in 2017-18")
##Assits in 2017-18
plot(WestHam1718$Age, WestHam1718$Ast_By_Player, xlab = "Age", ylab = "Assists", main = "Number of Assists by Age by West Ham Players in 2017-18", las= 1)

## English Premier League 2018-19
EPLLeague1819<- subset(EPLFinalMasterList, EPLFinalMasterList$Season_Year == "2018-19")
EPLLeague1819
View(EPLLeague1819)

##Arsenal 
Arsenal1819<- subset(EPLLeague1819, Team_Name=="Arsenal")

##Bournemouth 
Bournemouth1819<- subset(EPLLeague1819, Team_Name=="Bournemouth")

##Brighton 
Brighton1819<- subset(EPLLeague1819, Team_Name=="Brighton")

##Burnley 
Burnley1819<- subset(EPLLeague1819, Team_Name=="Burnley")

##Cardiff City
CardiffCity1819<- subset(EPLLeague1819, Team_Name== "Cardiff City")

##Chelsea
Chelsea1819<- subset(EPLLeague1819, Team_Name=="Chelsea")

##Crystal Palace
CrystalPalace1819<- subset(EPLLeague1819, Team_Name=="Crystal Palace")

##Everton
Everton1819<- subset(EPLLeague1819, Team_Name=="Everton")

##Fulham
Fulham1819<- subset(EPLLeague1819, Team_Name =="Fulham")

##Huddersfield
Huddersfield1819<- subset(EPLLeague1819, Team_Name=="Huddersfield")

##Leicester City
LeicesterCity1819<- subset(EPLLeague1819, Team_Name=="Leicester City")

##Liverpool
Liverpool1819<- subset(EPLLeague1819, Team_Name=="Liverpool")

##Manchester City
ManchesterCity1819<- subset(EPLLeague1819, Team_Name=="Manchester City")

##Manchester United
ManchesterUtd1819<- subset(EPLLeague1819, Team_Name=="Manchester Utd")

##Newcastle United
NewcastleUnited1819<- subset(EPLLeague1819, Team_Name=="Newcastle Utd")

##Southampton
Southampton1819<- subset(EPLLeague1819, Team_Name=="Southampton")

##Tottenham Hotspur
Tottenham1819<- subset(EPLLeague1819, Team_Name=="Tottenham")

##Watford
Watford1819<- subset(EPLLeague1819, Team_Name=="Watford")

##West Ham United
WestHam1819<- subset(EPLLeague1819, Team_Name=="West Ham")

##Wolverhampton
Wolves1819<- subset(EPLLeague1819, Team_Name=="Wolves")

##Goals Scored in 2018-19
plot(EPLLeague1819$Age, EPLLeague1819$Gls_By_Player, xlab = "Age", ylab = "Goals Scored", main = "Number of Goals scored by Age in 2018-19")

##Goals Scored by Arsenal Players 2018-19
EPLLeague1819Arsenal<- subset(EPLLeague1819, Team_Name == "Arsenal")
head(EPLLeague1819Arsenal)
View(EPLLeague1819Arsenal)
plot(EPLLeague1819Arsenal$Age, EPLLeague1819Arsenal$Gls_By_Player, xlab = "Age", ylab = "Goals Scored", main = "Number of Goals Scored by Age by Arsenal Players in 2018-19")

##Assists Per Age
plot(EPLFinalMasterList$Age, EPLFinalMasterList$Ast_By_Player)

##Key Pass Ast per Age
plot(EPLFinalMasterList$Age, EPLFinalMasterList$Player_KP_Ast)

##EXPORTING THE DATASET
write.table(EPLFinalMasterList, file = "EPLFinalMasterList.csv", row.names=F, sep = ",")
str(EPLFinalMasterList)

##CORRELATION BETWEEN ATTRIBUTES of the players
install.packages("corrplot")
library(corrplot)


##Arsenal
##Attacking
cor.test(Arsenal1718$Age, Arsenal1718$Gls_By_Player)
cor.test(Arsenal1718$Age, Arsenal1718$PK_By_Player)
cor.test(Arsenal1718$Age, Arsenal1718$Player_SH)
cor.test(Arsenal1718$Age, Arsenal1718$Player_SoT)
cor.test(Arsenal1718$Age, Arsenal1718$Player_FK)
cor.test(Arsenal1718$Age, Arsenal1718$Passes_Into_Final_Third)
cor.test(Arsenal1718$Age, Arsenal1718$Passes_Into_Penalty_Area)
cor.test(Arsenal1718$Age, Arsenal1718$Crosses_Into_Penalty_Area)
cor.test(Arsenal1718$Age, Arsenal1718$Succ_Dribbles)
cor.test(Arsenal1718$Age, Arsenal1718$Succ_Players_Dribbled_Past)

cor.test(Arsenal1819$Age, Arsenal1819$Gls_By_Player)
cor.test(Arsenal1819$Age, Arsenal1819$PK_By_Player)
cor.test(Arsenal1819$Age, Arsenal1819$Player_SH)
cor.test(Arsenal1819$Age, Arsenal1819$Player_SoT)
cor.test(Arsenal1819$Age, Arsenal1819$Player_FK)
cor.test(Arsenal1819$Age, Arsenal1819$Passes_Into_Final_Third)
cor.test(Arsenal1819$Age, Arsenal1819$Passes_Into_Penalty_Area)
cor.test(Arsenal1819$Age, Arsenal1819$Crosses_Into_Penalty_Area)
cor.test(Arsenal1819$Age, Arsenal1819$Succ_Dribbles)
cor.test(Arsenal1819$Age, Arsenal1819$Succ_Players_Dribbled_Past)

sum(Arsenal1718$Gls_By_Player, na.rm = TRUE)
sum(Arsenal1718$PK_By_Player, na.rm = TRUE)
sum(Arsenal1718$Player_SH, na.rm = TRUE)
sum(Arsenal1718$Player_SoT, na.rm = TRUE)
sum(Arsenal1718$Player_FK, na.rm = TRUE)
sum(Arsenal1718$Passes_Into_Final_Third, na.rm = TRUE)
sum(Arsenal1718$Passes_Into_Penalty_Area, na.rm = TRUE)
sum(Arsenal1718$Crosses_Into_Penalty_Area, na.rm = TRUE)
sum(Arsenal1718$Succ_Dribbles, na.rm = TRUE)
sum(Arsenal1718$Succ_Players_Dribbled_Past, na.rm = TRUE)

sum(Arsenal1819$Gls_By_Player, na.rm = TRUE)
sum(Arsenal1819$PK_By_Player, na.rm = TRUE)
sum(Arsenal1819$Player_SH, na.rm = TRUE)
sum(Arsenal1819$Player_SoT, na.rm = TRUE)
sum(Arsenal1819$Player_FK, na.rm = TRUE)
sum(Arsenal1819$Passes_Into_Final_Third, na.rm = TRUE)
sum(Arsenal1819$Passes_Into_Penalty_Area, na.rm = TRUE)
sum(Arsenal1819$Crosses_Into_Penalty_Area, na.rm = TRUE)
sum(Arsenal1819$Succ_Dribbles, na.rm = TRUE)
sum(Arsenal1819$Succ_Players_Dribbled_Past, na.rm = TRUE)


##Defending
cor.test(Arsenal1718$Age, Arsenal1718$TklW)
cor.test(Arsenal1718$Age, Arsenal1718$Interception)
cor.test(Arsenal1718$Age, Arsenal1718$Dribblers_Tkl)
cor.test(Arsenal1718$Age, Arsenal1718$Dribblers_Att_tkl)
cor.test(Arsenal1718$Age, Arsenal1718$Fls_Committed)
cor.test(Arsenal1718$Age, Arsenal1718$Dribbled_Past_By_Opp)

cor.test(Arsenal1819$Age, Arsenal1819$TklW)
cor.test(Arsenal1819$Age, Arsenal1819$Interception)
cor.test(Arsenal1819$Age, Arsenal1819$Dribblers_Tkl)
cor.test(Arsenal1819$Age, Arsenal1819$Dribblers_Att_tkl)
cor.test(Arsenal1819$Age, Arsenal1819$Fls_Committed)
cor.test(Arsenal1819$Age, Arsenal1819$Dribbled_Past_By_Opp)

sum(Arsenal1718$TklW, na.rm = TRUE)
sum(Arsenal1718$Interception, na.rm = TRUE)
sum(Arsenal1718$Dribblers_Tkl, na.rm = TRUE)
sum(Arsenal1718$Dribblers_Att_tkl, na.rm = TRUE)
sum(Arsenal1718$Fls_Committed, na.rm = TRUE)
sum(Arsenal1718$Dribbled_Past_By_Opp, na.rm = TRUE)

sum(Arsenal1819$TklW, na.rm = TRUE)
sum(Arsenal1819$Interception, na.rm = TRUE)
sum(Arsenal1819$Dribblers_Tkl, na.rm = TRUE)
sum(Arsenal1819$Dribblers_Att_tkl, na.rm = TRUE)
sum(Arsenal1819$Fls_Committed, na.rm = TRUE)
sum(Arsenal1819$Dribbled_Past_By_Opp, na.rm = TRUE)

##Team Play
cor.test(Arsenal1718$Age, Arsenal1718$Ast_By_Player)
cor.test(Arsenal1718$Age, Arsenal1718$Player_KP_Ast)
cor.test(Arsenal1718$Age, Arsenal1718$Player_Total_Cmp_Passes)
cor.test(Arsenal1718$Age, Arsenal1718$Player_Short_Cmp_Passes)
cor.test(Arsenal1718$Age, Arsenal1718$Player_Medium_Cmp_Passes)
cor.test(Arsenal1718$Age, Arsenal1718$Player_Long_Cmp_Passes)
cor.test(Arsenal1718$Age, Arsenal1718$Player_Passes_Through_Ball)
cor.test(Arsenal1718$Age, Arsenal1718$Player_Passes_FK)
cor.test(Arsenal1718$Age, Arsenal1718$Crosses)


cor.test(Arsenal1819$Age, Arsenal1819$Ast_By_Player)
cor.test(Arsenal1819$Age, Arsenal1819$Player_KP_Ast)
cor.test(Arsenal1819$Age, Arsenal1819$Player_Total_Cmp_Passes)
cor.test(Arsenal1819$Age, Arsenal1819$Player_Short_Cmp_Passes)
cor.test(Arsenal1819$Age, Arsenal1819$Player_Medium_Cmp_Passes)
cor.test(Arsenal1819$Age, Arsenal1819$Player_Long_Cmp_Passes)
cor.test(Arsenal1819$Age, Arsenal1819$Player_Passes_Through_Ball)
cor.test(Arsenal1819$Age, Arsenal1819$Player_Passes_FK)
cor.test(Arsenal1819$Age, Arsenal1819$Crosses)

sum(Arsenal1718$Ast_By_Player, na.rm = TRUE)
sum(Arsenal1718$Player_KP_Ast, na.rm = TRUE)
sum(Arsenal1718$Player_Total_Cmp_Passes, na.rm = TRUE)
sum(Arsenal1718$Player_Short_Cmp_Passes, na.rm = TRUE)
sum(Arsenal1718$Player_Medium_Cmp_Passes, na.rm = TRUE)
sum(Arsenal1718$Player_Long_Cmp_Passes, na.rm = TRUE)
sum(Arsenal1718$Player_Passes_Through_Ball, na.rm = TRUE)
sum(Arsenal1718$Player_Passes_FK, na.rm = TRUE)
sum(Arsenal1718$Crosses, na.rm = TRUE)

sum(Arsenal1819$Ast_By_Player, na.rm = TRUE)
sum(Arsenal1819$Player_KP_Ast, na.rm = TRUE)
sum(Arsenal1819$Player_Total_Cmp_Passes, na.rm = TRUE)
sum(Arsenal1819$Player_Short_Cmp_Passes, na.rm = TRUE)
sum(Arsenal1819$Player_Medium_Cmp_Passes, na.rm = TRUE)
sum(Arsenal1819$Player_Long_Cmp_Passes, na.rm = TRUE)
sum(Arsenal1819$Player_Passes_Through_Ball, na.rm = TRUE)
sum(Arsenal1819$Player_Passes_FK, na.rm = TRUE)
sum(Arsenal1819$Crosses, na.rm = TRUE)

##Manchester City
##Attacking
cor.test(ManchesterCity1718$Age, ManchesterCity1718$Gls_By_Player)
cor.test(ManchesterCity1718$Age, ManchesterCity1718$PK_By_Player)
cor.test(ManchesterCity1718$Age, ManchesterCity1718$Player_SH)
cor.test(ManchesterCity1718$Age, ManchesterCity1718$Player_SoT)
cor.test(ManchesterCity1718$Age, ManchesterCity1718$Player_FK)
cor.test(ManchesterCity1718$Age, ManchesterCity1718$Passes_Into_Final_Third)
cor.test(ManchesterCity1718$Age, ManchesterCity1718$Passes_Into_Penalty_Area)
cor.test(ManchesterCity1718$Age, ManchesterCity1718$Crosses_Into_Penalty_Area)
cor.test(ManchesterCity1718$Age, ManchesterCity1718$Succ_Dribbles)
cor.test(ManchesterCity1718$Age, ManchesterCity1718$Succ_Players_Dribbled_Past)

cor.test(ManchesterCity1819$Age, ManchesterCity1819$Gls_By_Player)
cor.test(ManchesterCity1819$Age, ManchesterCity1819$PK_By_Player)
cor.test(ManchesterCity1819$Age, ManchesterCity1819$Player_SH)
cor.test(ManchesterCity1819$Age, ManchesterCity1819$Player_SoT)
cor.test(ManchesterCity1819$Age, ManchesterCity1819$Player_FK)
cor.test(ManchesterCity1819$Age, ManchesterCity1819$Passes_Into_Final_Third)
cor.test(ManchesterCity1819$Age, ManchesterCity1819$Passes_Into_Penalty_Area)
cor.test(ManchesterCity1819$Age, ManchesterCity1819$Crosses_Into_Penalty_Area)
cor.test(ManchesterCity1819$Age, ManchesterCity1819$Succ_Dribbles)
cor.test(ManchesterCity1819$Age, ManchesterCity1819$Succ_Players_Dribbled_Past)

sum(ManchesterCity1718$Gls_By_Player, na.rm = TRUE)
sum(ManchesterCity1718$PK_By_Player, na.rm = TRUE)
sum(ManchesterCity1718$Player_SH, na.rm = TRUE)
sum(ManchesterCity1718$Player_SoT, na.rm = TRUE)
sum(ManchesterCity1718$Player_FK, na.rm = TRUE)
sum(ManchesterCity1718$Passes_Into_Final_Third, na.rm = TRUE)
sum(ManchesterCity1718$Passes_Into_Penalty_Area, na.rm = TRUE)
sum(ManchesterCity1718$Crosses_Into_Penalty_Area, na.rm = TRUE)
sum(ManchesterCity1718$Succ_Dribbles, na.rm = TRUE)
sum(ManchesterCity1718$Succ_Players_Dribbled_Past, na.rm = TRUE)

sum(ManchesterCity1819$Gls_By_Player, na.rm = TRUE)
sum(ManchesterCity1819$PK_By_Player, na.rm = TRUE)
sum(ManchesterCity1819$Player_SH, na.rm = TRUE)
sum(ManchesterCity1819$Player_SoT, na.rm = TRUE)
sum(ManchesterCity1819$Player_FK, na.rm = TRUE)
sum(ManchesterCity1819$Passes_Into_Final_Third, na.rm = TRUE)
sum(ManchesterCity1819$Passes_Into_Penalty_Area, na.rm = TRUE)
sum(ManchesterCity1819$Crosses_Into_Penalty_Area, na.rm = TRUE)
sum(ManchesterCity1819$Succ_Dribbles, na.rm = TRUE)
sum(ManchesterCity1819$Succ_Players_Dribbled_Past, na.rm = TRUE)


##Defending
cor.test(ManchesterCity1718$Age, ManchesterCity1718$TklW)
cor.test(ManchesterCity1718$Age, ManchesterCity1718$Interception)
cor.test(ManchesterCity1718$Age, ManchesterCity1718$Dribblers_Tkl)
cor.test(ManchesterCity1718$Age, ManchesterCity1718$Dribblers_Att_tkl)
cor.test(ManchesterCity1718$Age, ManchesterCity1718$Fls_Committed)
cor.test(ManchesterCity1718$Age, ManchesterCity1718$Dribbled_Past_By_Opp)

cor.test(ManchesterCity1819$Age, ManchesterCity1819$TklW)
cor.test(ManchesterCity1819$Age, ManchesterCity1819$Interception)
cor.test(ManchesterCity1819$Age, ManchesterCity1819$Dribblers_Tkl)
cor.test(ManchesterCity1819$Age, ManchesterCity1819$Dribblers_Att_tkl)
cor.test(ManchesterCity1819$Age, ManchesterCity1819$Fls_Committed)
cor.test(ManchesterCity1819$Age, ManchesterCity1819$Dribbled_Past_By_Opp)

sum(ManchesterCity1718$TklW, na.rm = TRUE)
sum(ManchesterCity1718$Interception, na.rm = TRUE)
sum(ManchesterCity1718$Dribblers_Tkl, na.rm = TRUE)
sum(ManchesterCity1718$Dribblers_Att_tkl, na.rm = TRUE)
sum(ManchesterCity1718$Fls_Committed, na.rm = TRUE)
sum(ManchesterCity1718$Dribbled_Past_By_Opp, na.rm = TRUE)

sum(ManchesterCity1819$TklW, na.rm = TRUE)
sum(ManchesterCity1819$Interception, na.rm = TRUE)
sum(ManchesterCity1819$Dribblers_Tkl, na.rm = TRUE)
sum(ManchesterCity1819$Dribblers_Att_tkl, na.rm = TRUE)
sum(ManchesterCity1819$Fls_Committed, na.rm = TRUE)
sum(ManchesterCity1819$Dribbled_Past_By_Opp, na.rm = TRUE)

##Team Play
cor.test(ManchesterCity1718$Age, ManchesterCity1718$Ast_By_Player)
cor.test(ManchesterCity1718$Age, ManchesterCity1718$Player_KP_Ast)
cor.test(ManchesterCity1718$Age, ManchesterCity1718$Player_Total_Cmp_Passes)
cor.test(ManchesterCity1718$Age, ManchesterCity1718$Player_Short_Cmp_Passes)
cor.test(ManchesterCity1718$Age, ManchesterCity1718$Player_Medium_Cmp_Passes)
cor.test(ManchesterCity1718$Age, ManchesterCity1718$Player_Long_Cmp_Passes)
cor.test(ManchesterCity1718$Age, ManchesterCity1718$Player_Passes_Through_Ball)
cor.test(ManchesterCity1718$Age, ManchesterCity1718$Player_Passes_FK)
cor.test(ManchesterCity1718$Age, ManchesterCity1718$Crosses)


cor.test(ManchesterCity1819$Age, ManchesterCity1819$Ast_By_Player)
cor.test(ManchesterCity1819$Age, ManchesterCity1819$Player_KP_Ast)
cor.test(ManchesterCity1819$Age, ManchesterCity1819$Player_Total_Cmp_Passes)
cor.test(ManchesterCity1819$Age, ManchesterCity1819$Player_Short_Cmp_Passes)
cor.test(ManchesterCity1819$Age, ManchesterCity1819$Player_Medium_Cmp_Passes)
cor.test(ManchesterCity1819$Age, ManchesterCity1819$Player_Long_Cmp_Passes)
cor.test(ManchesterCity1819$Age, ManchesterCity1819$Player_Passes_Through_Ball)
cor.test(ManchesterCity1819$Age, ManchesterCity1819$Player_Passes_FK)
cor.test(ManchesterCity1819$Age, ManchesterCity1819$Crosses)

sum(ManchesterCity1718$Ast_By_Player, na.rm = TRUE)
sum(ManchesterCity1718$Player_KP_Ast, na.rm = TRUE)
sum(ManchesterCity1718$Player_Total_Cmp_Passes, na.rm = TRUE)
sum(ManchesterCity1718$Player_Short_Cmp_Passes, na.rm = TRUE)
sum(ManchesterCity1718$Player_Medium_Cmp_Passes, na.rm = TRUE)
sum(ManchesterCity1718$Player_Long_Cmp_Passes, na.rm = TRUE)
sum(ManchesterCity1718$Player_Passes_Through_Ball, na.rm = TRUE)
sum(ManchesterCity1718$Player_Passes_FK, na.rm = TRUE)
sum(ManchesterCity1718$Crosses, na.rm = TRUE)

sum(ManchesterCity1819$Ast_By_Player, na.rm = TRUE)
sum(ManchesterCity1819$Player_KP_Ast, na.rm = TRUE)
sum(ManchesterCity1819$Player_Total_Cmp_Passes, na.rm = TRUE)
sum(ManchesterCity1819$Player_Short_Cmp_Passes, na.rm = TRUE)
sum(ManchesterCity1819$Player_Medium_Cmp_Passes, na.rm = TRUE)
sum(ManchesterCity1819$Player_Long_Cmp_Passes, na.rm = TRUE)
sum(ManchesterCity1819$Player_Passes_Through_Ball, na.rm = TRUE)
sum(ManchesterCity1819$Player_Passes_FK, na.rm = TRUE)
sum(ManchesterCity1819$Crosses, na.rm = TRUE)

##Manchester United
##Attacking
cor.test(ManchesterUtd1718$Age, ManchesterUtd1718$Gls_By_Player)
cor.test(ManchesterUtd1718$Age, ManchesterUtd1718$PK_By_Player)
cor.test(ManchesterUtd1718$Age, ManchesterUtd1718$Player_SH)
cor.test(ManchesterUtd1718$Age, ManchesterUtd1718$Player_SoT)
cor.test(ManchesterUtd1718$Age, ManchesterUtd1718$Player_FK)
cor.test(ManchesterUtd1718$Age, ManchesterUtd1718$Passes_Into_Final_Third)
cor.test(ManchesterUtd1718$Age, ManchesterUtd1718$Passes_Into_Penalty_Area)
cor.test(ManchesterUtd1718$Age, ManchesterUtd1718$Crosses_Into_Penalty_Area)
cor.test(ManchesterUtd1718$Age, ManchesterUtd1718$Succ_Dribbles)
cor.test(ManchesterUtd1718$Age, ManchesterUtd1718$Succ_Players_Dribbled_Past)

cor.test(ManchesterUtd1819$Age, ManchesterUtd1819$Gls_By_Player)
cor.test(ManchesterUtd1819$Age, ManchesterUtd1819$PK_By_Player)
cor.test(ManchesterUtd1819$Age, ManchesterUtd1819$Player_SH)
cor.test(ManchesterUtd1819$Age, ManchesterUtd1819$Player_SoT)
cor.test(ManchesterUtd1819$Age, ManchesterUtd1819$Player_FK)
cor.test(ManchesterUtd1819$Age, ManchesterUtd1819$Passes_Into_Final_Third)
cor.test(ManchesterUtd1819$Age, ManchesterUtd1819$Passes_Into_Penalty_Area)
cor.test(ManchesterUtd1819$Age, ManchesterUtd1819$Crosses_Into_Penalty_Area)
cor.test(ManchesterUtd1819$Age, ManchesterUtd1819$Succ_Dribbles)
cor.test(ManchesterUtd1819$Age, ManchesterUtd1819$Succ_Players_Dribbled_Past)

sum(ManchesterUtd1718$Gls_By_Player, na.rm = TRUE)
sum(ManchesterUtd1718$PK_By_Player, na.rm = TRUE)
sum(ManchesterUtd1718$Player_SH, na.rm = TRUE)
sum(ManchesterUtd1718$Player_SoT, na.rm = TRUE)
sum(ManchesterUtd1718$Player_FK, na.rm = TRUE)
sum(ManchesterUtd1718$Passes_Into_Final_Third, na.rm = TRUE)
sum(ManchesterUtd1718$Passes_Into_Penalty_Area, na.rm = TRUE)
sum(ManchesterUtd1718$Crosses_Into_Penalty_Area, na.rm = TRUE)
sum(ManchesterUtd1718$Succ_Dribbles, na.rm = TRUE)
sum(ManchesterUtd1718$Succ_Players_Dribbled_Past, na.rm = TRUE)

sum(ManchesterUtd1819$Gls_By_Player, na.rm = TRUE)
sum(ManchesterUtd1819$PK_By_Player, na.rm = TRUE)
sum(ManchesterUtd1819$Player_SH, na.rm = TRUE)
sum(ManchesterUtd1819$Player_SoT, na.rm = TRUE)
sum(ManchesterUtd1819$Player_FK, na.rm = TRUE)
sum(ManchesterUtd1819$Passes_Into_Final_Third, na.rm = TRUE)
sum(ManchesterUtd1819$Passes_Into_Penalty_Area, na.rm = TRUE)
sum(ManchesterUtd1819$Crosses_Into_Penalty_Area, na.rm = TRUE)
sum(ManchesterUtd1819$Succ_Dribbles, na.rm = TRUE)
sum(ManchesterUtd1819$Succ_Players_Dribbled_Past, na.rm = TRUE)

##Defending
cor.test(ManchesterUtd1718$Age, ManchesterUtd1718$TklW)
cor.test(ManchesterUtd1718$Age, ManchesterUtd1718$Interception)
cor.test(ManchesterUtd1718$Age, ManchesterUtd1718$Dribblers_Tkl)
cor.test(ManchesterUtd1718$Age, ManchesterUtd1718$Dribblers_Att_tkl)
cor.test(ManchesterUtd1718$Age, ManchesterUtd1718$Fls_Committed)
cor.test(ManchesterUtd1718$Age, ManchesterUtd1718$Dribbled_Past_By_Opp)

cor.test(ManchesterUtd1819$Age, ManchesterUtd1819$TklW)
cor.test(ManchesterUtd1819$Age, ManchesterUtd1819$Interception)
cor.test(ManchesterUtd1819$Age, ManchesterUtd1819$Dribblers_Tkl)
cor.test(ManchesterUtd1819$Age, ManchesterUtd1819$Dribblers_Att_tkl)
cor.test(ManchesterUtd1819$Age, ManchesterUtd1819$Fls_Committed)
cor.test(ManchesterUtd1819$Age, ManchesterUtd1819$Dribbled_Past_By_Opp)

sum(ManchesterUtd1718$TklW, na.rm = TRUE)
sum(ManchesterUtd1718$Interception, na.rm = TRUE)
sum(ManchesterUtd1718$Dribblers_Tkl, na.rm = TRUE)
sum(ManchesterUtd1718$Dribblers_Att_tkl, na.rm = TRUE)
sum(ManchesterUtd1718$Fls_Committed, na.rm = TRUE)
sum(ManchesterUtd1718$Dribbled_Past_By_Opp, na.rm = TRUE)

sum(ManchesterUtd1819$TklW, na.rm = TRUE)
sum(ManchesterUtd1819$Interception, na.rm = TRUE)
sum(ManchesterUtd1819$Dribblers_Tkl, na.rm = TRUE)
sum(ManchesterUtd1819$Dribblers_Att_tkl, na.rm = TRUE)
sum(ManchesterUtd1819$Fls_Committed, na.rm = TRUE)
sum(ManchesterUtd1819$Dribbled_Past_By_Opp, na.rm = TRUE)

##Team Play
cor.test(ManchesterUtd1718$Age, ManchesterUtd1718$Ast_By_Player)
cor.test(ManchesterUtd1718$Age, ManchesterUtd1718$Player_KP_Ast)
cor.test(ManchesterUtd1718$Age, ManchesterUtd1718$Player_Total_Cmp_Passes)
cor.test(ManchesterUtd1718$Age, ManchesterUtd1718$Player_Short_Cmp_Passes)
cor.test(ManchesterUtd1718$Age, ManchesterUtd1718$Player_Medium_Cmp_Passes)
cor.test(ManchesterUtd1718$Age, ManchesterUtd1718$Player_Long_Cmp_Passes)
cor.test(ManchesterUtd1718$Age, ManchesterUtd1718$Player_Passes_Through_Ball)
cor.test(ManchesterUtd1718$Age, ManchesterUtd1718$Player_Passes_FK)
cor.test(ManchesterUtd1718$Age, ManchesterUtd1718$Crosses)


cor.test(ManchesterUtd1819$Age, ManchesterUtd1819$Ast_By_Player)
cor.test(ManchesterUtd1819$Age, ManchesterUtd1819$Player_KP_Ast)
cor.test(ManchesterUtd1819$Age, ManchesterUtd1819$Player_Total_Cmp_Passes)
cor.test(ManchesterUtd1819$Age, ManchesterUtd1819$Player_Short_Cmp_Passes)
cor.test(ManchesterUtd1819$Age, ManchesterUtd1819$Player_Medium_Cmp_Passes)
cor.test(ManchesterUtd1819$Age, ManchesterUtd1819$Player_Long_Cmp_Passes)
cor.test(ManchesterUtd1819$Age, ManchesterUtd1819$Player_Passes_Through_Ball)
cor.test(ManchesterUtd1819$Age, ManchesterUtd1819$Player_Passes_FK)
cor.test(ManchesterUtd1819$Age, ManchesterUtd1819$Crosses)

sum(ManchesterUtd1718$Ast_By_Player, na.rm = TRUE)
sum(ManchesterUtd1718$Player_KP_Ast, na.rm = TRUE)
sum(ManchesterUtd1718$Player_Total_Cmp_Passes, na.rm = TRUE)
sum(ManchesterUtd1718$Player_Short_Cmp_Passes, na.rm = TRUE)
sum(ManchesterUtd1718$Player_Medium_Cmp_Passes, na.rm = TRUE)
sum(ManchesterUtd1718$Player_Long_Cmp_Passes, na.rm = TRUE)
sum(ManchesterUtd1718$Player_Passes_Through_Ball, na.rm = TRUE)
sum(ManchesterUtd1718$Player_Passes_FK, na.rm = TRUE)
sum(ManchesterUtd1718$Crosses, na.rm = TRUE)

sum(ManchesterUtd1819$Ast_By_Player, na.rm = TRUE)
sum(ManchesterUtd1819$Player_KP_Ast, na.rm = TRUE)
sum(ManchesterUtd1819$Player_Total_Cmp_Passes, na.rm = TRUE)
sum(ManchesterUtd1819$Player_Short_Cmp_Passes, na.rm = TRUE)
sum(ManchesterUtd1819$Player_Medium_Cmp_Passes, na.rm = TRUE)
sum(ManchesterUtd1819$Player_Long_Cmp_Passes, na.rm = TRUE)
sum(ManchesterUtd1819$Player_Passes_Through_Ball, na.rm = TRUE)
sum(ManchesterUtd1819$Player_Passes_FK, na.rm = TRUE)
sum(ManchesterUtd1819$Crosses, na.rm = TRUE)

##Liverpool
##Attacking
cor.test(Liverpool1718$Age, Liverpool1718$Gls_By_Player)
cor.test(Liverpool1718$Age, Liverpool1718$PK_By_Player)
cor.test(Liverpool1718$Age, Liverpool1718$Player_SH)
cor.test(Liverpool1718$Age, Liverpool1718$Player_SoT)
cor.test(Liverpool1718$Age, Liverpool1718$Player_FK)
cor.test(Liverpool1718$Age, Liverpool1718$Passes_Into_Final_Third)
cor.test(Liverpool1718$Age, Liverpool1718$Passes_Into_Penalty_Area)
cor.test(Liverpool1718$Age, Liverpool1718$Crosses_Into_Penalty_Area)
cor.test(Liverpool1718$Age, Liverpool1718$Succ_Dribbles)
cor.test(Liverpool1718$Age, Liverpool1718$Succ_Players_Dribbled_Past)

cor.test(Liverpool1819$Age, Liverpool1819$Gls_By_Player)
cor.test(Liverpool1819$Age, Liverpool1819$PK_By_Player)
cor.test(Liverpool1819$Age, Liverpool1819$Player_SH)
cor.test(Liverpool1819$Age, Liverpool1819$Player_SoT)
cor.test(Liverpool1819$Age, Liverpool1819$Player_FK)
cor.test(Liverpool1819$Age, Liverpool1819$Passes_Into_Final_Third)
cor.test(Liverpool1819$Age, Liverpool1819$Passes_Into_Penalty_Area)
cor.test(Liverpool1819$Age, Liverpool1819$Crosses_Into_Penalty_Area)
cor.test(Liverpool1819$Age, Liverpool1819$Succ_Dribbles)
cor.test(Liverpool1819$Age, Liverpool1819$Succ_Players_Dribbled_Past)

sum(Liverpool1718$Gls_By_Player, na.rm = TRUE)
sum(Liverpool1718$PK_By_Player, na.rm = TRUE)
sum(Liverpool1718$Player_SH, na.rm = TRUE)
sum(Liverpool1718$Player_SoT, na.rm = TRUE)
sum(Liverpool1718$Player_FK, na.rm = TRUE)
sum(Liverpool1718$Passes_Into_Final_Third, na.rm = TRUE)
sum(Liverpool1718$Passes_Into_Penalty_Area, na.rm = TRUE)
sum(Liverpool1718$Crosses_Into_Penalty_Area, na.rm = TRUE)
sum(Liverpool1718$Succ_Dribbles, na.rm = TRUE)
sum(Liverpool1718$Succ_Players_Dribbled_Past, na.rm = TRUE)

sum(Liverpool1819$Gls_By_Player, na.rm = TRUE)
sum(Liverpool1819$PK_By_Player, na.rm = TRUE)
sum(Liverpool1819$Player_SH, na.rm = TRUE)
sum(Liverpool1819$Player_SoT, na.rm = TRUE)
sum(Liverpool1819$Player_FK, na.rm = TRUE)
sum(Liverpool1819$Passes_Into_Final_Third, na.rm = TRUE)
sum(Liverpool1819$Passes_Into_Penalty_Area, na.rm = TRUE)
sum(Liverpool1819$Crosses_Into_Penalty_Area, na.rm = TRUE)
sum(Liverpool1819$Succ_Dribbles, na.rm = TRUE)
sum(Liverpool1819$Succ_Players_Dribbled_Past, na.rm = TRUE)


##Defending
cor.test(Liverpool1718$Age, Liverpool1718$TklW)
cor.test(Liverpool1718$Age, Liverpool1718$Interception)
cor.test(Liverpool1718$Age, Liverpool1718$Dribblers_Tkl)
cor.test(Liverpool1718$Age, Liverpool1718$Dribblers_Att_tkl)
cor.test(Liverpool1718$Age, Liverpool1718$Fls_Committed)
cor.test(Liverpool1718$Age, Liverpool1718$Dribbled_Past_By_Opp)

cor.test(Liverpool1819$Age, Liverpool1819$TklW)
cor.test(Liverpool1819$Age, Liverpool1819$Interception)
cor.test(Liverpool1819$Age, Liverpool1819$Dribblers_Tkl)
cor.test(Liverpool1819$Age, Liverpool1819$Dribblers_Att_tkl)
cor.test(Liverpool1819$Age, Liverpool1819$Fls_Committed)
cor.test(Liverpool1819$Age, Liverpool1819$Dribbled_Past_By_Opp)

sum(Liverpool1718$TklW, na.rm = TRUE)
sum(Liverpool1718$Interception, na.rm = TRUE)
sum(Liverpool1718$Dribblers_Tkl, na.rm = TRUE)
sum(Liverpool1718$Dribblers_Att_tkl, na.rm = TRUE)
sum(Liverpool1718$Fls_Committed, na.rm = TRUE)
sum(Liverpool1718$Dribbled_Past_By_Opp, na.rm = TRUE)

sum(Liverpool1819$TklW, na.rm = TRUE)
sum(Liverpool1819$Interception, na.rm = TRUE)
sum(Liverpool1819$Dribblers_Tkl, na.rm = TRUE)
sum(Liverpool1819$Dribblers_Att_tkl, na.rm = TRUE)
sum(Liverpool1819$Fls_Committed, na.rm = TRUE)
sum(Liverpool1819$Dribbled_Past_By_Opp, na.rm = TRUE)

##Team Play
cor.test(Liverpool1718$Age, Liverpool1718$Ast_By_Player)
cor.test(Liverpool1718$Age, Liverpool1718$Player_KP_Ast)
cor.test(Liverpool1718$Age, Liverpool1718$Player_Total_Cmp_Passes)
cor.test(Liverpool1718$Age, Liverpool1718$Player_Short_Cmp_Passes)
cor.test(Liverpool1718$Age, Liverpool1718$Player_Medium_Cmp_Passes)
cor.test(Liverpool1718$Age, Liverpool1718$Player_Long_Cmp_Passes)
cor.test(Liverpool1718$Age, Liverpool1718$Player_Passes_Through_Ball)
cor.test(Liverpool1718$Age, Liverpool1718$Player_Passes_FK)
cor.test(Liverpool1718$Age, Liverpool1718$Crosses)


cor.test(Liverpool1819$Age, Liverpool1819$Ast_By_Player)
cor.test(Liverpool1819$Age, Liverpool1819$Player_KP_Ast)
cor.test(Liverpool1819$Age, Liverpool1819$Player_Total_Cmp_Passes)
cor.test(Liverpool1819$Age, Liverpool1819$Player_Short_Cmp_Passes)
cor.test(Liverpool1819$Age, Liverpool1819$Player_Medium_Cmp_Passes)
cor.test(Liverpool1819$Age, Liverpool1819$Player_Long_Cmp_Passes)
cor.test(Liverpool1819$Age, Liverpool1819$Player_Passes_Through_Ball)
cor.test(Liverpool1819$Age, Liverpool1819$Player_Passes_FK)
cor.test(Liverpool1819$Age, Liverpool1819$Crosses)

sum(Liverpool1718$Ast_By_Player, na.rm = TRUE)
sum(Liverpool1718$Player_KP_Ast, na.rm = TRUE)
sum(Liverpool1718$Player_Total_Cmp_Passes, na.rm = TRUE)
sum(Liverpool1718$Player_Short_Cmp_Passes, na.rm = TRUE)
sum(Liverpool1718$Player_Medium_Cmp_Passes, na.rm = TRUE)
sum(Liverpool1718$Player_Long_Cmp_Passes, na.rm = TRUE)
sum(Liverpool1718$Player_Passes_Through_Ball, na.rm = TRUE)
sum(Liverpool1718$Player_Passes_FK, na.rm = TRUE)
sum(Liverpool1718$Crosses, na.rm = TRUE)

sum(Liverpool1819$Ast_By_Player, na.rm = TRUE)
sum(Liverpool1819$Player_KP_Ast, na.rm = TRUE)
sum(Liverpool1819$Player_Total_Cmp_Passes, na.rm = TRUE)
sum(Liverpool1819$Player_Short_Cmp_Passes, na.rm = TRUE)
sum(Liverpool1819$Player_Medium_Cmp_Passes, na.rm = TRUE)
sum(Liverpool1819$Player_Long_Cmp_Passes, na.rm = TRUE)
sum(Liverpool1819$Player_Passes_Through_Ball, na.rm = TRUE)
sum(Liverpool1819$Player_Passes_FK, na.rm = TRUE)
sum(Liverpool1819$Crosses, na.rm = TRUE)


hist(Arsenal1718$Age, xlab = 'Age', main = 'Arsenal Players Age Group 2017-18')
hist(Arsenal1819$Age, xlab = 'Age', main = 'Arsenal Players Age Group in 2018-19')
mean(Arsenal1718$Age)
mean(Arsenal1819$Age)

hist(ManchesterCity1718$Age, xlab = 'Age', main = 'Manchester City Players Age Group 2017-18')
hist(ManchesterCity1819$Age, xlab = 'Age', main = 'Manchester City Players Age Group 2018-19')
mean(ManchesterCity1718$Age)
mean(ManchesterCity1819$Age)








