ID_species_text<-function(doc, group, return_all=T, species_only=T){
  print("Searching for potential species names in text")

  potential_species<-unique(unlist(pblapply(seq_along(doc), function(x){
    ##Fully spelled scientific names
    ts1<-str_extract_all(doc[x], "\\b[A-Z]\\w+")[[1]]

    ##Abreviatted scientific names
    dots<-strsplit(doc[x]," ")[[1]][grep(".",strsplit(doc[x]," ")[[1]], fixed = T)]
    ts2<-dots[str_detect(str_trim(gsub("[^A-Za-z ]"," ",dots)), "^[:upper:]+$")]
    ts<-c(ts1,ts2)

    sn<- lapply(seq_along(ts), function(y){
      nocl<-str_extract_all(doc[x], "\\b[a-z]\\w+")[[1]]

      context <- function(text){
        splittedText <- strsplit(text, ' ', T)[[1]]
        #print(splittedText)

        data.frame(
          words  = splittedText,
          before = head(c('', splittedText), -1),
          after  = tail(c(splittedText, ''), -1)
        )
      }
      info <- context(doc[x])

      next_word<-as.character(subset(info, words%in% ts)[,3])
      next_word<-next_word[y]
      next_word<-str_trim(gsub("[^A-Za-z ]"," ",next_word))

      if(next_word %in% nocl){
        paste0(ts[y],"_",next_word)
      }

    })
    sub(".", "", sn, fixed = T)


  })))

  cat("    ",length(potential_species), " potential species found. \n\n Searching species names in gbif")
  gbifkey <- pblapply(potential_species, function(x) name_backbone(name = x, kingdom = group))

  taxa<-if(species_only==F){ potential_species[!unlist(lapply(seq_along(gbifkey), function(x) gbifkey[[x]]$matchType == "NONE"))]}else{

    testing<-lapply(seq_along(gbifkey), function(x) gbifkey[[x]]$rank == "SPECIES")
    potential_species[unlist(lapply(testing, isTRUE))]
  }

  potentially_abb<-potential_species[which(unlist(lapply(seq_along(potential_species), function(x) nchar(strsplit(potential_species[x], "_")[[1]][1])) ) ==1)]

  if(return_all==T){
    return(list("Curated_species"=taxa,
                "Potentially_abbreviated"=potentially_abb))
  }else{
    return(taxa)
  }
}

