df <- read.csv("D:/Academic/kaggle.csv", stringsAsFactors = FALSE)
library(reshape2)
library(ggplot2)
library(car)

cols_to_change = c('RTOOL', 'SPSS', 'GITHUB', 'MENDREF' , 'LATEX', 'WORD', 'EXCEL' , 'GSCHOLALERT', 'GSCHOLSEARCH', 'ACROBAT', 'RGATEALERT' , 'MAILAUTH' , 'RES4LIFE', 'SCOPSEARCH') 


df[cols_to_change] <- sapply(df[cols_to_change], function(x) ifelse(nchar(x) > 0, 'yes', 'no'))


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

m1 <- melt(df, measure.vars=c('RTOOL', 'SPSS', 'GITHUB', 'MENDREF' , 'LATEX', 'WORD', 'EXCEL' , 'GSCHOLALERT', 'GSCHOLSEARCH', 'ACROBAT', 'RGATEALERT' , 'MAILAUTH' , 'RES4LIFE', 'SCOPSEARCH'))

qplot(value, data=m1, fill=value) + facet_wrap( facets= ~variable, scale="free_x")


replace_blank_cells <- function(x){ifelse(nchar(x) > 0, "Yes", "No")}
tools <- c('RTOOL', 'SPSS', 'GITHUB', 'MENDREF' , 'LATEX', 'WORD', 'EXCEL' , 'GSCHOLALERT', 'GSCHOLSEARCH', 'ACROBAT', 'RGATEALERT' , 'MAILAUTH' , 'RES4LIFE', 'SCOPSEARCH')
df %>%
  select(one_of(tools)) %>%
  mutate_each(funs(replace_blank_cells)) %>%
  gather(variable, value) %>%
ggplot(aes(value, fill = value)) + 
  geom_bar() +
  facet_wrap(~variable, scale = "free_x")