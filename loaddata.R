setwd("~/git/CourseProject2")
rm(list=ls())


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Figure out how to uniquify the data later


NEI <- NEI %>%
  mutate(year=as.character(year))
