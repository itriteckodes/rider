class TextHelper {
  static String smallSentence(String bigSentence) {
    if (bigSentence.length > 30) {
      return bigSentence.substring(0, 30) + '...';
    } else {
      return bigSentence;
    }
  }

  static String firebase(message) {
    return message.data.toString().substring(6, message.data.toString().length - 1);
  }
}
