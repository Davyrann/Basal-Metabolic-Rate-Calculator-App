import 'package:flutter/material.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/pages/input_page.dart';

// Titik masuk aplikasi: Flutter menjalankan widget utama MyApp.
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMR Calculator - Kelompok Raihan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
          centerTitle: true,
          elevation: 0,
        ),
        colorScheme: const ColorScheme.dark(primary: bottomContainerColor),
      ),
      home: const InputPage(),
    );
  }
}
