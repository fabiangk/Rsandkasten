#Hallo Welt in R

meineFunktion <- function (title="Hallo Welt") {
  par(bg="lightblue", col.main="red")
  plot(1:15,1:15)
  title(title)
  for(i in 1:10) text(i,i,"Hallo")
}

meineFunktion("Guten Tag, hallo Welt!");

