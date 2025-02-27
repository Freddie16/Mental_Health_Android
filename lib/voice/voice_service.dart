import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';

class VoiceService {
  final stt.SpeechToText _speech = stt.SpeechToText();
  final FlutterTts _tts = FlutterTts();

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

  Future<void> speakText(String message) async {
    await _tts.speak(message);
  }
}