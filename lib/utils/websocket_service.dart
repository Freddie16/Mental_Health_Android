import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  final WebSocketChannel _channel;

  WebSocketService(String url) : _channel = IOWebSocketChannel.connect(url);

  void sendMessage(String message) {
    _channel.sink.add(message);
  }

  Stream getMessages() {
    return _channel.stream;
  }

  void closeConnection() {
    _channel.sink.close();
  }
}