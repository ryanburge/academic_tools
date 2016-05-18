df <- read.csv("D:/Academic/kaggle.csv", stringsAsFactors = FALSE)
library(reshape2)
library(ggplot2)
library(car)


df$git<-recode(df$GITHUB,"'GitHub'='Yes'; ''='No'")
df$R<-recode(df$RTOOL,"'R'='Yes';''='No'")
df$SPSS<-recode(df$SPSS,"'SPSS'='Yes';''='No'")
df$mend <- recode(df$MENDREF,"'Mendeley'='Yes';''='No'")
df$latex <- recode(df$LATEX,"'LaTeX'='Yes';''='No'")
df$gdrive <- recode(df$GTDRIVE,"'Google Drive/Docs'='Yes';''='No'")
df$word <- recode(df$WORD,"'MS Word'='Yes';''='No'")
df$excel <- recode(df$EXCEL,"'MS Excel'='Yes';''='No'")
df$scholar <- recode(df$GSCHOLALERT,"'Google Scholar'='Yes';''='No'")
df$schol <- recode(df$GSCHOLSEARCH,"'Google Scholar'='Yes';''='No'")

m1 <- melt(df, measure.vars=c("git","R","SPSS", "mend", "latex", "gdrive", "word", "excel", "scholar" , "schol"))
qplot(variable, data=m1, fill=value) + facet_wrap( facets= ~variable, scale="free_x")

