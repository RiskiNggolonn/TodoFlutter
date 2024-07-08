import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/utils/buttonLogin.dart';
import 'package:todoapp/utils/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  // Text editing controller
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _errorMessage = '';

  void signUserUp() async {
    // Menampilkan animasi progress
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Membuat akun baru + firebase
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      Navigator.pop(context);
      User? user = userCredential.user;
      if (user != null) {
        print('object');
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message ?? 'an error occurred';
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'an error occurred';
      });
    }
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
                    controller: _emailController,
                    hintText: 'Email',
                    obscureText: false),
                const SizedBox(
                  height: 10,
                ),
                // Untuk Mengambil Password
                MyTextield(
                    controller: _passwordController,
                    hintText: 'Password',
                    obscureText: true),
                const SizedBox(
                  height: 20,
                ),
                Button(text: 'BUAT AKUN', onTap: signUserUp),
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
                          'Silahkan Buat Akun',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        // Garis
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
                      'Sudah punya akun?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      width: 5,
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login Sekarang',
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
