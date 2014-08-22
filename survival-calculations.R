
library("survival")
data <- read.csv("alcl_cytokine.csv",sep=";")
dataSubset <- data[data$STATUS=="ALCL",]
KM <- survfit(Surv(EVENT_ZEIT,REZ1=="JA") ~ 1+strata(IL6_HIGH),type="kaplan-meier",conf.type="log",data=dataSubset)
print(KM)
plot(KM)
dev.off()
vars<-dataSubset[,148:172]
 

sapply(c(148:149), function(x) {
  cat("--------",(colnames(dataSubset)[x]),"--------")
  comp<-survdiff(Surv(EVENT_ZEIT,REZ1=="JA") ~ dataSubset[,x],data=dataSubset)
  print(comp[,1])
})
