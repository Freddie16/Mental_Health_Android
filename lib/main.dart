import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/auth_screen.dart';
import 'chat/chat_screen.dart';
import 'profile/profile_screen.dart';
import 'utils/notifications.dart';
import 'utils/storage.dart';
import 'utils/sentiment_analysis.dart';
import 'voice/voice_service.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MentalHealthChatbotApp());
}

class MentalHealthChatbotApp extends StatelessWidget {
  const MentalHealthChatbotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const AuthScreen(),
      routes: {
        '/chat': (context) => const ChatScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}