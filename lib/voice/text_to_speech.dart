import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechService {
  final FlutterTts _tts = FlutterTts();

  Future<void> speakText(String message) async {
    await _tts.speak(message);
  }
}
