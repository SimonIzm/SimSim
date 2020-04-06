##CKME136 Project 
##Data Preparation, Data Cleaning, Summary Statistics, Correlation, Variable Selection, Random Forrest

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

##Packages Used
install.packages("tidyverse")
install.packages("frbs")
install.packages("MASS")
install.packages("e1071")
install.packages("stringr")
install.packages("plm")
install.packages("tidyr")
install.packages("tidyquant")
install.packages('plyr')
install.packages("tidyr")
install.packages("reshape2")
install.packages('corrplot')
install.packages("broom")
install.packages("ggplot2")
library("ggplot2")
library("dplyr")
library("RColorBrewer")
library("ggthemes")
library("ggrepel")
library("gridExtra")
library("reshape2")
library("data.table")
library("corrplot")
library(plyr)
library(tidyverse)
library(caret)
library(MASS, quietly = TRUE)
library(caTools)
library(broom)
library(e1071)
library(frbs)
library(dplyr)
library(stringr)
library(plm)
library(tidyr)
library(ggplot2)
library(tidyquant)
library(ggplot2)
library(reshape2)

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

##CALCULATING VARIANCE AND STANDARD DEVIATION
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

##Overall Team Statistics
##Arsenal 2017-19
##Arsenal 2017-18 Plotting
ARS1718<- subset(Arsenal1718)
ARS1718$Age<- as.factor(ARS1718$Age)

##Attacking 2017-18
#Goals Scored
ARSgls1718<- aggregate(Gls_By_Player ~ Age, ARS1718, sum)
##Shots
ARSSH1718<- aggregate(Player_SH ~ Age, ARS1718, sum)
#Shots on Target
ARSSoT1718<- aggregate(Player_SoT ~ Age, ARS1718, sum)
#Passes into Final Third
ARSFinalThird1718<- aggregate(Passes_Into_Final_Third ~ Age, ARS1718, sum)
#Passes Into Penalty Area
ARSPenaltyArea1718<- aggregate(Passes_Into_Penalty_Area~ Age,ARS1718, sum)
#Successful Dribbles
ARSSuccessfulDribbles1718<- aggregate(Succ_Dribbles~ Age,ARS1718, sum)
#Successful Players Dribbled Past
ARSSuccessfulDribblesPast1718<- aggregate(Succ_Players_Dribbled_Past~ Age,ARS1718, sum)

##Attacking 2018-19
ARS1819<- subset(Arsenal1819)
ARS1819$Age<- as.factor(ARS1819$Age)

#Goals Scored
ARSgls1819<- aggregate(Gls_By_Player ~ Age, ARS1819, sum)
##Shots
ARSSH1819<- aggregate(Player_SH ~ Age, ARS1819, sum)
#Shots on Target
ARSSoT1819<- aggregate(Player_SoT ~ Age, ARS1819, sum)
#Passes into Final Third
ARSFinalThird1819<- aggregate(Passes_Into_Final_Third ~ Age, ARS1819, sum)
#Passes Into Penalty Area
ARSPenaltyArea1819<- aggregate(Passes_Into_Penalty_Area~ Age,ARS1819, sum)
#Successful Dribbles
ARSSuccessfulDribbles1819<- aggregate(Succ_Dribbles~ Age,ARS1819, sum)
#Successful Players Dribbled Past
ARSSuccessfulDribblesPast1819<- aggregate(Succ_Players_Dribbled_Past~ Age,ARS1819, sum)

#Defensive 2017-18
#Tackles Won
ARSTKlW1718<- aggregate(TklW~ Age,ARS1718, sum)
#Interceptions
ARSInterceptions1718<- aggregate(Interception~ Age,ARS1718, sum)
#Dribblers Tackled
ARSDribblersTkld1718<- aggregate(Dribblers_Tkl~ Age,ARS1718, sum)
#Fouls Committed
ARSFlsCommitted1718<- aggregate(Fls_Committed~ Age,ARS1718, sum)
#Dribbled Past by Opponent
ARSDribbledPastOpp1718<- aggregate(Dribbled_Past_By_Opp~ Age,ARS1718, sum)

#Defensive 2018-19
#Tackles Won
ARSTKlW1819<- aggregate(TklW~ Age,ARS1819, sum)
#Interceptions
ARSInterceptions1819<- aggregate(Interception~ Age,ARS1819, sum)
#Dribblers Tackled
ARSDribblersTkld1819<- aggregate(Dribblers_Tkl~ Age,ARS1819, sum)
#Fouls Committed
ARSFlsCommitted1819<- aggregate(Fls_Committed~ Age,ARS1819, sum)
#Dribbled Past by Opponent
ARSDribbledPastOpp1819<- aggregate(Dribbled_Past_By_Opp~ Age,ARS1819, sum)

#Overall Team Play 2017-18
#Assists
ARSAssists718<- aggregate(Ast_By_Player~ Age,ARS1718, sum)
#Key Pass Assists
ARSKPAst1718<- aggregate(Player_KP_Ast~ Age,ARS1718, sum)
#Total Completed Passes
ARSTotalCmp718<- aggregate(Player_Total_Cmp_Passes~ Age,ARS1718, sum)
#Short Completed Passes
ARSShortCmp718<- aggregate(Player_Short_Cmp_Passes~ Age,ARS1718, sum)
#Medium Completed Passes
ARSMediumCmp718<- aggregate(Player_Medium_Cmp_Passes~ Age,ARS1718, sum)
#Long Completed Passes
ARSLongCmp718<- aggregate(Player_Long_Cmp_Passes~ Age,ARS1718, sum)
#Through Balls
ARSThroughBallsCmp718<- aggregate(Player_Passes_Through_Ball~ Age,ARS1718, sum)
#Crosses
ARSCrossesCmp718<- aggregate(Crosses~ Age,ARS1718, sum)

#Overall Team Play 2018-19
#Assists
ARSAssists1819<- aggregate(Ast_By_Player~ Age,ARS1819, sum)
#Key Pass Assists
ARSKPAst1819<- aggregate(Player_KP_Ast~ Age,ARS1819, sum)
#Total Completed Passes
ARSTotalCmp1819<- aggregate(Player_Total_Cmp_Passes~ Age,ARS1819, sum)
#Short Completed Passes
ARSShortCmp1819<- aggregate(Player_Short_Cmp_Passes~ Age,ARS1819, sum)
#Medium Completed Passes
ARSMediumCmp1819<- aggregate(Player_Medium_Cmp_Passes~ Age,ARS1819, sum)
#Long Completed Passes
ARSLongCmp1819<- aggregate(Player_Long_Cmp_Passes~ Age,ARS1819, sum)
#Through Balls
ARSThroughBallsCmp1819<- aggregate(Player_Passes_Through_Ball~ Age,ARS1819, sum)
#Crosses
ARSCrossesCmp1819<- aggregate(Crosses~ Age,ARS1819, sum)

