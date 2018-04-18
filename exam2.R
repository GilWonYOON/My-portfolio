class(welfare$sex)
table(welfare$sex)
table(welfare$income)
welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)
table(welfare$sex)
table(is.na(welfare$sex))
welfare$sex <- ifelse(welfare$sex == 1, "male","famale")
head(welfare$sex)
class(welfare$sex)
qplot(welfare$sex)
##?????? ????????? 
class(welfare$income)
table(welfare$income)
table(is.na(welfare$income))
summary(welfare$income)
qplot(welfare$income)
mean(welfare$income)
qplot(welfare$income) + xlim(0,1000)
# ????????? ?????? ?????? 
welfare %>% filter(income > 2000) %>% select(income)
qplot(welfare$income)
welfare %>% filter(income > 1000) %>% select(income)
welfare %>% filter(income == 0) %>% select(income)
welfare$income <- ifelse(welfare$income %in% c(0, 9999), NA,welfare$income)
table(welfare$income)
table(is.na(welfare$income)) # ??????

sex_income <- welfare %>%     # ????????? na ?????? ????????? ?????? ???????????? ?????? 
  filter(!is.na(income)) %>% 
  group_by(sex) %>% 
  summarise(income = mean(income))
  
sex_income # ?????? ?????? 
ggplot(data = sex_income, aes(x = sex, y = income)) + geom_col()
