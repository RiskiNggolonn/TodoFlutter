import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/utils/buttonLogin.dart';
import 'package:todoapp/utils/my_textfield.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text editing controller
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  void signUserIn() async {
    // Menampilkan animasi progress
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Login menggunakan email dan password
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {}
    // Mengembalikan animasi progress
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Icon(
                  Icons.lock,
                  size: 70,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'SELAMAT DATANG DI TODOAPP',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 25),
                // Untuk Mengambil username
                MyTextield(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false),
                const SizedBox(
                  height: 10,
                ),
                // Untuk Mengambil password
                MyTextield(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true),
                const SizedBox(
                  height: 20,
                ),
                Button(text: 'MASUK', onTap: signUserIn),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        // Garis
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Silahkan Login',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      // Garis
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum memiliki akun?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      width: 5,
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Daftar Sekarang',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
