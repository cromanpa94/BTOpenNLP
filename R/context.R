context <- function(text){
  
  ##Not my function
  ##see Durum's answer
  ##https://stackoverflow.com/questions/34403346/extract-a-sample-of-words-around-a-particular-word-using-stringr-in-r
  ##Thanks!
  
  splittedText <- strsplit(text, ' ', T)[[1]]
  #print(splittedText)
  
  data.frame(
    words  = splittedText,
    before = head(c('', splittedText), -1), 
    after  = tail(c(splittedText, ''), -1)
  )
}
