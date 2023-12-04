import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ap/login_screen.dart';
import 'package:ap/pallete.dart';
import 'package:ap/project_screen.dart';
import 'package:ap/perfil.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAAJxjKNm3vTNQa68UrhQF4r-tlI9HCAbY",
      appId: "1:251146862934:android:538a8e79e7a4c35df196f7",
      messagingSenderId: "251146862934",
      projectId: "d-drone-d9b66",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '6D Drones',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Pallete.backgroundColor,
      ),
      home: const HomePage(),
    );
  }
}
