import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextService {
  final stt.SpeechToText _speech = stt.SpeechToText();

  Future<String> listenAndConvertToText() async {
    bool available = await _speech.initialize();
    if (available) {
      await _speech.listen();
      await Future.delayed(const Duration(seconds: 3));
      _speech.stop();
      return _speech.lastRecognizedWords;
    }
    return "";
  }
}