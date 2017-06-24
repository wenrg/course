# load data
library(readr)
df = read.csv('dirty_data.csv', header=T)
<<<<<<< HEAD

fill_area = c('Birmingham', 'Coventry', 'Dudley', 'Sandwell', 'Solihull', 'Walsall', 'Wolverhampton')

random_area = sample(fill_area, nrow(df) - 1, replace=T, prob=c(0.15, 0.1, 0.2, 0.05, 0.12, 0.18, 0.2))

df[2:nrow(df),'Area'] = random_area
=======
#Populate the missing values in the Area variable with an appropriate values (Birmingham, Coventry, Dudley, Sandwell, Solihull, Walsall or Wolverhampton)




# Remove the “Strange HTML column”
remove(list = dirty_data$`Strange HTML`)

>>>>>>> 735e8e9fc363223bdfe1978a6a1779c5e13613b5
