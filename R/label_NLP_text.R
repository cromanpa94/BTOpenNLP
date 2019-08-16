label_NLP_text<-function(doc, catName, strings){
  #catName<-"chromosome" ##A name
  #strings<-unique(ID_chromosomes_text(doc))
  strings<-unique(strings)
  toreplace<-sapply(seq_along(strings),function(x) paste0("<START:", catName,"> ", strings[x], " ", "<END>"))
  doc2<-doc
  for(x in seq_along(toreplace)){
    doc2<-gsub(strings[x],toreplace[x],doc2, fixed = T)
  }
  return(doc2)
}
