# load data
df = read.csv('dirty_data.csv', header=T)

# Populate the missing values in the Area variable with an appropriate values 
# (Birmingham, Coventry, Dudley, Sandwell, Solihull, Walsall or Wolverhampton)
fill_area = c('Birmingham', 'Coventry', 'Dudley', 'Sandwell', 'Solihull', 'Walsall', 'Wolverhampton')
random_area = sample(fill_area, nrow(df)-1, replace=T, prob=c(0.15, 0.1, 0.2, 0.05, 0.12, 0.18, 0.2))
df[2:nrow(df),'Area'] = random_area

# Remove special characters, padding (the white space before and after the text) from Street 1 
# and Street 2 variables. Make sure the first letters of street names are capitalized and the 
# street denominations are following the same standard (for example, all streets are indicated 
# as “str.”, avenues as “ave.”, etc.
library("stringr")
# remove special characters
df$Street = str_replace_all(df$Street,"[^[:alnum:]]", " ")
df$Street.2 = str_replace_all(df$Street.2,"[^[:alnum:]]", " ")
# trim leading and trailing space
df$Street = str_replace_all(df$Street,"^\\s+|\\s+$", "")
df$Street.2 = str_replace_all(df$Street.2,"^\\s+|\\s+$", "")
# capitalize first letter of the street name
simpleCap = function(x){
  s = strsplit(x, " ")[[1]]
  paste(toupper(substring(s, 1,1)), 
        substring(s, 2),
        sep="", collapse=" ")
}
df$Street = sapply(df$Street, simpleCap)
df$Street.2 = sapply(df$Street.2, simpleCap)

# If the value in Street 2 duplicates the value in Street 1, remove the value in Street 2
df$Street.2[df$Street==df$Street.2] = ''

# Remove the “Strange HTML column”
df = df[,1:4]

write.csv(df, file = "clean_data.csv", row.names=F)
