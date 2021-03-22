# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# ProjectName:  Pfizer CAP Tracking
# Purpose:      CAP Tracking and Forecast
# programmer:   Zhe Liu
# Date:         2020-08-12
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #


options(java.parameters = "-Xmx2048m",
        stringsAsFactors = FALSE)

##---- loading the required packages ----
suppressPackageStartupMessages({
  require(zip)
  require(openxlsx)
  require(readxl)
  require(writexl)
  require(RcppRoll)
  require(plyr)
  require(stringi)
  require(feather)
  require(RODBC)
  require(MASS)
  require(car)
  require(data.table)
  require(plotly)
  require(tidyverse)
  require(lubridate)
  require(RecordLinkage)
  require(digest)
  require(prophet)
})


##---- setup the directories ----
system("mkdir 01_Background 02_Inputs 03_Outputs 04_Codes 05_Internal_Review 06_Deliveries 07_Web_Page")
