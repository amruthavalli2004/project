
#24-02-2023
#download a data set.
#give the project a name.
#find dimensions?
#find class?
#add NA values
#find null values ?
#remove null values
#do sum of the values in data set?

covid<- read.csv(file.choose(),header=T)
covid


library(dplyr)
dim(covid) #for finding no.of rows and columns.
          # 187 rows and 15 columns.


class(covid) #To know the class  of data set.
            # it is a data.frame.
class(covid$Recovered)  #integer.


is.na(covid) #to find NA values.
            #before introducing NA values into data set they are no NA values.


library(missForest)    #adding NA values.
covid<- prodNA(covid, noNA = 0.1)
covid


sum(is.na(covid))#They are 280 NA values in the total data set


sum(covid$Confirmed,na.rm = T) #sum of remaining values in column
                               #the sum of the column confirmed is 15992667
sum(covid$Deaths,na.rm = T)    #the sum of the column Deaths is 643065
sum(covid$Recovered,na.rm = T) #the sum of the column Recovered is 9158241


sum(na.omit(covid$Confirmed))  #for omitting NA values and for doing sum


summary(covid)  #gives summary of whole data set


class(covid$Confirmed) #integer
covid$Confirmed <- factor(covid$Confirmed) #for changing the class of confirmed
class(covid$Confirmed) #factor. 


#Statistical operations in R
mean(is.na(covid$Recovered))  # average recovered people 0.1122995
median(covid$Recovered,na.rm = T) # 2646 is the median for recovered.
range(covid$Deaths,na.rm=T) #The min and max values are 0 148011
sd(covid$Active,na.rm = T) #sd value is 219168
quantile(covid$New.cases,na.rm=T) # to calculate percentile.
max(covid$New.deaths,na.rm = T) # max value is 1076
min(covid$New.recovered,na.rm = T) # min value is 0


#Data Visualization.
library(ggplot2)
ggplot(covid, aes(x = Recovered)) + geom_histogram(col = "purple",fill="orange")
ggplot(covid, aes(x = Deaths)) + geom_bar(width = 0.8,col = "purple",fill="orange")
ggplot(covid, aes(x = Deaths, y = Recovered)) + geom_point(col = "skyblue",fill="violet")
ggplot(covid, aes(x = Deaths, y = Recovered)) + geom_point() +geom_smooth()
ggplot(data = covid,aes(y=Deaths, x=Recovered)) + geom_boxplot(fill = "violet",outlier.color = "Red",outlier.shape = 4)
ggplot(covid,aes(x = Deaths, y = Recovered))+ geom_area(col = "#999999",fill = "skyblue")
