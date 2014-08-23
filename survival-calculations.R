
library("survival")
data <- read.csv("alcl_cytokine.csv",sep=";")
dataSubset <- data[data$STATUS=="ALCL",]
KM <- survfit(Surv(EVENT_ZEIT,REZ1=="JA") ~ strata(IL6_HIGH),type="kaplan-meier",conf.type="log",data=dataSubset)
#print(KM)

vars<-dataSubset[,148:172]
 
textOutput<-function() {
  cat("KM - Status:ALCL, Strata: Interleukine\n")
  cat ("total n: ", length(dataSubset[,1]))
  cat("\n------------------------------")
  cat("\n")
  sapply(c(148:172), function(x) {
    cat("Strata: ",(colnames(dataSubset)[x]),"\n")
    df<-length(unique((dataSubset[,x])))-1
    print(df)
    
    if (df>0) {
      KM <- survfit(Surv(EVENT_ZEIT,REZ1=="JA") ~ dataSubset[,x],type="kaplan-meier",conf.type="log",data=dataSubset)
      
      nGroup1<-KM$strata[[1]]
      nGroup2<-KM$strata[[2]]
      
      group1<-cbind(KM$time[0:nGroup1],
                    KM$surv[0:nGroup1],
                    KM$std.err[0:nGroup1],
                    KM$upper[0:nGroup1],
                    KM$lower[0:nGroup1])
      group2<-cbind(KM$time[(nGroup1+1):length(KM$time)],
                    KM$surv[(nGroup1+1):length(KM$surv)],
                    KM$std.err[(nGroup1+1):length(KM$surv)],
                    KM$upper[(nGroup1+1):length(KM$surv)],
                    KM$lower[(nGroup1+1):length(KM$surv)])
      cat("Strata\tn\tEFS(36m)\tSE\tLL\tUL\n")
      cat(sub("dataSubset\\[, x]","",names(KM$strata[1])),"\t")
      if(group1[1,1]<36) {
        cat(KM$n[[1]],tail(group1[group1[,1]<36,2:5],n=1),sep="\t")
        cat("\n")
      }
      if(group2[1,1]<36) {      
        cat(sub("dataSubset\\[, x]","",names(KM$strata[2])),"\t")
        cat(KM$n[[2]],tail(group2[group2[,1]<36,2:5],n=1),sep="\t")
      }
      
      comp<-survdiff(Surv(EVENT_ZEIT,REZ1=="JA") ~ dataSubset[,x],data=dataSubset)
      p<-1 - pchisq(comp$chisq, 1) 
      cat("\np-Value: ",p)
      if (p<0.05) cat("*")
      if (p<0.01) cat("*")
      if (p<0.001) cat("*")
      cat("\n\n")
  
    }
    else cat ("only one group - nothing to compare")
    cat("\n")
  })
}

plotOutput<-function() {
  sapply(c(148:172), function(x) {
    df<-length(unique((dataSubset[,x])))-1
    
    if (df>0) {
      KM <- survfit(Surv(EVENT_ZEIT,REZ1=="JA") ~ dataSubset[,x],type="kaplan-meier",conf.type="log",data=dataSubset)
      plot(KM,main=sub("_HIGH","",colnames(dataSubset)[x])) 
    }
  })
}  