#Attacking Comparisons 2017-18
ARSTotalShots1718 = left_join(ARSSH1718, ARSSoT1718, by = c("Age"))
ARSTotalShots1718<- melt(ARSTotalShots1718, id.vars = 'Age')
ggplot(ARSTotalShots1718, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle(" Arsenals Total Number of Attempts at Goal by Age 2017-18")

ARSPassesIntoCriticalAreas1718 = left_join(ARSFinalThird1718, ARSPenaltyArea1718, by = c("Age"))
ARSPassesIntoCriticalAreas1718<- melt(ARSPassesIntoCriticalAreas1718, id.vars = 'Age')
ggplot(ARSPassesIntoCriticalAreas1718, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Arsenal Total Number of Chances Created by Age 2017-18")

ARSDribbles1718 = left_join(ARSSuccessfulDribbles1718, ARSSuccessfulDribblesPast1718, by = c("Age"))
ARSDribbles1718<- melt(ARSDribbles1718, id.vars = 'Age')
ggplot(ARSDribbles1718, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Arsenal Total Number of Dribbles by Age 2017-18")

#Attacking Comparisons 2018-19
ARSTotalShots1819 = left_join(ARSSH1819, ARSSoT1819, by = c("Age"))
ARSTotalShots1819<- melt(ARSTotalShots1819, id.vars = 'Age')
ggplot(ARSTotalShots1819, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Arsenal Total Number of Attempts at Goal by Age 2018-19")

ARSPassesIntoCriticalAreas1819 = left_join(ARSFinalThird1819, ARSPenaltyArea1819, by = c("Age"))
ARSPassesIntoCriticalAreas1819<- melt(ARSPassesIntoCriticalAreas1819, id.vars = 'Age')
ggplot(ARSPassesIntoCriticalAreas1819, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Arsenal Total Number of Chances Created by Age 2018-19")

ARSDribbles1819 = left_join(ARSSuccessfulDribbles1819, ARSSuccessfulDribblesPast1819, by = c("Age"))
ARSDribbles1819<- melt(ARSDribbles1819, id.vars = 'Age')
ggplot(ARSDribbles1819, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Arsenal Total Number of Dribbles by Age 2018-19")

#Combined Total Goals Scored 2017-19
ARSTotalGoalScored<- left_join(ARSgls1718, ARSgls1819, by = c('Age'))
ARSTotalGoalScored<- melt(ARSTotalGoalScored, id.vars = 'Age')
ggplot(ARSTotalGoalScored, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge')

#Defensive Comparison 2017-18 
ARSDefensiveTackles1718 = left_join(ARSTKlW1718, ARSDribblersTkld1718, by = c("Age"))
ARSDefensiveTacklesCmp1718<- left_join(ARSDefensiveTackles1718, ARSDribbledPastOpp1718, by = c("Age"))
ARSDefensiveTacklesCmp1718<- melt(ARSDefensiveTacklesCmp1718, id.vars = 'Age')
ggplot(ARSDefensiveTacklesCmp1718, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Tackles Made in 2017-18")

#Combined Total Interceptions 2017-19
ARSTotalInterception<- left_join(ARSInterceptions1718, ARSInterceptions1819, by = c('Age'))
ARSTotalInterception<- melt(ARSTotalInterception, id.vars = 'Age')
ggplot(ARSTotalInterception, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge')+ ggtitle("Interception Made in 2017-19")

#Combined Total Fouls COmmitted 2017-19
ARSTotalFoulCommitted<- left_join(ARSFlsCommitted1718, ARSFlsCommitted1819, by = c('Age'))
ARSTotalFoulCommitted<- melt(ARSTotalFoulCommitted, id.vars = 'Age')
ggplot(ARSTotalFoulCommitted, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge')+ ggtitle("Fouls Committed in 2017-19")

#Defensive Compairison 2018-19 
ARSDefensiveTackles1819 = left_join(ARSTKlW1819, ARSDribblersTkld1819, by = c("Age"))
ARSDefensiveTacklesCmp1819<- left_join(ARSDefensiveTackles1819, ARSDribbledPastOpp1819, by = c("Age"))
ARSDefensiveTacklesCmp1819<- melt(ARSDefensiveTacklesCmp1819, id.vars = 'Age')
ggplot(ARSDefensiveTacklesCmp1819, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Tackles Made in 2018-19")

##Overall Team Play Compairison 2017-18
ARSOverallAssists1718 = left_join(ARSAssists718, ARSKPAst1718, by = c("Age"))
ARSOverallAssists1718<- melt(ARSOverallAssists1718, id.vars = 'Age')
ggplot(ARSOverallAssists1718, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Assists by Age 2017-18")

ARSPassesTotal1718 = left_join(ARSShortCmp718, ARSMediumCmp718, by = c("Age"))
ARSPassesCmpTotal1718<- left_join(ARSPassesTotal1718, ARSLongCmp718, by = c("Age"))
ARSPassesCmpTotal1718<- melt(ARSPassesCmpTotal1718, id.vars = 'Age')
ggplot(ARSPassesCmpTotal1718, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Passes by Age 2017-18")

##Overall Team Play Compairison 2018-19
ARSOverallAssists1819 = left_join(ARSAssists1819, ARSKPAst1819, by = c("Age"))
ARSOverallAssists1819<- melt(ARSOverallAssists1819, id.vars = 'Age')
ggplot(ARSOverallAssists1819, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Assists by Age 2018-19")

ARSPassesTotal1819 = left_join(ARSShortCmp1819, ARSMediumCmp1819, by = c("Age"))
ARSPassesCmpTotal1819<- left_join(ARSPassesTotal1819, ARSLongCmp1819, by = c("Age"))
ARSPassesCmpTotal1819<- melt(ARSPassesCmpTotal1819, id.vars = 'Age')
ggplot(ARSPassesCmpTotal1819, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Passes by Age 2018-19")

##Combined Total Passes for 2017-19
ARSTotalCmpPasses<- left_join(ARSTotalCmp718, ARSTotalCmp1819, by = c('Age'))
ARSTotalCmpPasses<- melt(ARSTotalCmpPasses, id.vars = 'Age')
ggplot(ARSTotalCmpPasses, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge')

##Combined Total Through Balls 2017-19
ARSTotalThroughBallPasses<- left_join(ARSThroughBallsCmp718, ARSThroughBallsCmp1819, by = c('Age'))
ARSTotalThroughBallPasses<- melt(ARSTotalThroughBallPasses, id.vars = 'Age')
ggplot(ARSTotalThroughBallPasses, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge')

##Combined Total Crosses 2017-19
ARSTotalCrossesPasses<- left_join(ARSCrossesCmp718, ARSCrossesCmp1819, by = c('Age'))
ARSTotalCrossesPasses<- melt(ARSTotalCrossesPasses, id.vars = 'Age')
ggplot(ARSTotalCmpPasses, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge')

##Manchester City 2017-19
##Manchester City 2017-18 Plotting
ManCity1718<- subset(ManchesterCity1718)
ManCity1718$Age<- as.factor(ManchesterCity1718$Age)

##Attacking 2017-18
#Goals Scored
ManCitygls1718<- aggregate(Gls_By_Player ~ Age, ManCity1718, sum)
##Shots
ManCitySH1718<- aggregate(Player_SH ~ Age, ManCity1718, sum)
#Shots on Target
ManCitySoT1718<- aggregate(Player_SoT ~ Age, ManCity1718, sum)
#Passes into Final Third
ManCityFinalThird1718<- aggregate(Passes_Into_Final_Third ~ Age, ManCity1718, sum)
#Passes Into Penalty Area
ManCityPenaltyArea1718<- aggregate(Passes_Into_Penalty_Area~ Age,ManCity1718, sum)
#Successful Dribbles
ManCitySuccessfulDribbles1718<- aggregate(Succ_Dribbles~ Age,ManCity1718, sum)
#Successful Players Dribbled Past
ManCitySuccessfulDribblesPast1718<- aggregate(Succ_Players_Dribbled_Past~ Age,ManCity1718, sum)

##Attacking 2018-19
ManCity1819<- subset(ManchesterCity1819)
ManCity1819$Age<- as.factor(ManCity1819$Age)

##Manchester City 2018-19
#Goals Scored
ManCitygls1819<- aggregate(Gls_By_Player ~ Age, ManCity1819, sum)
##Shots
ManCitySH1819<- aggregate(Player_SH ~ Age, ManCity1819, sum)
#Shots on Target
ManCitySoT1819<- aggregate(Player_SoT ~ Age, ManCity1819, sum)
#Passes into Final Third
ManCityFinalThird1819<- aggregate(Passes_Into_Final_Third ~ Age, ManCity1819, sum)
#Passes Into Penalty Area
ManCityPenaltyArea1819<- aggregate(Passes_Into_Penalty_Area~ Age,ManCity1819, sum)
#Successful Dribbles
ManCitySuccessfulDribbles1819<- aggregate(Succ_Dribbles~ Age,ManCity1819, sum)
#Successful Players Dribbled Past
ManCitySuccessfulDribblesPast1819<- aggregate(Succ_Players_Dribbled_Past~ Age,ManCity1819, sum)

#Defensive 2017-18
#Tackles Won
ManCityTKlW11718<- aggregate(TklW~ Age,ManCity1718, sum)
#Interceptions
ManCityInterceptions1718<- aggregate(Interception~ Age,ManCity1718, sum)
#Dribblers Tackled
ManCityDribblersTkld1718<- aggregate(Dribblers_Tkl~ Age,ManCity1718, sum)
ggplot(ManCityDribblersTkld1718, aes(Age, Dribblers_Tkl, label = Dribblers_Tkl)) + geom_bar(stat = "identity") + geom_text()
#Fouls Committed
ManCityFlsCommitted1718<- aggregate(Fls_Committed~ Age,ManCity1718, sum)
#Dribbled Past by Opponent
ManCityDribbledPastOpp1718<- aggregate(Dribbled_Past_By_Opp~ Age,ManCity1718, sum)

#Defensive 2018-19
#Tackles Won
ManCityTKlW1819<- aggregate(TklW~ Age,ManCity1819, sum)
#Interceptions
ManCityInterceptions1819<- aggregate(Interception~ Age,ManCity1819, sum)
#Dribblers Tackled
ManCityDribblersTkld1819<- aggregate(Dribblers_Tkl~ Age,ManCity1819, sum)
#Fouls Committed
ManCityFlsCommitted1819<- aggregate(Fls_Committed~ Age,ManCity1819, sum)
#Dribbled Past by Opponent
plot(Arsenal1718$Age, Arsenal1718$Dribbled_Past_By_Opp, xlab = 'Age', ylab = 'Dribbled Past By Opponent', main = 'Number of Times Opponent Past Defender in 2017-18 by Age')
ManCityDribbledPastOpp1819<- aggregate(Dribbled_Past_By_Opp~ Age,ManCity1819, sum)

#Overall Team Play 2017-18
#Assists
ManCityAssists1718<- aggregate(Ast_By_Player~ Age,ManCity1718, sum)
#Key Pass Assists
ManCityKPAst1718<- aggregate(Player_KP_Ast~ Age,ManCity1718, sum)
#Total Completed Passes
ManCityTotalCmp1718<- aggregate(Player_Total_Cmp_Passes~ Age,ManCity1718, sum)
#Short Completed Passes
ManCityShortCmp1718<- aggregate(Player_Short_Cmp_Passes~ Age,ManCity1718, sum)
#Medium Completed Passes
ManCityMediumCmp1718<- aggregate(Player_Medium_Cmp_Passes~ Age,ManCity1718, sum)
#Long Completed Passes
ManCityLongCmp1718<- aggregate(Player_Long_Cmp_Passes~ Age,ManCity1718, sum)
#Through Balls
ManCityThroughBallsCmp1718<- aggregate(Player_Passes_Through_Ball~ Age,ManCity1718, sum)
#Crosses
ManCityCrossesCmp1718<- aggregate(Crosses~ Age,ManCity1718, sum)

##Combined Passes 2017-18
ManCityPassesTotal1718 = left_join(ManCityShortCmp1718, ManCityMediumCmp1718, by = c("Age"))
ManCityPassesCmpTotal1718<- left_join(ManCityPassesTotal1718, ManCityLongCmp1718, by = c("Age"))
ManCityPassesCmpTotal1718<- melt(ManCityPassesCmpTotal1718, id.vars = 'Age')


#Overall Team Play 2018-19
#Assists
ManCityAssists1819<- aggregate(Ast_By_Player~ Age,ManCity1819, sum)
#Key Pass Assists
ManCityKPAst1819<- aggregate(Player_KP_Ast~ Age,ManCity1819, sum)
#Total Completed Passes
ManCityTotalCmp1819<- aggregate(Player_Total_Cmp_Passes~ Age,ManCity1819, sum)
##Combined Total Passes 
ManCityTotalCmpPasses<- left_join(ManCityTotalCmp1718, ManCityTotalCmp1819, by = c('Age'))
ManCityTotalCmpPasses<- melt(ManCityTotalCmpPasses, id.vars = 'Age')
#Short Completed Passes
ManCityShortCmp1819<- aggregate(Player_Short_Cmp_Passes~ Age,ManCity1819, sum)
#Medium Completed Passes
ManCityMediumCmp1819<- aggregate(Player_Medium_Cmp_Passes~ Age,ManCity1819, sum)
#Long Completed Passes
ManCityLongCmp1819<- aggregate(Player_Long_Cmp_Passes~ Age,ManCity1819, sum)
#Through Balls
ManCityThroughBallsCmp1819<- aggregate(Player_Passes_Through_Ball~ Age,ManCity1819, sum)
#Crosses
ManCityCrossesCmp1819<- aggregate(Crosses~ Age,ManCity1819, sum)
#Combined Passes 2018-19
ManCityPassesTotal1819 = left_join(ManCityShortCmp1819, ManCityMediumCmp1819, by = c("Age"))
ManCityPassesCmpTotal1819<- left_join(ManCityPassesTotal1819, ManCityLongCmp1819, by = c("Age"))
ManCityPassesCmpTotal1819<- melt(ManCityPassesCmpTotal1819, id.vars = 'Age')

#Attacking Comparisons 2017-18
ManCityTotalShots1718 = left_join(ManCitySH1718, ManCitySoT1718, by = c("Age"))
ManCityTotalShots1718<- melt(ManCityTotalShots1718, id.vars = 'Age')
ggplot(ManCityTotalShots1718, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Man City Total Number of Attempts at Goal by Age 2017-18")

ManCityPassesIntoCriticalAreas1718 = left_join(ManCityFinalThird1718, ManCityPenaltyArea1718, by = c("Age"))
ManCityPassesIntoCriticalAreas1718<- melt(ManCityPassesIntoCriticalAreas1718, id.vars = 'Age')
ggplot(ManCityPassesIntoCriticalAreas1718, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Chances Created by Age 2017-18")

ManCityDribbles1718 = left_join(ManCitySuccessfulDribbles1718, ManCitySuccessfulDribblesPast1718, by = c("Age"))
ManCityDribbles1718<- melt(ManCityDribbles1718, id.vars = 'Age')
ggplot(ManCityDribbles1718, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Dribbles by Age 2017-18")

#Attacking Comparisons 2018-19
ManCityTotalShots1819 = left_join(ManCitySH1819, ManCitySoT1819, by = c("Age"))
ManCityTotalShots1819<- melt(ManCityTotalShots1819, id.vars = 'Age')
ggplot(ManCityTotalShots1819, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Attempts at Goal by Age 2018-19")

ManCityPassesIntoCriticalAreas1819 = left_join(ManCityFinalThird1819, ManCityPenaltyArea1819, by = c("Age"))
ManCityPassesIntoCriticalAreas1819<- melt(ManCityPassesIntoCriticalAreas1819, id.vars = 'Age')
ggplot(ManCityPassesIntoCriticalAreas1819, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Chances Created by Age 2018-19")

ManCityDribbles1819 = left_join(ManCitySuccessfulDribbles1819, ManCitySuccessfulDribblesPast1819, by = c("Age"))
ManCityDribbles1819<- melt(ManCityDribbles1819, id.vars = 'Age')
ggplot(ManCityDribbles1819, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Dribbles by Age 2018-19")

#Combined Total Goals Scored 2017-19
ManCityTotalGoalScored<- left_join(ManCitygls1718, ManCitygls1819, by = c('Age'))
ManCityTotalGoalScored<- melt(ManCityTotalGoalScored, id.vars = 'Age')
ggplot(ManCityTotalGoalScored, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge')

#Defensive Comparison 2017-18 
ManCityDefensiveTackles1718 = left_join(ManCityTKlW11718, ManCityDribblersTkld1718, by = c("Age"))
ManCityDefensiveTacklesCmp1718<- left_join(ManCityDefensiveTackles1718, ManCityDribbledPastOpp1718, by = c("Age"))
ManCityDefensiveTacklesCmp1718<- melt(ManCityDefensiveTacklesCmp1718, id.vars = 'Age')
ggplot(ManCityDefensiveTacklesCmp1718, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Tackles Made in 2017-18")

#Combined Total Interceptions 2017-19
ManCityTotalInterception<- left_join(ManCityInterceptions1718, ManCityInterceptions1819, by = c('Age'))
ManCityTotalInterception<- melt(ManCityTotalInterception, id.vars = 'Age')
ggplot(ManCityTotalInterception, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Interception Made by Age 2017-19")

#Combined Total Fouls COmmitted 2017-19
ManCityTotalFoulCommitted<- left_join(ManCityFlsCommitted1718, ManCityFlsCommitted1819, by = c('Age'))
ManCityTotalFoulCommitted<- melt(ManCityTotalFoulCommitted, id.vars = 'Age')
ggplot(ManCityTotalFoulCommitted, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Fouls Committed by Age 2017-19")

#Defensive Compairison 2018-19 
ManCityDefensiveTackles1819 = left_join(ManCityTKlW1819, ManCityDribblersTkld1819, by = c("Age"))
ManCityDefensiveTacklesCmp1819<- left_join(ManCityDefensiveTackles1819, ManCityDribbledPastOpp1819, by = c("Age"))
ManCityDefensiveTacklesCmp1819<- melt(ManCityDefensiveTacklesCmp1819, id.vars = 'Age')
ggplot(ManCityDefensiveTacklesCmp1819, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Tackles Made in 2018-19")

##Overall Team Play Compairison 2017-18
ManCityOverallAssists1718 = left_join(ManCityAssists1718, ManCityKPAst1718, by = c("Age"))
ManCityOverallAssists1718<- melt(ManCityOverallAssists1718, id.vars = 'Age')
ggplot(ManCityOverallAssists1718, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Assists by Age 2017-18")

ManCityPassesTotal1718 = left_join(ManCityShortCmp1718, ManCityMediumCmp1718, by = c("Age"))
ManCityPassesCmpTotal1718<- left_join(ManCityPassesTotal1718, ManCityLongCmp1718, by = c("Age"))
ManCityPassesCmpTotal1718<- melt(ManCityPassesCmpTotal1718, id.vars = 'Age')
ggplot(ManCityPassesCmpTotal1718, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Passes by Age 2017-18")

##Overall Team Play Compairison 2018-19
ManCityOverallAssists1819 = left_join(ManCityAssists1819, ManCityKPAst1819, by = c("Age"))
ManCityOverallAssists1819<- melt(ManCityOverallAssists1819, id.vars = 'Age')
ggplot(ManCityOverallAssists1819, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Assists by Age 2018-19")

ManCityPassesTotal1819 = left_join(ManCityShortCmp1819, ManCityMediumCmp1819, by = c("Age"))
ManCityPassesCmpTotal1819<- left_join(ManCityPassesTotal1819, ManCityLongCmp1819, by = c("Age"))
ManCityPassesCmpTotal1819<- melt(ManCityPassesCmpTotal1819, id.vars = 'Age')
ggplot(ManCityPassesCmpTotal1819, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Passes by Age 2018-19")

##Combined Total Passes for 2017-19
ManCityTotalCmpPasses<- left_join(ManCityTotalCmp1718, ManCityTotalCmp1819, by = c('Age'))
ManCityTotalCmpPasses<- melt(ManCityTotalCmpPasses, id.vars = 'Age')
ggplot(ManCityTotalCmpPasses, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge')

##Combined Total Through Balls 2017-19
ManCityTotalThroughBallPasses<- left_join(ManCityThroughBallsCmp1718, ManCityThroughBallsCmp1819, by = c('Age'))
ManCityTotalThroughBallPasses<- melt(ManCityTotalThroughBallPasses, id.vars = 'Age')
ggplot(ManCityTotalThroughBallPasses, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge')

##Combined Total Crosses 2017-19
ManCityTotalCrossesPasses<- left_join(ManCityCrossesCmp1718, ManCityCrossesCmp1819, by = c('Age'))
ManCityTotalCrossesPasses<- melt(ManCityTotalCrossesPasses, id.vars = 'Age')
ggplot(ManCityTotalCrossesPasses, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge')

##Manchester Utd 2017-19
#Attacking Comparisons 2017-18
ManUtdTotalShots1718 = left_join(ManUtdSH1718, ManUtdSoT1718, by = c("Age"))
ManUtdTotalShots1718<- melt(ManUtdTotalShots1718, id.vars = 'Age')
ggplot(ManUtdTotalShots1718, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Man Utd Total Number of Attempts at Goal by Age 2017-18")

ManUtdPassesIntoCriticalAreas1718 = left_join(ManUtdFinalThird1718, ManUtdPenaltyArea1718, by = c("Age"))
ManUtdPassesIntoCriticalAreas1718<- melt(ManUtdPassesIntoCriticalAreas1718, id.vars = 'Age')
ggplot(ManUtdPassesIntoCriticalAreas1718, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Chances Created by Age 2017-18")

ManUtdDribbles1718 = left_join(ManUtdSuccessfulDribbles1718, ManUtdSuccessfulDribblesPast1718, by = c("Age"))
ManUtdDribbles1718<- melt(ManUtdDribbles1718, id.vars = 'Age')
ggplot(ManUtdDribbles1718, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Dribbles by Age 2017-18")

#Attacking Comparisons 2018-19
ManUtdTotalShots1819 = left_join(ManUtdSH1819, ManUtdSoT1819, by = c("Age"))
ManUtdTotalShots1819<- melt(ManUtdTotalShots1819, id.vars = 'Age')
ggplot(ManUtdTotalShots1819, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Attempts at Goal by Age 2018-19")

ManUtdPassesIntoCriticalAreas1819 = left_join(ManUtdFinalThird1819, ManUtdPenaltyArea1819, by = c("Age"))
ManUtdPassesIntoCriticalAreas1819<- melt(ManUtdPassesIntoCriticalAreas1819, id.vars = 'Age')
ggplot(ManUtdPassesIntoCriticalAreas1819, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Chances Created by Age 2018-19")

ManUtdDribbles1819 = left_join(ManUtdSuccessfulDribbles1819, ManUtdSuccessfulDribblesPast1819, by = c("Age"))
ManUtdDribbles1819<- melt(ManUtdDribbles1819, id.vars = 'Age')
ggplot(ManUtdDribbles1819, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Dribbles by Age 2018-19")

#Combined Total Goals Scored 2017-19
ManUtdTotalGoalScored<- left_join(ManUtdgls1718, ManUtdgls1819, by = c('Age'))
ManUtdTotalGoalScored<- melt(ManUtdTotalGoalScored, id.vars = 'Age')
ggplot(ManUtdTotalGoalScored, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge')

#Defensive Comparison 2017-18 
ManUtdDefensiveTackles1718 = left_join(ManUtdTKlW11718, ManUtdDribblersTkld1718, by = c("Age"))
ManUtdDefensiveTacklesCmp1718<- left_join(ManUtdDefensiveTackles1718, ManUtdDribbledPastOpp1718, by = c("Age"))
ManUtdDefensiveTacklesCmp1718<- melt(ManUtdDefensiveTacklesCmp1718, id.vars = 'Age')
ggplot(ManUtdDefensiveTacklesCmp1718, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Tackles Made in 2017-18")

#Combined Total Interceptions 2017-19
ManUtdTotalInterception<- left_join(ManUtdInterceptions1718, ManUtdInterceptions1819, by = c('Age'))
ManUtdTotalInterception<- melt(ManUtdTotalInterception, id.vars = 'Age')
ggplot(ManUtdTotalInterception, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Interceptions Made by Age 2017-19")

#Combined Total Fouls COmmitted 2017-19
ManUtdTotalFoulCommitted<- left_join(ManUtdFlsCommitted1718, ManUtdFlsCommitted1819, by = c('Age'))
ManUtdTotalFoulCommitted<- melt(ManUtdTotalFoulCommitted, id.vars = 'Age')
ggplot(ManUtdTotalFoulCommitted, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge')+ ggtitle("Fouls Committed by Age 2017-19")

#Defensive Compairison 2018-19 
ManUtdDefensiveTackles1819 = left_join(ManUtdTKlW1819, ManUtdDribblersTkld1819, by = c("Age"))
ManUtdDefensiveTacklesCmp1819<- left_join(ManUtdDefensiveTackles1819, ManUtdDribbledPastOpp1819, by = c("Age"))
ManUtdDefensiveTacklesCmp1819<- melt(ManUtdDefensiveTacklesCmp1819, id.vars = 'Age')
ggplot(ManUtdDefensiveTacklesCmp1819, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Tackles Made in 2017-18")

##Overall Team Play Compairison 2017-18
ManUtdOverallAssists1718 = left_join(ManUtdAssists1718, ManUtdKPAst1718, by = c("Age"))
ManUtdOverallAssists1718<- melt(ManUtdOverallAssists1718, id.vars = 'Age')
ggplot(ManUtdOverallAssists1718, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Assists by Age 2017-18")

ManUtdPassesTotal1718 = left_join(ManUtdShortCmp1718, ManUtdMediumCmp1718, by = c("Age"))
ManUtdPassesCmpTotal1718<- left_join(ManUtdPassesTotal1718, ManUtdLongCmp1718, by = c("Age"))
ManUtdPassesCmpTotal1718<- melt(ManUtdPassesCmpTotal1718, id.vars = 'Age')
ggplot(ManUtdPassesCmpTotal1718, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Passes by Age 2017-18")

##Overall Team Play Compairison 2018-19
ManUtdOverallAssists1819 = left_join(ManUtdAssists1819, ManUtdKPAst1819, by = c("Age"))
ManUtdOverallAssists1819<- melt(ManUtdOverallAssists1819, id.vars = 'Age')
ggplot(ManUtdOverallAssists1819, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Assists by Age 2018-19")

ManUtdPassesTotal1819 = left_join(ManUtdShortCmp1819, ManUtdMediumCmp1819, by = c("Age"))
ManUtdPassesCmpTotal1819<- left_join(ManUtdPassesTotal1819, ManUtdLongCmp1819, by = c("Age"))
ManUtdPassesCmpTotal1819<- melt(ManUtdPassesCmpTotal1819, id.vars = 'Age')
ggplot(ManUtdPassesCmpTotal1819, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Passes by Age 2018-19")

##Combined Total Passes for 2017-19
ManUtdTotalCmpPasses<- left_join(ManUtdTotalCmp1718, ManUtdTotalCmp1819, by = c('Age'))
ManUtdTotalCmpPasses<- melt(ManUtdTotalCmpPasses, id.vars = 'Age')
ggplot(ManUtdTotalCmpPasses, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge')

##Combined Total Through Balls 2017-19
ManUtdTotalThroughBallPasses<- left_join(ManUtdThroughBallsCmp1718, ManUtdThroughBallsCmp1819, by = c('Age'))
ManUtdTotalThroughBallPasses<- melt(ManUtdTotalThroughBallPasses, id.vars = 'Age')
ggplot(ManUtdTotalThroughBallPasses, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge')

##Combined Total Crosses 2017-19
ManUtdTotalCrossesPasses<- left_join(ManUtdCrossesCmp1718, ManUtdCrossesCmp1819, by = c('Age'))
ManUtdTotalCrossesPasses<- melt(ManUtdTotalCrossesPasses, id.vars = 'Age')
ggplot(ManUtdTotalCrossesPasses, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge')

##Liverpool 2017-19
#Attacking Comparisons 2017-18
LiverpoolTotalShots1718 = left_join(LiverpoolSH1718, LiverpoolSoT1718, by = c("Age"))
LiverpoolTotalShots1718<- melt(LiverpoolTotalShots1718, id.vars = 'Age')
ggplot(LiverpoolTotalShots1718, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Liverpool Total Number of Attempts at Goal by Age 2017-18")

LiverpoolPassesIntoCriticalAreas1718 = left_join(LiverpoolFinalThird1718, LiverpoolPenaltyArea1718, by = c("Age"))
LiverpoolPassesIntoCriticalAreas1718<- melt(LiverpoolPassesIntoCriticalAreas1718, id.vars = 'Age')
ggplot(LiverpoolPassesIntoCriticalAreas1718, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Chances Created by Age 2017-18")

LiverpoolDribbles1718 = left_join(LiverpoolSuccessfulDribbles1718, LiverpoolSuccessfulDribblesPast1718, by = c("Age"))
LiverpoolDribbles1718<- melt(LiverpoolDribbles1718, id.vars = 'Age')
ggplot(LiverpoolDribbles1718, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Dribbles by Age 2017-18")

#Attacking Comparisons 2018-19
LiverpoolTotalShots1819 = left_join(LiverpoolSH1819, LiverpoolSoT1819, by = c("Age"))
LiverpoolTotalShots1819<- melt(LiverpoolTotalShots1819, id.vars = 'Age')
ggplot(LiverpoolTotalShots1819, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Attempts at Goal by Age 2018-19")

LiverpoolPassesIntoCriticalAreas1819 = left_join(LiverpoolFinalThird1819, LiverpoolPenaltyArea1819, by = c("Age"))
LiverpoolPassesIntoCriticalAreas1819<- melt(LiverpoolPassesIntoCriticalAreas1819, id.vars = 'Age')
ggplot(LiverpoolPassesIntoCriticalAreas1819, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Chances Created by Age 2018-19")

LiverpoolDribbles1819 = left_join(LiverpoolSuccessfulDribbles1819, LiverpoolSuccessfulDribblesPast1819, by = c("Age"))
LiverpoolDribbles1819<- melt(LiverpoolDribbles1819, id.vars = 'Age')
ggplot(LiverpoolDribbles1819, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Dribbles by Age 2018-19")

#Combined Total Goals Scored 2017-19
LiverpoolTotalGoalScored<- left_join(Liverpoolgls1718, Liverpoolgls1819, by = c('Age'))
LiverpoolTotalGoalScored<- melt(LiverpoolTotalGoalScored, id.vars = 'Age')
ggplot(LiverpoolTotalGoalScored, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge')

#Defensive Comparison 2017-18 
LiverpoolDefensiveTackles1718 = left_join(LiverpoolTKlW11718, LiverpoolDribblersTkld1718, by = c("Age"))
LiverpoolDefensiveTacklesCmp1718<- left_join(LiverpoolDefensiveTackles1718, ManUtdDribbledPastOpp1718, by = c("Age"))
LiverpoolDefensiveTacklesCmp1718<- melt(LiverpoolDefensiveTacklesCmp1718, id.vars = 'Age')
ggplot(LiverpoolDefensiveTacklesCmp1718, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Tackles Made in 2017-18")

#Combined Total Interceptions 2017-19
LiverpoolTotalInterception<- left_join(LiverpoolInterceptions1718, LiverpoolInterceptions1819, by = c('Age'))
LiverpoolTotalInterception<- melt(LiverpoolTotalInterception, id.vars = 'Age')
ggplot(LiverpoolTotalInterception, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge')+ ggtitle("Interceptions Made in 2017-19")

#Combined Total Fouls COmmitted 2017-19
LiverpoolTotalFoulCommitted<- left_join(LiverpoolFlsCommitted1718, LiverpoolFlsCommitted1819, by = c('Age'))
LiverpoolTotalFoulCommitted<- melt(LiverpoolTotalFoulCommitted, id.vars = 'Age')
ggplot(LiverpoolTotalFoulCommitted, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge')+ ggtitle("Fouls Committed in 2017-19")

#Defensive Compairison 2018-19 
LiverpoolDefensiveTackles1819 = left_join(LiverpoolTKlW1819, LiverpoolDribblersTkld1819, by = c("Age"))
LiverpoolDefensiveTacklesCmp1819<- left_join(LiverpoolDefensiveTackles1819, LiverpoolDribbledPastOpp1819, by = c("Age"))
LiverpoolDefensiveTacklesCmp1819<- melt(LiverpoolDefensiveTacklesCmp1819, id.vars = 'Age')
ggplot(LiverpoolDefensiveTacklesCmp1819, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Tackles Made in 2018-19")

##Overall Team Play Compairison 2017-18
LiverpoolOverallAssists1718 = left_join(LiverpoolAssists1718, LiverpoolKPAst1718, by = c("Age"))
LiverpoolOverallAssists1718<- melt(LiverpoolOverallAssists1718, id.vars = 'Age')
ggplot(LiverpoolOverallAssists1718, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Assists by Age 2017-18")
LiverpoolPassesTotal1718 = left_join(LiverpoolShortCmp1718, LiverpoolMediumCmp1718, by = c("Age"))
LiverpoolPassesCmpTotal1718<- left_join(LiverpoolPassesTotal1718, LiverpoolLongCmp1718, by = c("Age"))
LiverpoolPassesCmpTotal1718<- melt(LiverpoolPassesCmpTotal1718, id.vars = 'Age')
ggplot(LiverpoolPassesCmpTotal1718, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Passes by Age 2017-18")

##Overall Team Play Compairison 2018-19
LiverpoolOverallAssists1819 = left_join(LiverpoolAssists1819, LiverpoolKPAst1819, by = c("Age"))
LiverpoolOverallAssists1819<- melt(LiverpoolOverallAssists1819, id.vars = 'Age')
ggplot(LiverpoolOverallAssists1819, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Assists by Age 2018-19")
LiverpoolPassesTotal1819 = left_join(LiverpoolShortCmp1819, LiverpoolMediumCmp1819, by = c("Age"))
LiverpoolPassesCmpTotal1819<- left_join(LiverpoolPassesTotal1819, LiverpoolLongCmp1819, by = c("Age"))
LiverpoolPassesCmpTotal1819<- melt(LiverpoolPassesCmpTotal1819, id.vars = 'Age')
ggplot(LiverpoolPassesCmpTotal1819, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge') + ggtitle("Total Number of Passes by Age 2018-19")

##Combined Total Passes for 2017-19
LiverpoolTotalCmpPasses<- left_join(LiverpoolTotalCmp1718, LiverpoolTotalCmp1819, by = c('Age'))
LiverpoolTotalCmpPasses<- melt(LiverpoolTotalCmpPasses, id.vars = 'Age')
ggplot(LiverpoolTotalCmpPasses, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge')

##Combined Total Through Balls 2017-19
LiverpoolTotalThroughBallPasses<- left_join(LiverpoolThroughBallsCmp1718, LiverpoolThroughBallsCmp1819, by = c('Age'))
LiverpoolTotalThroughBallPasses<- melt(LiverpoolTotalThroughBallPasses, id.vars = 'Age')
ggplot(LiverpoolTotalThroughBallPasses, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge')

##Combined Total Crosses 2017-19
LiverpoolTotalCrossesPasses<- left_join(LiverpoolCrossesCmp1718, LiverpoolCrossesCmp1819, by = c('Age'))
LiverpoolTotalCrossesPasses<- melt(LiverpoolTotalCrossesPasses, id.vars = 'Age')
ggplot(LiverpoolTotalCrossesPasses, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge')


##Correlation
EPLMasterListData<- EPLFinalMasterList
EPLMasterListData = subset(EPLMasterListData, select = c(Age, Gls_By_Player,PK_By_Player, Player_SH, Player_SoT, Player_FK, Passes_Into_Final_Third, Passes_Into_Penalty_Area, Crosses_Into_Penalty_Area, Succ_Dribbles, Succ_Players_Dribbled_Past, TklW, Interception, Dribblers_Tkl, Dribblers_Att_tkl, Fls_Committed, Dribbled_Past_By_Opp, Ast_By_Player,Player_KP_Ast, Player_Total_Cmp_Passes,Player_Short_Cmp_Passes, Player_Medium_Cmp_Passes,  Player_Long_Cmp_Passes, Player_Passes_Through_Ball, Player_Passes_FK, Crosses, Season_Year, Season_End_Team_Ranking, Team_Name))
summary(EPLMasterListData)
EPLMasterListData$Season_End_Team_Ranking<- as.factor(EPLMasterListData$Season_End_Team_Ranking)
EPLMasterListData$Team_Name<- as.factor(EPLMasterListData$Team_Name)
colSums(is.na(EPLMasterListData))
EPLMasterListData<- na.omit(EPLMasterListData)
EPLMasterListData

##EPL Total 2017-19
##Plotting Attacking for all EPL 2017-2018
EPLCorAttk<- EPLFinalMasterList
EPLCorAttk = subset(EPLCorAttk, select = c(Age, Gls_By_Player,PK_By_Player, Player_SH, Player_SoT, Player_FK, Passes_Into_Final_Third, Passes_Into_Penalty_Area, Crosses_Into_Penalty_Area, Succ_Dribbles, Succ_Players_Dribbled_Past))
colSums(is.na(EPLCorAttk))
EPLCorAttk<- na.omit(EPLCorAttk)
plot(EPLCorAttk)
cor(EPLCorAttk, use = "pairwise.complete.obs")
corrplot(cor(EPLCorAttk), method = 'color', addCoef.col = "grey")

##Plotting Defense for all EPL2017-2018
EPLCorDef<- EPLFinalMasterList
EPLCorDef =  subset(EPLCorDef, select = c(Age, TklW, Interception, Dribblers_Tkl, Dribblers_Att_tkl, Fls_Committed, Dribbled_Past_By_Opp))
colSums(is.na(EPLCorDef))
EPLCorDef<- na.omit(EPLCorDef)
plot(EPLCorDef)
cor(EPLCorDef, use = "pairwise.complete.obs")
corrplot(cor(EPLCorDef), method = 'color', addCoef.col = "grey", use = "pairwise.complete.obs")

##Plotting Overall Team Player for all EPL 2017-2018
EPLCorTeamPlay<- EPLFinalMasterList
EPLCorTeamPlay = subset(EPLCorTeamPlay, select = c(Age, Ast_By_Player,Player_KP_Ast, Player_Total_Cmp_Passes,Player_Short_Cmp_Passes, Player_Medium_Cmp_Passes,  Player_Long_Cmp_Passes, Player_Passes_Through_Ball, Player_Passes_FK, Crosses))
colSums(is.na(EPLCorTeamPlay))
EPLCorTeamPlay<- na.omit(EPLCorTeamPlay)
plot(EPLCorTeamPlay)
cor(EPLCorTeamPlay, use = "pairwise.complete.obs")
corrplot(cor(EPLCorTeamPlay), method = 'color', addCoef.col = "grey", use = "pairwise.complete.obs")

##2017-18
##Plotting Attacking for all EPL 2017-2018
EPLCorAttk1718<- EPLLeague1718
EPLCorAttk1718 = subset(EPLCorAttk1718, select = c(Age, Gls_By_Player,PK_By_Player, Player_SH, Player_SoT, Player_FK, Passes_Into_Final_Third, Passes_Into_Penalty_Area, Crosses_Into_Penalty_Area, Succ_Dribbles, Succ_Players_Dribbled_Past))
colSums(is.na(EPLCorAttk1718))
EPLCorAttk1718<- na.omit(EPLCorAttk1718)
plot(EPLCorAttk1718)
cor(EPLCorAttk1718, use = "pairwise.complete.obs")
corrplot(cor(EPLCorTeamPlay), method = 'color', addCoef.col = "grey", use = "pairwise.complete.obs")

##Plotting Defense for all EPL2017-2018
EPLCorDef1718<- EPLLeague1718
EPLCorDef1718 =  subset(EPLCorDef1718, select = c(Age, TklW, Interception, Dribblers_Tkl, Dribblers_Att_tkl, Fls_Committed, Dribbled_Past_By_Opp))
colSums(is.na(EPLCorDef1718))
EPLCorDef1718<- na.omit(EPLCorDef1718)
plot(EPLCorDef1718)
cor(EPLCorDef1718, use = "pairwise.complete.obs")
corrplot(cor(EPLCorDef1718), method = 'color', addCoef.col = "grey", use = "pairwise.complete.obs")

##Plotting Overall Team Player for all EPL 2017-2018
EPLCorTeamPlay1718<- EPLLeague1718
EPLCorTeamPlay1718 = subset(EPLCorTeamPlay1718, select = c(Age, Ast_By_Player,Player_KP_Ast, Player_Total_Cmp_Passes,Player_Short_Cmp_Passes, Player_Medium_Cmp_Passes,  Player_Long_Cmp_Passes, Player_Passes_Through_Ball, Player_Passes_FK, Crosses))
colSums(is.na(EPLCorTeamPlay1718))
EPLCorTeamPlay1718<- na.omit(EPLCorTeamPlay1718)
plot(EPLCorTeamPlay1718)
cor(EPLCorTeamPlay1718, use = "pairwise.complete.obs")
corrplot(cor(EPLCorTeamPlay1718), method = 'color', addCoef.col = "grey", use = "pairwise.complete.obs")

##2018-19
##Plotting Attacking for all EPL 2018-2019
EPLCorAttk1819<- EPLLeague1819
EPLCorAttk1819 = subset(EPLCorAttk1819, select = c(Age, Gls_By_Player,PK_By_Player, Player_SH, Player_SoT, Player_FK, Passes_Into_Final_Third, Passes_Into_Penalty_Area, Crosses_Into_Penalty_Area, Succ_Dribbles, Succ_Players_Dribbled_Past))
colSums(is.na(EPLCorAttk1819))
EPLCorAttk1819<- na.omit(EPLCorAttk1819)
plot(EPLCorAttk1819)
cor(EPLCorAttk1819, use = "pairwise.complete.obs")
corrplot(cor(EPLCorAttk1819), method = 'color', addCoef.col = "grey", use = "complete.obs")

##Plotting Defense for all EPL 2018-2019
EPLCorDef1819<- EPLLeague1819
EPLCorDef1819 =  subset(EPLCorDef1819, select = c(Age, TklW, Interception, Dribblers_Tkl, Dribblers_Att_tkl, Fls_Committed, Dribbled_Past_By_Opp))
colSums(is.na(EPLCorDef1819))
EPLCorDef1819<- na.omit(EPLCorDef1819)
plot(EPLCorDef1819)
cor(EPLCorDef1819, use = "pairwise.complete.obs")
corrplot(cor(EPLCorDef1819), method = 'color', addCoef.col =  "grey",use = "pairwise.complete.obs")

##Plotting Overall Team Play for all EPL 2018-2019
EPLCorTeamPlay1819<- EPLLeague1819
EPLCorTeamPlay1819 = subset(EPLCorTeamPlay1819, select = c(Age, Ast_By_Player,Player_KP_Ast, Player_Total_Cmp_Passes,Player_Short_Cmp_Passes, Player_Medium_Cmp_Passes,  Player_Long_Cmp_Passes, Player_Passes_Through_Ball, Player_Passes_FK, Crosses))
colSums(is.na(EPLCorTeamPlay1819))
EPLCorTeamPlay1819<- na.omit(EPLCorTeamPlay1819)
plot(EPLCorTeamPlay1819)
cor(EPLCorTeamPlay1819, use = "pairwise.complete.obs")
corrplot(cor(EPLCorTeamPlay1819), method = 'color', addCoef.col =  "grey",use = "pairwise.complete.obs")

##Arsenal
##2017-18
##Plotting Attacking for Arsenal 2017-2018
EPLCorAttArsenal1718<- Arsenal1718
EPLCorAttArsenal1718 = subset(EPLCorAttArsenal1718, select = c(Age, Gls_By_Player,PK_By_Player, Player_SH, Player_SoT, Player_FK, Passes_Into_Final_Third, Passes_Into_Penalty_Area, Crosses_Into_Penalty_Area, Succ_Dribbles, Succ_Players_Dribbled_Past))
colSums(is.na(EPLCorAttArsenal1718))
EPLCorAttArsenal1718<- na.omit(EPLCorAttArsenal1718)
plot(EPLCorAttArsenal1718)
cor(EPLCorAttArsenal1718, use = "pairwise.complete.obs")
corrplot(cor(EPLCorAttArsenal1718), method = 'color', addCoef.col =  "grey",use = "pairwise.complete.obs")

##Plotting Defense for Arsenal 2017-2018
EPLCorDefArsenal1718<- Arsenal1718
EPLCorDefArsenal1718 =  subset(EPLCorDefArsenal1718, select = c(Age, TklW, Interception, Dribblers_Tkl, Dribblers_Att_tkl, Fls_Committed, Dribbled_Past_By_Opp))
colSums(is.na(EPLCorDefArsenal1718))
EPLCorDefArsenal1718<- na.omit(EPLCorDefArsenal1718)
plot(EPLCorDefArsenal1718)
cor(EPLCorDefArsenal1718, use = "pairwise.complete.obs")
corrplot(cor(EPLCorDefArsenal1718), method = 'color', addCoef.col =  "grey",use = "pairwise.complete.obs")

##Plotting Overall Team Player for Arsenal 2017-2018
EPLCorTeamPlayArsenal1718<- Arsenal1718
EPLCorTeamPlayArsenal1718 = subset(EPLCorTeamPlayArsenal1718, select = c(Age, Ast_By_Player,Player_KP_Ast, Player_Total_Cmp_Passes,Player_Short_Cmp_Passes, Player_Medium_Cmp_Passes,  Player_Long_Cmp_Passes, Player_Passes_Through_Ball, Player_Passes_FK, Crosses))
colSums(is.na(EPLCorTeamPlayArsenal1718))
EPLCorTeamPlayArsenal1718<- na.omit(EPLCorTeamPlayArsenal1718)
plot(EPLCorTeamPlayArsenal1718)
cor(EPLCorTeamPlayArsenal1718, use = "pairwise.complete.obs")
corrplot(cor(EPLCorTeamPlayArsenal1718), method = 'color', addCoef.col =  "grey",use = "pairwise.complete.obs")

##2018-19
##Plotting Attacking for Arsenal 2018-2019
EPLCorAttkArsenal1819<- Arsenal1819
EPLCorAttkArsenal1819 = subset(EPLCorAttkArsenal1819, select = c(Age, Gls_By_Player,PK_By_Player, Player_SH, Player_SoT, Player_FK, Passes_Into_Final_Third, Passes_Into_Penalty_Area, Crosses_Into_Penalty_Area, Succ_Dribbles, Succ_Players_Dribbled_Past))
colSums(is.na(EPLCorAttkArsenal1819))
EPLCorAttkArsenal1819<- na.omit(EPLCorAttkArsenal1819)
plot(EPLCorAttkArsenal1819)
cor(EPLCorAttkArsenal1819, use = "pairwise.complete.obs")
corrplot(cor(EPLCorAttkArsenal1819), method = 'color', addCoef.col = "grey", use = "complete.obs")

##Plotting Defense for Arsenal 2018-2019
EPLCorDefArsenal1819<- Arsenal1819
EPLCorDefArsenal1819 =  subset(EPLCorDefArsenal1819, select = c(Age, TklW, Interception, Dribblers_Tkl, Dribblers_Att_tkl, Fls_Committed, Dribbled_Past_By_Opp))
colSums(is.na(EPLCorDefArsenal1819))
EPLCorDefArsenal1819<- na.omit(EPLCorDefArsenal1819)
plot(EPLCorDefArsenal1819)
cor(EPLCorDefArsenal1819, use = "pairwise.complete.obs")
corrplot(cor(EPLCorDefArsenal1819), method = 'color', addCoef.col =  "grey",use = "pairwise.complete.obs")

##Plotting Overall Team Player Arsenal EPL 2018-2019
EPLCorTeamPlayArsenal1819<- Arsenal1819
EPLCorTeamPlayArsenal1819 = subset(EPLCorTeamPlayArsenal1819, select = c(Age, Ast_By_Player,Player_KP_Ast, Player_Total_Cmp_Passes,Player_Short_Cmp_Passes, Player_Medium_Cmp_Passes,  Player_Long_Cmp_Passes, Player_Passes_Through_Ball, Player_Passes_FK, Crosses))
colSums(is.na(EPLCorTeamPlayArsenal1819))
EPLCorTeamPlayArsenal1819<- na.omit(EPLCorTeamPlayArsenal1819)
plot(EPLCorTeamPlayArsenal1819)
cor(EPLCorTeamPlayArsenal1819, use = "pairwise.complete.obs")
corrplot(cor(EPLCorTeamPlayArsenal1819), method = 'color', addCoef.col =  "grey",use = "pairwise.complete.obs")

##Manchester City
##2017-18
##Plotting Attacking for Manchester City 2017-2018
EPLCorAttManCity1718<- ManchesterCity1718
EPLCorAttManCity1718 = subset(EPLCorAttManCity1718, select = c(Age, Gls_By_Player,PK_By_Player, Player_SH, Player_SoT, Player_FK, Passes_Into_Final_Third, Passes_Into_Penalty_Area, Crosses_Into_Penalty_Area, Succ_Dribbles, Succ_Players_Dribbled_Past))
colSums(is.na(EPLCorAttManCity1718))
EPLCorAttManCity1718<- na.omit(EPLCorAttManCity1718)
plot(EPLCorAttManCity1718)
cor(EPLCorAttManCity1718, use = "pairwise.complete.obs")
corrplot(cor(EPLCorAttManCity1718), method = 'color', addCoef.col =  "grey",use = "complete.obs")

##Plotting Defense for Manchester City 2017-2018
EPLCorDefManCity1718<- ManchesterCity1718
EPLCorDefManCity1718 =  subset(EPLCorDefManCity1718, select = c(Age, TklW, Interception, Dribblers_Tkl, Dribblers_Att_tkl, Fls_Committed, Dribbled_Past_By_Opp))
colSums(is.na(EPLCorDefManCity1718))
EPLCorDefManCity1718<- na.omit(EPLCorDefManCity1718)
plot(EPLCorDefManCity1718)
cor(EPLCorDefManCity1718, use = "pairwise.complete.obs")
corrplot(cor(EPLCorDefManCity1718), method = 'color', addCoef.col =  "grey",use = "pairwise.complete.obs")

##Plotting Overall Team Player for Manchester City 2017-2018
EPLCorTeamPlayManCity1718<- ManchesterCity1718
EPLCorTeamPlayManCity1718 = subset(EPLCorTeamPlayManCity1718, select = c(Age, Ast_By_Player,Player_KP_Ast, Player_Total_Cmp_Passes,Player_Short_Cmp_Passes, Player_Medium_Cmp_Passes,  Player_Long_Cmp_Passes, Player_Passes_Through_Ball, Player_Passes_FK, Crosses))
colSums(is.na(EPLCorTeamPlayManCity1718))
EPLCorTeamPlayManCity1718<- na.omit(EPLCorTeamPlayManCity1718)
plot(EPLCorTeamPlayManCity1718)
cor(EPLCorTeamPlayManCity1718, use = "pairwise.complete.obs")
corrplot(cor(EPLCorTeamPlayManCity1718), method = 'color', addCoef.col =  "grey", use = "pairwise.complete.obs")

##2018-19
##Plotting Attacking for Manchester City 2018-2019
EPLCorAttkManCity1819<- ManchesterCity1819
EPLCorAttkManCity1819 = subset(EPLCorAttkManCity1819, select = c(Age, Gls_By_Player,PK_By_Player, Player_SH, Player_SoT, Player_FK, Passes_Into_Final_Third, Passes_Into_Penalty_Area, Crosses_Into_Penalty_Area, Succ_Dribbles, Succ_Players_Dribbled_Past))
colSums(is.na(EPLCorAttkManCity1819))
EPLCorAttkManCity1819<- na.omit(EPLCorAttkManCity1819)
plot(EPLCorAttkManCity1819)
cor(EPLCorAttkManCity1819, use = "pairwise.complete.obs")
corrplot(cor(EPLCorAttkManCity1819), method = 'color', addCoef.col = "grey", use = "complete.obs")

##Plotting Defense for Manchester City 2018-2019
EPLCorDefManCity1819<- ManchesterCity1819
EPLCorDefManCity1819 =  subset(EPLCorDefManCity1819, select = c(Age, TklW, Interception, Dribblers_Tkl, Dribblers_Att_tkl, Fls_Committed, Dribbled_Past_By_Opp))
colSums(is.na(EPLCorDefManCity1819))
EPLCorDefManCity1819<- na.omit(EPLCorDefManCity1819)
plot(EPLCorDefManCity1819)
cor(EPLCorDefManCity1819, use = "pairwise.complete.obs")
corrplot(cor(EPLCorDefManCity1819), method = 'color', addCoef.col =  "grey",use = "pairwise.complete.obs")

##Plotting Overall Team Player for Manchester City 2018-2019
EPLCorTeamPlayManCity1819<- ManchesterCity1819
EPLCorTeamPlayManCity1819 = subset(EPLCorTeamPlayManCity1819, select = c(Age, Ast_By_Player,Player_KP_Ast, Player_Total_Cmp_Passes,Player_Short_Cmp_Passes, Player_Medium_Cmp_Passes,  Player_Long_Cmp_Passes, Player_Passes_Through_Ball, Player_Passes_FK, Crosses))
colSums(is.na(EPLCorTeamPlayManCity1819))
EPLCorTeamPlayManCity1819<- na.omit(EPLCorTeamPlayManCity1819)
plot(EPLCorTeamPlayManCity1819)
cor(EPLCorTeamPlayManCity1819, use = "pairwise.complete.obs")
corrplot(cor(EPLCorTeamPlayManCity1819), method = 'color', addCoef.col =  "grey",use = "pairwise.complete.obs")

##Manchester United
##Manchester Utd 2017-18 Plotting
ManUtd1718<- subset(ManchesterUtd1718)
ManUtd1718$Age<- as.factor(ManchesterUtd1718$Age)

##Attacking 2017-18
#Goals Scored
ManUtdgls1718<- aggregate(Gls_By_Player ~ Age, ManUtd1718, sum)
##Shots
ManUtdSH1718<- aggregate(Player_SH ~ Age, ManUtd1718, sum)
#Shots on Target
ManUtdSoT1718<- aggregate(Player_SoT ~ Age, ManUtd1718, sum)
#Passes into Final Third
ManUtdFinalThird1718<- aggregate(Passes_Into_Final_Third ~ Age, ManUtd1718, sum)
#Passes Into Penalty Area
ManUtdPenaltyArea1718<- aggregate(Passes_Into_Penalty_Area~ Age,ManUtd1718, sum)
#Successful Dribbles
ManUtdSuccessfulDribbles1718<- aggregate(Succ_Dribbles~ Age,ManUtd1718, sum)
#Successful Players Dribbled Past
ManUtdSuccessfulDribblesPast1718<- aggregate(Succ_Players_Dribbled_Past~ Age,ManUtd1718, sum)

##Attacking 2018-19
ManUtd1819<- subset(ManchesterUtd1819)
ManUtd1819$Age<- as.factor(ManUtd1819$Age)

##Manchester Utd 2018-19
#Goals Scored
ManUtdgls1819<- aggregate(Gls_By_Player ~ Age, ManUtd1819, sum)
ggplot(ManUtdgls1819, aes(Age, Gls_By_Player, label = Gls_By_Player)) + geom_bar(stat = "identity") + geom_text()
##Shots
ManUtdSH1819<- aggregate(Player_SH ~ Age, ManUtd1819, sum)
#Shots on Target
ManUtdSoT1819<- aggregate(Player_SoT ~ Age, ManUtd1819, sum)
#Passes into Final Third
ManUtdFinalThird1819<- aggregate(Passes_Into_Final_Third ~ Age, ManUtd1819, sum)
#Passes Into Penalty Area
ManUtdPenaltyArea1819<- aggregate(Passes_Into_Penalty_Area~ Age,ManUtd1819, sum)
#Successful Dribbles
ManUtdSuccessfulDribbles1819<- aggregate(Succ_Dribbles~ Age,ManUtd1819, sum)
#Successful Players Dribbled Past
ManUtdSuccessfulDribblesPast1819<- aggregate(Succ_Players_Dribbled_Past~ Age,ManUtd1819, sum)

#Defensive 2017-18
#Tackles Won
ManUtdTKlW11718<- aggregate(TklW~ Age,ManUtd1718, sum)
#Interceptions
ManUtdInterceptions1718<- aggregate(Interception~ Age,ManUtd1718, sum)
#Dribblers Tackled
ManUtdDribblersTkld1718<- aggregate(Dribblers_Tkl~ Age,ManUtd1718, sum)
#Fouls Committed
ManUtdFlsCommitted1718<- aggregate(Fls_Committed~ Age,ManUtd1718, sum)
#Dribbled Past by Opponent
ManUtdDribbledPastOpp1718<- aggregate(Dribbled_Past_By_Opp~ Age,ManUtd1718, sum)

#Defensive 2018-19
#Tackles Won
ManUtdTKlW1819<- aggregate(TklW~ Age,ManUtd1819, sum)
#Interceptions
ManUtdInterceptions1819<- aggregate(Interception~ Age,ManUtd1819, sum)
#Dribblers Tackled
ManUtdDribblersTkld1819<- aggregate(Dribblers_Tkl~ Age,ManUtd1819, sum)
#Fouls Committed
ManUtdFlsCommitted1819<- aggregate(Fls_Committed~ Age,ManUtd1819, sum)
#Dribbled Past by Opponent
ManUtdDribbledPastOpp1819<- aggregate(Dribbled_Past_By_Opp~ Age,ManUtd1819, sum)

#Overall Team Play 2017-18
#Assists
ManUtdAssists1718<- aggregate(Ast_By_Player~ Age,ManUtd1718, sum)
#Key Pass Assists
ManUtdKPAst1718<- aggregate(Player_KP_Ast~ Age,ManUtd1718, sum)

#Total Completed Passes
ManUtdTotalCmp1718<- aggregate(Player_Total_Cmp_Passes~ Age,ManUtd1718, sum)
#Short Completed Passes
ManUtdShortCmp1718<- aggregate(Player_Short_Cmp_Passes~ Age,ManUtd1718, sum)
#Medium Completed Passes
ManUtdMediumCmp1718<- aggregate(Player_Medium_Cmp_Passes~ Age,ManUtd1718, sum)
#Long Completed Passes
ManUtdLongCmp1718<- aggregate(Player_Long_Cmp_Passes~ Age,ManUtd1718, sum)
#Through Balls
ManUtdThroughBallsCmp1718<- aggregate(Player_Passes_Through_Ball~ Age,ManUtd1718, sum)
#Crosses
ManUtdCrossesCmp1718<- aggregate(Crosses~ Age,ManUtd1718, sum)

##Combined Passes 1718
ManUtdPassesTotal1718 = left_join(ManUtdShortCmp1718, ManUtdMediumCmp1718, by = c("Age"))
ManUtdPassesCmpTotal1718<- left_join(ManUtdPassesTotal1718, ManUtdLongCmp1718, by = c("Age"))
ManUtdPassesCmpTotal1718<- melt(ManUtdPassesCmpTotal1718, id.vars = 'Age')
ggplot(ManUtdPassesCmpTotal1718, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge')


#Overall Team Play 2018-19
#Assists
ManUtdAssists1819<- aggregate(Ast_By_Player~ Age,ManUtd1819, sum)
#Key Pass Assists
ManUtdKPAst1819<- aggregate(Player_KP_Ast~ Age,ManUtd1819, sum)
#Total Completed Passes
ManUtdTotalCmp1819<- aggregate(Player_Total_Cmp_Passes~ Age,ManUtd1819, sum)
##Combined Total Passes 
ManUtdTotalCmpPasses<- left_join(ManUtdTotalCmp1718, ManUtdTotalCmp1819, by = c('Age'))
ManUtdTotalCmpPasses<- melt(ManUtdTotalCmpPasses, id.vars = 'Age')
#Short Completed Passes
ManUtdShortCmp1819<- aggregate(Player_Short_Cmp_Passes~ Age,ManUtd1819, sum)
#Medium Completed Passes
ManUtdMediumCmp1819<- aggregate(Player_Medium_Cmp_Passes~ Age,ManUtd1819, sum)
#Long Completed Passes
ManUtdLongCmp1819<- aggregate(Player_Long_Cmp_Passes~ Age,ManUtd1819, sum)
#Through Balls
ManUtdThroughBallsCmp1819<- aggregate(Player_Passes_Through_Ball~ Age,ManUtd1819, sum)
#Crosses
ManUtdCrossesCmp1819<- aggregate(Crosses~ Age,ManUtd1819, sum)
#Combined Passes 2018-19
ManUtdPassesTotal1819 = left_join(ManUtdShortCmp1819, ManUtdMediumCmp1819, by = c("Age"))
ManUtdPassesCmpTotal1819<- left_join(ManUtdPassesTotal1819, ManUtdLongCmp1819, by = c("Age"))
ManUtdPassesCmpTotal1819<- melt(ManUtdPassesCmpTotal1819, id.vars = 'Age')


##2017-18
##Plotting Attacking for Manchester United 2017-2018
EPLCorAttManchesterUtd1718<- ManchesterUtd1718
EPLCorAttManchesterUtd1718 = subset(EPLCorAttManchesterUtd1718, select = c(Age, Gls_By_Player,PK_By_Player, Player_SH, Player_SoT, Player_FK, Passes_Into_Final_Third, Passes_Into_Penalty_Area, Crosses_Into_Penalty_Area, Succ_Dribbles, Succ_Players_Dribbled_Past))
colSums(is.na(EPLCorAttManchesterUtd1718))
EPLCorAttManchesterUtd1718<- na.omit(EPLCorAttManchesterUtd1718)
plot(EPLCorAttManchesterUtd1718)
cor(EPLCorAttManchesterUtd1718, use = "pairwise.complete.obs")
corrplot(cor(EPLCorAttManchesterUtd1718), method = 'color', addCoef.col =  "grey",use = "complete.obs")

##Plotting Defense for Manchester United 2017-2018
EPLCorDefManchesterUtd1718<- ManchesterUtd1718
EPLCorDefManchesterUtd1718 =  subset(EPLCorDefManchesterUtd1718, select = c(Age, TklW, Interception, Dribblers_Tkl, Dribblers_Att_tkl, Fls_Committed, Dribbled_Past_By_Opp))
colSums(is.na(EPLCorDefManchesterUtd1718))
EPLCorDefManchesterUtd1718<- na.omit(EPLCorDefManchesterUtd1718)
plot(EPLCorDefManchesterUtd1718)
cor(EPLCorDefManchesterUtd1718, use = "pairwise.complete.obs")
corrplot(cor(EPLCorDefManchesterUtd1718), method = 'color', addCoef.col =  "grey",use = "pairwise.complete.obs")

##Plotting Overall Team Player Manchester United EPL 2017-2018
EPLCorTeamPlayManchesterUtd1718<- ManchesterUtd1718
EPLCorTeamPlayManchesterUtd1718 = subset(EPLCorTeamPlayManchesterUtd1718, select = c(Age, Ast_By_Player,Player_KP_Ast, Player_Total_Cmp_Passes,Player_Short_Cmp_Passes, Player_Medium_Cmp_Passes,  Player_Long_Cmp_Passes, Player_Passes_Through_Ball, Player_Passes_FK, Crosses))
colSums(is.na(EPLCorTeamPlayManchesterUtd1718))
EPLCorTeamPlayManchesterUtd1718<- na.omit(EPLCorTeamPlayManchesterUtd1718)
plot(EPLCorTeamPlayManchesterUtd1718)
cor(EPLCorTeamPlayManchesterUtd1718, use = "pairwise.complete.obs")
corrplot(cor(EPLCorTeamPlayManchesterUtd1718), method = 'color', addCoef.col =  "grey", use = "pairwise.complete.obs")

##2018-19
##Plotting Attacking for Manchester United 2018-2019
EPLCorAttkManchesterUtd1819<- ManchesterUtd1819
EPLCorAttkManchesterUtd1819 = subset(EPLCorAttkManchesterUtd1819, select = c(Age, Gls_By_Player,PK_By_Player, Player_SH, Player_SoT, Player_FK, Passes_Into_Final_Third, Passes_Into_Penalty_Area, Crosses_Into_Penalty_Area, Succ_Dribbles, Succ_Players_Dribbled_Past))
colSums(is.na(EPLCorAttkManchesterUtd1819))
EPLCorAttkManchesterUtd1819<- na.omit(EPLCorAttkManchesterUtd1819)
plot(EPLCorAttkManchesterUtd1819)
cor(EPLCorAttkManchesterUtd1819, use = "pairwise.complete.obs")
corrplot(cor(EPLCorAttkManchesterUtd1819), method = 'color', addCoef.col = "grey", use = "complete.obs")

##Plotting Defense for Manchester United 2018-2019
EPLCorDefManchesterUtd1819<- ManchesterUtd1819
EPLCorDefManchesterUtd1819 =  subset(EPLCorDefManchesterUtd1819, select = c(Age, TklW, Interception, Dribblers_Tkl, Dribblers_Att_tkl, Fls_Committed, Dribbled_Past_By_Opp))
colSums(is.na(EPLCorDefManchesterUtd1819))
EPLCorDefManchesterUtd1819<- na.omit(EPLCorDefManchesterUtd1819)
plot(EPLCorDefManchesterUtd1819)
cor(EPLCorDefManchesterUtd1819, use = "pairwise.complete.obs")
corrplot(cor(EPLCorDefManchesterUtd1819), method = 'color', addCoef.col =  "grey",use = "pairwise.complete.obs")

##Plotting Overall Team Player for Manchester United 2018-2019
EPLCorTeamPlayManchesterUtd1819<- ManchesterUtd1819
EPLCorTeamPlayManchesterUtd1819 = subset(EPLCorTeamPlayManchesterUtd1819, select = c(Age, Ast_By_Player,Player_KP_Ast, Player_Total_Cmp_Passes,Player_Short_Cmp_Passes, Player_Medium_Cmp_Passes,  Player_Long_Cmp_Passes, Player_Passes_Through_Ball, Player_Passes_FK, Crosses))
colSums(is.na(EPLCorTeamPlayManchesterUtd1819))
EPLCorTeamPlayManchesterUtd1819<- na.omit(EPLCorTeamPlayManchesterUtd1819)
plot(EPLCorTeamPlayManchesterUtd1819)
cor(EPLCorTeamPlayManchesterUtd1819, use = "pairwise.complete.obs")
corrplot(cor(EPLCorTeamPlayManchesterUtd1819), method = 'color', addCoef.col =  "grey",use = "pairwise.complete.obs")

##Liverpool
Liv1718<- subset(EPLLeague1718, Team_Name=="Liverpool")
Liv1819<- subset(EPLLeague1819, Team_Name=="Liverpool")

##Liverpool 2017-18 Plotting
Liverpool1718<- subset(Liverpool1718)
Liverpool1718$Age<- as.factor(Liverpool1718$Age)

##Attacking 2017-18
#Goals Scored
Liverpoolgls1718<- aggregate(Gls_By_Player ~ Age, Liverpool1718, sum)
##Shots
LiverpoolSH1718<- aggregate(Player_SH ~ Age, Liverpool1718, sum)
#Shots on Target
LiverpoolSoT1718<- aggregate(Player_SoT ~ Age, Liverpool1718, sum)
#Passes into Final Third
LiverpoolFinalThird1718<- aggregate(Passes_Into_Final_Third ~ Age, Liverpool1718, sum)
#Passes Into Penalty Area
LiverpoolPenaltyArea1718<- aggregate(Passes_Into_Penalty_Area~ Age,Liverpool1718, sum)
#Successful Dribbles
LiverpoolSuccessfulDribbles1718<- aggregate(Succ_Dribbles~ Age,Liverpool1718, sum)
#Successful Players Dribbled Past
LiverpoolSuccessfulDribblesPast1718<- aggregate(Succ_Players_Dribbled_Past~ Age,Liverpool1718, sum)

##Attacking 2018-19
Liverpool1819<- subset(Liverpool1819)
Liverpool1819$Age<- as.factor(Liverpool1819$Age)

##Liverpool 2018-19
#Goals Scored
Liverpoolgls1819<- aggregate(Gls_By_Player ~ Age, Liverpool1819, sum)
##Shots
LiverpoolSH1819<- aggregate(Player_SH ~ Age, Liverpool1819, sum)
#Shots on Target
LiverpoolSoT1819<- aggregate(Player_SoT ~ Age, Liverpool1819, sum)
#Passes into Final Third
LiverpoolFinalThird1819<- aggregate(Passes_Into_Final_Third ~ Age, Liverpool1819, sum)
#Passes Into Penalty Area
LiverpoolPenaltyArea1819<- aggregate(Passes_Into_Penalty_Area~ Age,Liverpool1819, sum)
#Successful Dribbles
LiverpoolSuccessfulDribbles1819<- aggregate(Succ_Dribbles~ Age,Liverpool1819, sum)
#Successful Players Dribbled Past
LiverpoolSuccessfulDribblesPast1819<- aggregate(Succ_Players_Dribbled_Past~ Age,Liverpool1819, sum)

#Defensive 2017-18
#Tackles Won
LiverpoolTKlW11718<- aggregate(TklW~ Age,Liverpool1718, sum)
#Interceptions
LiverpoolInterceptions1718<- aggregate(Interception~ Age,Liverpool1718, sum)
#Dribblers Tackled
LiverpoolDribblersTkld1718<- aggregate(Dribblers_Tkl~ Age,Liverpool1718, sum)
#Fouls Committed
LiverpoolFlsCommitted1718<- aggregate(Fls_Committed~ Age,Liverpool1718, sum)
#Dribbled Past by Opponent
LiverpoolDribbledPastOpp1718<- aggregate(Dribbled_Past_By_Opp~ Age,Liverpool1718, sum)

#Defensive 2018-19
#Tackles Won
LiverpoolTKlW1819<- aggregate(TklW~ Age,Liverpool1819, sum)
#Interceptions
LiverpoolInterceptions1819<- aggregate(Interception~ Age,Liverpool1819, sum)
#Dribblers Tackled
LiverpoolDribblersTkld1819<- aggregate(Dribblers_Tkl~ Age,Liverpool1819, sum)
#Fouls Committed
LiverpoolFlsCommitted1819<- aggregate(Fls_Committed~ Age,Liverpool1819, sum)
#Dribbled Past by Opponent
LiverpoolDribbledPastOpp1819<- aggregate(Dribbled_Past_By_Opp~ Age,Liverpool1819, sum)

#Overall Team Play 2017-18
#Assists
LiverpoolAssists1718<- aggregate(Ast_By_Player~ Age,Liverpool1718, sum)
#Key Pass Assists
LiverpoolKPAst1718<- aggregate(Player_KP_Ast~ Age,Liverpool1718, sum)
#Total Completed Passes
LiverpoolTotalCmp1718<- aggregate(Player_Total_Cmp_Passes~ Age,Liverpool1718, sum)
#Short Completed Passes
LiverpoolShortCmp1718<- aggregate(Player_Short_Cmp_Passes~ Age,Liverpool1718, sum)
#Medium Completed Passes
LiverpoolMediumCmp1718<- aggregate(Player_Medium_Cmp_Passes~ Age,Liverpool1718, sum)
#Long Completed Passes
LiverpoolLongCmp1718<- aggregate(Player_Long_Cmp_Passes~ Age,Liverpool1718, sum)
#Through Balls
LiverpoolThroughBallsCmp1718<- aggregate(Player_Passes_Through_Ball~ Age,Liverpool1718, sum)
#Crosses
LiverpoolCrossesCmp1718<- aggregate(Crosses~ Age,Liverpool1718, sum)
##Combined Passes 1718
LiverpoolPassesTotal1718 = left_join(LiverpoolShortCmp1718, LiverpoolMediumCmp1718, by = c("Age"))
LiverpoolPassesCmpTotal1718<- left_join(LiverpoolPassesTotal1718, LiverpoolLongCmp1718, by = c("Age"))
LiverpoolPassesCmpTotal1718<- melt(LiverpoolPassesCmpTotal1718, id.vars = 'Age')
ggplot(LiverpoolPassesCmpTotal1718, aes(x = Age, y = value, fill= variable)) + geom_bar(stat = 'identity', position = 'dodge')


#Overall Team Play 2018-19
#Assists
LiverpoolAssists1819<- aggregate(Ast_By_Player~ Age,Liverpool1819, sum)
#Key Pass Assists
LiverpoolKPAst1819<- aggregate(Player_KP_Ast~ Age,Liverpool1819, sum)
#Total Completed Passes
LiverpoolTotalCmp1819<- aggregate(Player_Total_Cmp_Passes~ Age,Liverpool1819, sum)
##Combined Total Passes 
LiverpoolTotalCmpPasses<- left_join(LiverpoolTotalCmp1718, LiverpoolTotalCmp1819, by = c('Age'))
LiverpoolTotalCmpPasses<- melt(LiverpoolTotalCmpPasses, id.vars = 'Age')
#Short Completed Passes
LiverpoolShortCmp1819<- aggregate(Player_Short_Cmp_Passes~ Age,Liverpool1819, sum)
#Medium Completed Passes
LiverpoolMediumCmp1819<- aggregate(Player_Medium_Cmp_Passes~ Age,Liverpool1819, sum)
#Long Completed Passes
LiverpoolLongCmp1819<- aggregate(Player_Long_Cmp_Passes~ Age,Liverpool1819, sum)
#Through Balls
LiverpoolThroughBallsCmp1819<- aggregate(Player_Passes_Through_Ball~ Age,Liverpool1819, sum)
#Crosses
LiverpoolCrossesCmp1819<- aggregate(Crosses~ Age,Liverpool1819, sum)
#Combined Passes 2018-19
LiverpoolPassesTotal1819 = left_join(LiverpoolShortCmp1819, LiverpoolMediumCmp1819, by = c("Age"))
LiverpoolPassesCmpTotal1819<- left_join(LiverpoolPassesTotal1819, LiverpoolLongCmp1819, by = c("Age"))
LiverpoolPassesCmpTotal1819<- melt(LiverpoolPassesCmpTotal1819, id.vars = 'Age')

##2017-18
##Plotting Attacking for Liverpool 2017-2018
EPLCorAttLiv1718<- Liv1718
EPLCorAttLiv1718 = subset(EPLCorAttLiv1718, select = c(Age, Gls_By_Player,PK_By_Player, Player_SH, Player_SoT, Player_FK, Passes_Into_Final_Third, Passes_Into_Penalty_Area, Crosses_Into_Penalty_Area, Succ_Dribbles, Succ_Players_Dribbled_Past))
colSums(is.na(EPLCorAttLiv1718))
EPLCorAttLiv1718<- na.omit(EPLCorAttLiv1718)
plot(EPLCorAttLiv1718)
cor(EPLCorAttLiv1718, use = "pairwise.complete.obs")
corrplot(cor(EPLCorAttLiv1718), method = 'color', addCoef.col =  "grey",use = "complete.obs")

##Plotting Defense for Liverpool 2017-2018
EPLCorDefLiv1718<- Liv1718
EPLCorDefLiv1718 =  subset(EPLCorDefLiv1718, select = c(Age, TklW, Interception, Dribblers_Tkl, Dribblers_Att_tkl, Fls_Committed, Dribbled_Past_By_Opp))
colSums(is.na(EPLCorDefLiv1718))
EPLCorDefLiv1718<- na.omit(EPLCorDefLiv1718)
plot(EPLCorDefLiv1718)
cor(EPLCorDefLiv1718, use = "pairwise.complete.obs")
corrplot(cor(EPLCorDefLiv1718), method = 'color', addCoef.col =  "grey",use = "pairwise.complete.obs")

##Plotting Overall Team Player for Liverpool 2017-2018
EPLCorTeamPlayLiv1718<- Liv1718
EPLCorTeamPlayLiv1718 = subset(EPLCorTeamPlayLiv1718, select = c(Age, Ast_By_Player,Player_KP_Ast, Player_Total_Cmp_Passes,Player_Short_Cmp_Passes, Player_Medium_Cmp_Passes,  Player_Long_Cmp_Passes, Player_Passes_Through_Ball, Player_Passes_FK, Crosses))
colSums(is.na(EPLCorTeamPlayLiv1718))
EPLCorTeamPlayLiv1718<- na.omit(EPLCorTeamPlayLiv1718)
plot(EPLCorTeamPlayLiv1718)
cor(EPLCorTeamPlayLiv1718, use = "pairwise.complete.obs")
corrplot(cor(EPLCorTeamPlayLiv1718), method = 'color', addCoef.col =  "grey", use = "pairwise.complete.obs")

##2018-19
##Plotting Attacking for Liverpool 2018-2019
EPLCorAttkLiv1819<- Liv1819
EPLCorAttkLiv1819 = subset(EPLCorAttkLiv1819, select = c(Age, Gls_By_Player,PK_By_Player, Player_SH, Player_SoT, Player_FK, Passes_Into_Final_Third, Passes_Into_Penalty_Area, Crosses_Into_Penalty_Area, Succ_Dribbles, Succ_Players_Dribbled_Past))
colSums(is.na(EPLCorAttkLiv1819))
EPLCorAttkLiv1819<- na.omit(EPLCorAttkLiv1819)
plot(EPLCorAttkLiv1819)
cor(EPLCorAttkLiv1819, use = "pairwise.complete.obs")
corrplot(cor(EPLCorAttkLiv1819), method = 'color', addCoef.col = "grey", use = "complete.obs")

##Plotting Defense for Liverpool 2018-2019
EPLCorDefLiv1819<- Liv1819
EPLCorDefLiv1819 =  subset(EPLCorDefLiv1819, select = c(Age, TklW, Interception, Dribblers_Tkl, Dribblers_Att_tkl, Fls_Committed, Dribbled_Past_By_Opp))
colSums(is.na(EPLCorDefLiv1819))
EPLCorDefLiv1819<- na.omit(EPLCorDefLiv1819)
plot(EPLCorDefLiv1819)
cor(EPLCorDefLiv1819, use = "pairwise.complete.obs")
corrplot(cor(EPLCorDefLiv1819), method = 'color', addCoef.col =  "grey",use = "pairwise.complete.obs")

##Plotting Overall Team Player Liverpool EPL 2018-2019
EPLCorTeamPlayLiv1819<- Liv1819
EPLCorTeamPlayLiv1819 = subset(EPLCorTeamPlayLiv1819, select = c(Age, Ast_By_Player,Player_KP_Ast, Player_Total_Cmp_Passes,Player_Short_Cmp_Passes, Player_Medium_Cmp_Passes,  Player_Long_Cmp_Passes, Player_Passes_Through_Ball, Player_Passes_FK, Crosses))
colSums(is.na(EPLCorTeamPlayLiv1819))
EPLCorTeamPlayLiv1819<- na.omit(EPLCorTeamPlayLiv1819)
plot(EPLCorTeamPlayLiv1819)
cor(EPLCorTeamPlayLiv1819, use = "pairwise.complete.obs")
corrplot(cor(EPLCorTeamPlayLiv1819), method = 'color', addCoef.col =  "grey",use = "pairwise.complete.obs")

##Variable Selection
EPLFinalMasterList2<- EPLFinalMasterList
EPLFinalMasterList2 = subset(EPLFinalMasterList2, select = -c(Position_2, Player_Name, Audience_Attendance, Birth_Year, Team_MP, Team_Wins, Team_Season_End_Pts, Team_Ties, Team_Losses, Team_GF, Team_GA))
EPLFinalMasterList2$Season_End_Team_Ranking<- as.factor(EPLFinalMasterList2$Season_End_Team_Ranking)
EPLFinalMasterList2$Team_Name<- as.factor(EPLFinalMasterList2$Team_Name)
EPLFinalMasterList2$Nation<- as.factor(EPLFinalMasterList2$Nation)
EPLFinalMasterList2$Position_1<- as.factor(EPLFinalMasterList2$Position_1)
colSums(is.na(EPLFinalMasterList2))
EPLFinalMasterList2<- na.omit(EPLFinalMasterList2)
EPLFinalMasterList2

##Backward Elimination
FitAll <- lm(Age ~ ., data = EPLFinalMasterList2)
summary(FitAll)
formula(FitAll)
step(FitAll, direction = "backward")
##Forward Selection
Fitstart = lm(Age ~ 1, data = EPLFinalMasterList2)
summary(Fitstart)
step(Fitstart, direction = "forward", scope = formula(FitAll))
##Step Wise
step(Fitstart, direction = "both", scope = formula(FitAll))

## Modelling Random Forest
set.seed(40)
EPLUpdatedMasterList<- EPLFinalMasterList
EPLUpdatedMasterList = subset(EPLUpdatedMasterList, select = c(Age, Season_Year,Team_Name, Ast_By_Player,Player_KP_Ast, Player_Total_Cmp_Passes,Player_Short_Cmp_Passes, Player_Medium_Cmp_Passes,  Player_Long_Cmp_Passes, Player_Passes_Through_Ball, Player_Passes_FK, Crosses, TklW, Interception, Dribblers_Tkl, Dribblers_Att_tkl, Fls_Committed, Dribbled_Past_By_Opp, Gls_By_Player,PK_By_Player, Player_SH, Player_SoT, Player_FK, Passes_Into_Final_Third, Passes_Into_Penalty_Area, Crosses_Into_Penalty_Area, Succ_Dribbles, Succ_Players_Dribbled_Past, Season_End_Team_Ranking))
EPLUpdatedMasterList$Season_End_Team_Ranking<- as.factor(EPLUpdatedMasterList$Season_End_Team_Ranking)
EPLUpdatedMasterList$Team_Name<- as.factor(EPLUpdatedMasterList$Team_Name)
colSums(is.na(EPLUpdatedMasterList))
EPLUpdatedMasterList<- na.omit(EPLUpdatedMasterList)
EPLUpdatedMasterList
apply(EPLUpdatedMasterList, 2,function(x) length(unique(x)))

##Creating training and test data sets
independant =  createDataPartition(EPLUpdatedMasterList$Season_End_Team_Ranking, p = 2/3, list = FALSE)
TrainDF<- EPLUpdatedMasterList[independant,]
TestDF<- EPLUpdatedMasterList[-independant,]
parameterGrid<- expand.grid(mtry = c(2,3,4,5))
ControlParamteres<- trainControl(method = "cv", number = 10, savePredictions = TRUE, classProbs = TRUE)
levels(TrainDF$Season_End_Team_Ranking) <- c("first_place", "second_place","third_place","fourth_place","fifth_place","sixth_place","seventh_place","eighth_place","nineth_place","tenth_place","eleventh_place","twleveth_place", "thirteenth_place","fourteenth_place","fifteenth_place","sixteenth_place","seventeenth_place","eighteenth_place","nineteenth_place","twenty_place")
ModelRandom<- train(Season_End_Team_Ranking ~ .,  data = TrainDF, method = "rf", trControl = ControlParamteres, tuneGrid = parameterGrid)
ModelRandom
summary(ModelRandom)

##Prediction
prediction<- predict(ModelRandom, TestDF)
prediction

View(TrainDF)




