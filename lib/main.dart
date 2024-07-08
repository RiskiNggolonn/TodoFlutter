import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // inisialisasi hive local database
  await Hive.initFlutter();

  // membuka box
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}
