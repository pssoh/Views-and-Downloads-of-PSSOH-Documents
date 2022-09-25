# This document is created by Lena Milovanovic, a master student at the
# School of Electrical Engineering - University of Belgrade as part of
# her master internship in 2022 under the mentorship of PSSOH Editor
# Assoc. Prof. Nadica Miljkovic.

# The document summarizes and visualizes views and downloads for the 
# previous PSSOH conferences which are assessed on three occasions.

# R version
# platform       x86_64-w64-mingw32          
# arch           x86_64                      
# os             mingw32                     
# system         x86_64, mingw32             
# status                                     
# major          4                           
# minor          1.2                         
# year           2021                        
# month          11                          
# day            01                          
# svn rev        81115                       
# language       R                           
# version.string R version 4.1.2 (2021-11-01)
# nickname       Bird Hippie 

# setting the directory to the same path where the table is saved
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

# include required libraries
library(readODS)
library(ggplot2)
library(dplyr)

# read the first sheet and show scatter plot --------------------------------
dat <- read_ods("popularityPSSOH.ods", sheet = 1, col_names = TRUE, col_types = NULL,
                na = "", skip = 0, formula_as_formula = FALSE, range = NULL)
head(dat)
tail(dat)
str(dat)
View(dat)

datN <- c()
datN$title <- dat$title # title of the upload
datN$num <- dat$views3 # views
datN$numD <- dat$downloads3 # downloads
datN$year <- dat$year # year (in which the document is published)
datN <- data.frame(datN)

# number of views
x11()
datN %>%
  arrange(num) %>%
  mutate(title = factor(title, levels = title)) %>%
  filter(num > 500) %>%
  ggplot(aes(x = title, y = num)) +
  theme(text = element_text(size = 16)) +
  geom_point(size = 4) +
  coord_flip() +
  xlab("document title") +
  ylab("views")
ggsave("views.jpeg", plot = last_plot(), dpi = 300, height = 8.14, width = 16)

# number of downloads
x11()
datN %>%
        arrange(numD) %>%
        mutate(title = factor(title, levels = title)) %>%
        filter(numD > 500) %>%
        ggplot(aes(x = title, y = numD)) +
        theme(text = element_text(size = 16)) +
        geom_point(size = 4) +
        coord_flip() +
        xlab("document title") +
        ylab("downloads")
ggsave("downloads.jpeg", plot = last_plot(), dpi = 300, height = 8.14, width = 16)

# summary for 2017-2021
# views of documents with (1) and without (0) abstract
sum(dat$views3[dat$abstract == 1])
sum(dat$views3[dat$abstract == 0])

# views of documents with (1) and without (0) full paper
sum(dat$views3[dat$paper == 1]) 
sum(dat$views3[dat$paper == 0])

# views of documents with (1) and without (0) presentation
sum(dat$views3[dat$presentation == 1])
sum(dat$views3[dat$presentation == 0])

# views of documents in Serbian (1) and English (0)
sum(dat$views3[dat$serbian == 1]) / sum(dat$serbian == 1)
sum(dat$views3[dat$serbian == 0]) / sum(dat$serbian == 0)

# views by document type
df <- data.frame()
df <- data.frame(names = c("abstract", "paper", "presentation"))

df$value <- c(sum(dat$views3[dat$abstract == 1]),
              sum(dat$views3[dat$paper == 1]),
              sum(dat$views3[dat$presentation == 1]))

x11()
df %>%
        arrange(value) %>%
        mutate(names = factor(names, levels = names)) %>%
        ggplot(aes(x = names, y = value)) +
        theme(text = element_text(size = 16)) +
        geom_bar(stat = "identity", fill = "#f68060", alpha = .6, width = .4) +
        ylab("views") + coord_flip() + xlab("document type")
ggsave("docTypeViews.jpeg", plot = last_plot(), dpi = 300)

# views by number of versions (possible versions are 1, 2, 3, 4, 5, 8)
sum(dat$views3[dat$versions == 1])
sum(dat$views3[dat$versions == 2])
sum(dat$views3[dat$versions == 3])
sum(dat$views3[dat$versions == 4])
sum(dat$views3[dat$versions == 5])
sum(dat$views3[dat$versions == 8])

# views by year in which the document is published
df <- data.frame()
df <- data.frame(names = c("2018", "2019", "2020", "2021"))

df$value <- c(sum(dat$views3[dat$year == 2018]),
              sum(dat$views3[dat$year == 2019]),
              sum(dat$views3[dat$year == 2020]),
              sum(dat$views3[dat$year == 2021]))
df$names <- factor(df$names, levels = df$names[order(df$value)])

x11()
df %>%
        arrange(value) %>%
        ggplot(aes(x = names, y = value)) +
        theme(text = element_text(size = 16)) +
        geom_bar(stat = "identity", fill = "#f68060", alpha = .6, width = .4) +
        ylab("views") +
        xlab("conference year") +
        coord_flip()
ggsave("viewsByConferenceYear.jpeg", plot = last_plot(), dpi = 300)

# downloads by year in which the document is published
df <- data.frame()
df <- data.frame(names = c("2018", "2019", "2020", "2021"))

df$value <- c(sum(dat$downloads3[dat$year == 2018]),
              sum(dat$downloads3[dat$year == 2019]),
              sum(dat$downloads3[dat$year == 2020]),
              sum(dat$downloads3[dat$year == 2021]))
df$names <- factor(df$names, levels = df$names[order(df$value)])

x11()
df %>%
        arrange(value) %>%
        ggplot(aes(x = names, y = value)) +
        theme(text = element_text(size = 16)) +
        geom_bar(stat = "identity", fill = "#f68060", alpha = .6, width = .4) +
        ylab("downloads") +
        xlab("conference year") +
        coord_flip()
ggsave("downloadsByConferenceYear.jpeg", plot = last_plot(), dpi = 300)

# growth (the difference in views between the first and the second assessment)
dat$growth <- dat$views2 - dat$views1

x11()
dat %>%
  arrange(growth) %>%
  mutate(title = factor(title, levels = title)) %>%
  filter(growth > 20) %>%
  ggplot(aes(x = title, y = growth)) +
  theme(text = element_text(size = 16)) +
  geom_bar(stat = "identity", fill = "#f68060", alpha = .6, width = .4) +
  coord_flip()
ggsave("growth1.jpeg", plot = last_plot(), dpi = 300, height = 8.14, width = 16)

# growth (the difference in views between the third and the second assessment)
new <- dat
new$growth <- NULL
new <- new %>% filter(year %in% c(2018, 2019))
new$growth <- new$views3 - new$views2

x11()
new %>%
        arrange(growth) %>%
        mutate(title = factor(title, levels = title)) %>%
        filter(growth > 100) %>%
        ggplot(aes(x = title, y = growth)) +
        theme(text = element_text(size = 16)) +
        geom_bar(stat = "identity", fill = "#f68060", alpha = .6, width = .4) +
        coord_flip()
ggsave("growth2.jpeg", plot = last_plot(), dpi = 300, height = 8.14, width = 16)