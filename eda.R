library(googlesheets4)
library(data.table)
library(ggplot2)

sheet_url <- "https://docs.google.com/spreadsheets/d/1HcFstlJdQMlMEWhbdKXZWdAzR5RFMtj3kywLQcgkGPw/edit#gid=0"
my_sheet <- read_sheet(sheet_url, range = "DougScore!A4:T"
                       , col_names = c("ProductionDate"
                                       , "Make"
                                       , "Model"
                                       , "Styling"
                                       , "Acceleration"
                                       , "Handling"
                                       , "FunFactor"
                                       , "CoolFactor"
                                       , "WeekendTotal"
                                       , "Features"
                                       , "Comfort"
                                       , "Quality"
                                       , "Practicality"
                                       , "Value"
                                       , "DailyTotal"
                                       , "DOUGSCORE"
                                       , "VideoLink"
                                       , "FilmingLocationState"
                                       , "FilmingLocationCity"
                                       , "VehicleCountry"))


dt <- data.table(my_sheet)
dt[, Model := as.character(Model)]

ref_dt <- read.csv("./Car Dataset 1945-2020.csv")
ref_dt <- data.table(ref_dt)

setnames(ref_dt, "Modle", "Model")
dt <- merge(dt, ref_dt, by = c("Make", "Model"), all.x = T)

ggplot(dt) +
  geom_point(aes(x = capacity_cm3, y = DOUGSCORE))


