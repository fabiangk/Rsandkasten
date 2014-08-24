 
verbose=FALSE

columns=list(R="F635 Median",Rb="B635 Median")

titre<-"T-20250"


filters=list(titre="T-20250")
if(verbose) cat("Using",columns$R,"as red foreground and",columns$Rb,"as red background.\n")
  
  
YesNoPrompt<-function(question="",yesComment="",noComment="") {
  IsYes<-function(input) {
    any(input==c("yes","y","J","Y","ja","Yes","Ja","JA","YES"))
  }  
  IsNo<-function(input) {
    any(input==c("no","n","N","NO","No","Nein","NEIN","nein"))
  }   
  IsExit<-function(input) {
    any(input==c("exit","e","ex","end","break"))
  } 
  n=-1
  cat(question,"[Y]es/[N]o/[E]xit:")
  while(n<0) {
    input<-readline()
    if(IsYes(input)) {
      n=1
      cat(yesComment)
      break
    } else if(IsNo(input)) {
      n=0
      cat(noComment)
      break
    } else if(IsExit(input)) {
      n=-1
      break
    }
    cat("Sorry, I did not understand, come again:")
  }
  n 
}

for(key in names(filters)){
  value=columns[[key]]
  
}