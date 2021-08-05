# Deliverable 1: Linear Regression to Predict MPG
library(dplyr)
MechaCar_mpg <- read.csv('MechaCar_mpg.csv',check.names = F,stringsAsFactors = F)

MechaCar_lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg)
summary(MechaCar_lm)

# Deliverable 2: Create Visualizations for the Trip Analysis
SuspensionCoil <- read.csv('Suspension_Coil.csv',check.names = F,stringsAsFactors = F)
total_summary <- SuspensionCoil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), StandardDev=sd(PSI))
lot_summary <- SuspensionCoil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), StandardDev=sd(PSI), .groups="keep")

# Deliverable 3: T-Tests on Suspension Coils
library(tidyverse)
t.test(SuspensionCoil$PSI, mu=1500)
t.test(subset(SuspensionCoil, Manufacturing_Lot="Lot1")$PSI, mu=1500)
t.test(subset(SuspensionCoil, Manufacturing_Lot="Lot2")$PSI, mu=1500)
t.test(subset(SuspensionCoil, Manufacturing_Lot="Lot3")$PSI, mu=1500)
