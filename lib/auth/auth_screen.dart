import 'package:flutter/material.dart';
import 'firebase_auth_service.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            bool isAuthenticated = await FirebaseAuthService().signInWithGoogle();
            if (isAuthenticated) {
              Navigator.pushReplacementNamed(context, '/chat');
            }
          },
          child: const Text('Sign in with Google'),
        ),
      ),
    );
  }
}