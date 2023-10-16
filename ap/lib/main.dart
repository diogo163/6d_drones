import 'package:flutter/material.dart';
import 'package:ap/login_screen.dart';
import 'package:ap/pallete.dart';
import 'package:ap/project_screen.dart';

void main() {
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
