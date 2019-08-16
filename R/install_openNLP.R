install_openNLP<-function(){
  system('
         if [[ $(command -v brew) == "" ]]; then
    echo "Installing Hombrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo "installing openNLP"
    brew install https://raw.githubusercontent.com/cromanpa94/Homebrew-AlternativeVersions/master/apache-opennlp.rb
else
    echo "Installing openNLP"
    brew install https://raw.githubusercontent.com/cromanpa94/Homebrew-AlternativeVersions/master/apache-opennlp.rb
fi
         ')
  
}
