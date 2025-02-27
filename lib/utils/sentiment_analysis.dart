class SentimentAnalysis {
  static double analyzeMessage(String message) {
    if (message.contains("happy") || message.contains("good")) {
      return 90.0;
    } else if (message.contains("sad") || message.contains("bad")) {
      return 40.0;
    }
    return 60.0;
  }
}
