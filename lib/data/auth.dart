import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/page/home_page.dart';
import 'package:todoapp/page/login_register_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

// route jika sudah pernah login atau belum
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Jika User sudah login
          if (snapshot.hasData) {
            return const HomePage();

            // Jika User belum login
          } else {
            return const LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
