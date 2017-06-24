# load data
df <- read.csv('dirty_data.csv', header=T)

#Populate the missing values in the Area variable with an appropriate values (Birmingham, Coventry, Dudley, Sandwell, Solihull, Walsall or Wolverhampton)
fill_area = c('Birmingham', 'Coventry', 'Dudley', 'Sandwell', 'Solihull', 'Walsall', 'Wolverhampton')
random_area = sample(fill_area, nrow(df)-1, replace=T, prob=c(0.15, 0.1, 0.2, 0.05, 0.12, 0.18, 0.2))
df[2:nrow(df),'Area'] = random_area

library("stringr")
# remove special characters
df$Street <- str_replace_all(df$Street,"[^[:alnum:]]", " ")
# trim leading and trailing space
df$Street <- str_replace_all(df$Street,"^\\s+|\\s+$", "")
# capitalize first letter of the street name
simpleCap = function(x){
  s = strsplit(x, " ")[[1]]
  paste(toupper(substring(s, 1,1)), 
        substring(s, 2),
        sep="", collapse=" ")
}
df$Street = sapply(df$Street, simpleCap)



# Remove the “Strange HTML column”
remove(list = df$`Strange HTML`)
