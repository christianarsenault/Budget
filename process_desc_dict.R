#read in description dictionary and preprocess the text so that the results align

setwd("C:/Users/Christian/Projects/Living/Financial/Budget/src")

description_dict <- read_csv("../data/description_dict.csv")

new_description_dict <- description_dict %>% mutate(temp1=toupper(str_replace_all(Description, "[[:punct:]]", ""))) %>%
  mutate(temp2=str_replace_all(temp1," +"," ")) %>% 
  mutate(Description=str_replace_all(temp2, "[0-9]+", "")) %>% select(-c("temp1", "temp2")) %>% distinct()



#Here's some code to unduplicate the description dict
problem_cases <- description_dict %>% group_by(Description) %>% 
  filter(n() > 1)

write_csv(new_description_dict, path="../data/description_dict.csv")