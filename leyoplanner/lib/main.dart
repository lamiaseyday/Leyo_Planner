import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'AppFile/Login.dart';
import 'AppFile/Welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: WelcomePage(),
    );
  }
}
