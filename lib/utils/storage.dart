import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  Future<void> saveChatHistory(List<String> messages) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('chat_history', messages);
  }

  Future<List<String>> getChatHistory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('chat_history') ?? [];
  }
}