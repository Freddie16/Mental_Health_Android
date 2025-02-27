import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import '../utils/sentiment_analysis.dart';
import '../voice/voice_service.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _controller = TextEditingController();
  final _channel = IOWebSocketChannel.connect('wss://yourbackend.com/chat');
  final FlutterTts _tts = FlutterTts();
  final List<String> _messages = [];

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _channel.sink.add(_controller.text);
      setState(() {
        _messages.add("You: ${_controller.text}");
      });
      _controller.clear();
    }
  }

  void _processVoiceMessage() async {
    String message = await VoiceService().listenAndConvertToText();
    _channel.sink.add(message);
    setState(() {
      _messages.add("You: $message");
    });
  }

  void _speakMessage(String message) async {
    await _tts.speak(message);
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(_messages[index]),
                onTap: () => _speakMessage(_messages[index]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.mic),
                  onPressed: _processVoiceMessage,
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(labelText: "Message"),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
