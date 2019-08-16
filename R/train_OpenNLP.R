train_OpenNLP<-function(text_input_name=NULL,model_output_name=NULL, lan="en", encoding="UTF-8"){
  
  path<-getwd() #Path relative to the wd
  outfile<-paste0(path,"/",model_output_name, ".bin")
  infile<-paste0(path,"/",text_input_name) ##Note that users need to input extension too
  
  tr<-paste0("opennlp TokenNameFinderTrainer -model ", outfile, " -lang ", lan, " -data ", infile, " -encoding ", encoding) 
  
  system(tr)
  
}
