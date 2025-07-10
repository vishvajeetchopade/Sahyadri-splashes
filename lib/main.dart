import 'package:flutter/material.dart';
import 'package:sahyadri_splashes/Splash.dart';

import 'package:firebase_core/firebase_core.dart';
// import 'Splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCMvZCg_m5hOii-WpF1kt3R7nxTiT9Tzes",
      appId: "1:784575098897:android:78aa396eb0c260e4fec1b0",
      messagingSenderId: "784575098897",
      projectId: "sahyadrii-splashes",
    ),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
