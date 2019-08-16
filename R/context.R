context <- function(text){
  splittedText <- strsplit(text, ' ', T)[[1]]
  #print(splittedText)
  
  data.frame(
    words  = splittedText,
    before = head(c('', splittedText), -1), 
    after  = tail(c(splittedText, ''), -1)
  )
}
