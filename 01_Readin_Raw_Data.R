# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# ProjectName:  Pfizer CAP Tracking
# Purpose:      Readin
# programmer:   Zhe Liu
# Date:         2020-08-12
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #


##---- Readin raw data ----
his.raw <- read.xlsx('02_Inputs/HIS Tracking 201801-202006-预测用.xlsx')

his1 <- his.raw %>% 
  mutate(ds = stri_paste(stri_sub(Date, 1, 4), '-', stri_sub(Date, 5, 6), '-01'), 
         ds = as.Date(ds)) %>% 
  select(ds, y = `门诊总人次数`)

holiday <- his1 %>% 
  filter(stri_sub(ds, 1, 4) == '2020', 
         stri_sub(ds, 6, 7) %in% c('01', '02', '03', '04', '05', '06')) %>% 
  mutate(holiday = 'COVID-19') %>% 
  select(ds, holiday)


model1 <- prophet(his1, 
                  growth = 'linear', 
                  yearly.seasonality = TRUE, 
                  weekly.seasonality = FALSE, 
                  daily.seasonality = FALSE, 
                  holidays = holiday)

model1.future <- make_future_dataframe(model1, periods = 18, freq = 'month')

forecast1 <- predict(model1, model1.future)

plot(model1, forecast1)

prophet_plot_components(model1, forecast1)


cv1 <- cross_validation(model1, horizon = 30.4, units = 'days', period = 30.4, initial = 515)
plot_cross_validation_metric(cv1, metric = 'mse')

cv2 <- cross_validation(model1, horizon = 182, units = 'days', period = 30.4, initial = 515)



