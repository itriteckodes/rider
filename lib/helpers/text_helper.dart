class TextHelper{


  static String smallSentence(String bigSentence){
  if(bigSentence.length > 30){
    return bigSentence.substring(0,30) + '...';
  }
  else{
    return bigSentence;
  }
}
}