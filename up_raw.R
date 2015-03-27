# This is the raw codes to make use of the raw data from my jawbone Up wristband.

# Setting the working directory

setwd('c:/Git/Up')

# Loading the csv raw files

raw_2014 <- read.csv('2014.csv')
raw_2015 <- read.csv('2015.csv')

# Sieving viable data
## Deciding on the column that carries all viable data

sapply(raw_2014, summary)

a <- subset(raw_2014, m_active_time > 0)
b <- subset(raw_2014, m_calories > 0)
c <- subset(raw_2014, m_distance > 0)
d <- subset(raw_2014, m_inactive_time > 0)
e <- subset(raw_2014, m_steps > 0)
f <- subset(raw_2014, m_total_calories > 0)
g <- subset(raw_2014, n_asleep_time > 0)
h <- subset(raw_2014, n_awake_time > 0)
i <- subset(raw_2014, s_bedtime > 0)

## Setting up an nrow index vector 

nrow_col_2014 = list(a, b, c, d, e, f, g, h, i)
lapply(nrow_col_2014, nrow)

## 'Total_calories' is not a good indicator as it is defaultly filled.
## 'm_active_time' should be a viable identifier.

## 's_bedtime' can be smaller than 'm_active_time', as sometimes I forgot to put on the wristband asleep.

## Checking the validation process using 2015 data

sapply(raw_2015, summary)

a <- subset(raw_2015, m_active_time > 0)
b <- subset(raw_2015, m_calories > 0)
c <- subset(raw_2015, m_distance > 0)
d <- subset(raw_2015, m_inactive_time > 0)
e <- subset(raw_2015, m_steps > 0)
f <- subset(raw_2015, m_total_calories > 0)
g <- subset(raw_2015, n_asleep_time > 0)
h <- subset(raw_2015, n_awake_time > 0)
i <- subset(raw_2015, s_bedtime > 0)

nrow_col_2015 = list(a, b, c, d, e, f, g, h, i)
lapply(nrow_col_2015, nrow)

## Confirmed.

# Sieving data using 'm_active_time' and merge all into one data source of 'raw'

raw_2014_active <- subset(raw_2014, m_active_time > 0)
raw_2015_active <- subset(raw_2015, m_active_time > 0)

## Columns of data 2014 and 2015 were different. Let's find out.

setdiff(colnames(raw_2014_active), colnames(raw_2015_active))

## 'o_count' and 'o_mood'  -> let's shed them.

raw_2014_active <- raw_2014_active[c(1:30,33:45),]

raw <- rbind(raw_2014_active, raw_2015_active)
