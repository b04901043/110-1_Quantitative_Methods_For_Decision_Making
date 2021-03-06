# R08943016

rm(list = ls()) # Remove all the variables

# ggplot2
#install.packages("ggplot2")
library(ggplot2)

# Video 1 國企二 吳予涵

rm(list = ls()) # Remove all the variables

packagesData <- data.frame(c("base","dplyr","ggplot2","stringr","readr"), c(3,13,10,6,2))

plot1 <- ggplot(packagesData,
                aes(x= packagesData[,1],
                    y= packagesData[,2],
                    # Color of the plot depend on column 2
                    fill= packagesData[,2]))
plot1

# stat="identity" or stat="count"
plot2 <- plot1 + geom_bar(stat="identity", width = 0.2)
plot2

plot3 <- plot2 + xlab("Packages") +
  theme(legend.position = "none") +
  scale_y_continuous("Counts", breaks = c(0, 5, 10, 12), labels = c("0", "5", "10", "12"))
plot3

plot4 <- plot3 + geom_text(aes(label = packagesData[,2]), data = packagesData)
plot4


# Video 2 國企三 章君鈺

rm(list = ls()) # Remove all the variables

ggplot(iris,
       aes(x = Species, y = Sepal.Length)) + 
  geom_blank()


ggplot(iris,
       aes(x = Species, y = Sepal.Length)) + 
  geom_boxplot()


ggplot(iris,
       aes(x = Sepal.Width, y = Sepal.Length)) + 
  geom_point()


ggplot(iris,
       aes(x = Sepal.Width, y = Sepal.Length)) + 
  geom_point() +
  geom_smooth()


ggplot(iris, 
       aes(x = Sepal.Width, 
           y = Sepal.Length)) + 
  geom_point() + facet_grid(Species~.)


ggplot(iris, 
       aes(x = Sepal.Width, 
           y = Sepal.Length)) + 
  geom_point() + facet_grid(.~Species)


ggplot(iris,
       aes(x = Petal.Width)) +
  geom_bar()


ggplot(iris,
       aes(x = Petal.Width)) +
  geom_bar(width = 0.01)


# Video 3 國企三 毛子晴

rm(list = ls()) # Remove all the variables

load('datasets-V3.RData')

group <- c() # fall, rise, unchanged

for (i in 1:dim(data1)[1]){
  if (data1$Open[i]>data1$Close[i]){
    group[i]='fall'}
  else if (data1$Open[i]<data1$Close[i]){
    group[i]='rise'}
  else if (data1$Open[i]==data1$Close[i]){
    group[i]='unchanged'}
}

data2 <- cbind(data1, group)
data2$Date <- as.Date(data2$Date)

ggplot(data=data2, aes(x=Date)) + geom_errorbar(aes(ymin=Low, ymax=High), size=0.3)

ggplot(data=data2, aes(x=Date)) +
  geom_errorbar(aes(ymin=Low, ymax=High), size=0.3) +
  geom_rect(aes(xmin=Date-0.3, xmax=Date+0.3,
                ymin=pmin(Open,Close), ymax=pmax(Open,Close), fill=group))

ggplot(data=data2, aes(x=Date)) +
  geom_errorbar(aes(ymin=Low, ymax=High), size=0.3) +
  geom_rect(aes(xmin=Date-0.3, xmax=Date+0.3,
                ymin=pmin(Open,Close), ymax=pmax(Open,Close), fill=group)) +
  labs(x='Date', y='Price', title='TSMC Historical Prices') +
  scale_fill_manual(values=c('Green', 'Red', 'Black'))

ggplot(data=data2, aes(x=Date)) +
  geom_errorbar(aes(ymin=Low, ymax=High), size=0.3)+
  geom_rect(aes(xmin=Date-0.3, xmax=Date+0.3,
                ymin=pmin(Open,Close), ymax=pmax(Open,Close), fill=group)) +
  labs(x='Date', y='Price', title='TSMC Historical Prices') +
  scale_fill_manual(values=c('Green', 'Red', 'Black')) +
  xlim(as.Date(c('2020-07-01', '2021-2-1'))) +
  ylim(c(400, 700))

