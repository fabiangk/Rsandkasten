#FDR correction for multiple tests
#
#p <- as.numeric(readClipboard())

p.adj <- p.adjust(p,"fdr")
matplot(p, p.adj, type="p", xlim=c(0,0.01), ylim=c(0,0.1),pch=6)

p.adj <- p.adjust(p,"holm")
matplot(p, p.adj, type="p", xlim=c(0,0.01), ylim=c(0,0.1),pch=21,add=TRUE)
 
cat(p)
cat("\n")
cat(p.adj)