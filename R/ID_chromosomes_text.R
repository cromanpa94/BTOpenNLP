ID_chromosomes_text<-function(doc){
  
  unlist(lapply(seq_along(doc), function(y){
    ##For explicit chromosome counts
    li<-context(doc[y])
    a_number<-grep("chro*", li[,1])
    
    cc_ex<-unlist(lapply(seq_along(a_number), function(x){
      
      a<-li[a_number[x],]
      ve<-as.vector(unname(unlist(a[1,])))
      ve<-ve[grepl("\\d", ve)]
      ve<-ve[1]
      
      if(is.na(ve)){}else{
        
        if(length(ve) != 0){
          
          if( which(a == ve) ==2){ paste( ve, as.vector(li[a_number[x],1]), collapse = " ")}else{
            paste(as.vector(li[a_number[x],1]), ve, collapse = " ")
          }
        }else{}
      }
      
    }))
    
    ##For 2N and N
    found<-grep("=", li[,1])
    
    cc_n<-unlist(lapply(seq_along(found), function(x){
      
      target<-as.vector(li[found[x],1])
      if(grepl("\\d",target)){
        target
      }else{
        if(grepl("\\d",li[found[x],3])){}else{li[found[x],3]}
      }
      
    }))
    
    c(cc_ex,cc_n)
    
  }))
  
}
