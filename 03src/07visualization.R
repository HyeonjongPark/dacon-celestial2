library(car)




o_train %>% select(-type) %>% cor() %>%
   corrplot.mixed(upper = "ellipse", tl.cex=.8, tl.pos = 'lt', number.cex = .8)
#
# o_train$type = factor(o_train$type, level = col)
#
#
# # o_train %>% select(-type) %>%
# #   corrgram(lower.panel=panel.shade, upper.panel=panel.ellipse)
#
#
#
# set.seed(1)
# inTrain <- createDataPartition(o_train$type, p=.9, list = F)
#
#
#
# train <- o_train[inTrain,]
# str(train)
# valid <- o_train[-inTrain,]
# rm(inTrain)
#
#fwrite(train3, "./02preprocessing-data/train2.csv")





#train %>% skim() %>% kable()

# train %>% select(-type) %>% cor() %>%
#   corrplot.mixed(upper = "ellipse", tl.cex=.8, tl.pos = 'lt', number.cex = .8)

# train %>% select(-type) %>%
#   corrgram(lower.panel=panel.shade, upper.panel=panel.ellipse)








o_train %>% colnames
o_train %>% dim

set.seed(1)
inTrain <- createDataPartition(o_train$type, p=0.01, list = F)

train_sample <- o_train[inTrain,]
rm(inTrain)

train_sample

train_sample %>% group_by(type) %>% count()

colnames(train_sample)

ggplot(data = train_sample, aes(x = psfMag_u, y = psfMag_g)) + geom_point() +
  geom_smooth()

ggplot(data = train_sample, aes(x = psfMag_u, y = psfMag_r)) + geom_point() +
  geom_smooth()

ggplot(data = train_sample, aes(x = psfMag_u, y = psfMag_i)) + geom_point() +
  geom_smooth()

ggplot(data = train_sample, aes(x = psfMag_u, y = psfMag_z)) + geom_point() +
  geom_smooth()

ggplot(data = train_sample, aes(x = psfMag_i, y = psfMag_z)) + geom_point() +
  geom_smooth()


ggplot(data = train_sample, aes(x = psfMag_u), fill = type) + 
  geom_histogram(bins = 25)



ggplot(Wage, aes(x = education, y = wage)) +
  geom_jitter(alpha = 0.5) +
  facet_wrap( ~ jobclass) + 
  coord_flip()
