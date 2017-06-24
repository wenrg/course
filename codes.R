# load data
df = read.csv('dirty_data.csv', header=T)
#Populate the missing values in the Area variable with an appropriate values (Birmingham, Coventry, Dudley, Sandwell, Solihull, Walsall or Wolverhampton)
