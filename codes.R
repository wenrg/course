# load data
df = read.csv('dirty_data.csv', header=T)

fill_area = c('Birmingham', 'Coventry', 'Dudley', 'Sandwell', 'Solihull', 'Walsall', 'Wolverhampton')

random_area = sample(fill_area, nrow(df) - 1, replace=T, prob=c(0.15, 0.1, 0.2, 0.05, 0.12, 0.18, 0.2))

df[2:nrow(df),'Area'] = random_area
