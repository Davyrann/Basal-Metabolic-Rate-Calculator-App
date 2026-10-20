import 'package:flutter/material.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/pages/input_page.dart';

// ============================================================================
// ALUR PROGRAM - LANGKAH 1: Inisialisasi & Titik Masuk Aplikasi
// Flutter memulai eksekusi dari fungsi main() lalu merender widget MyApp.
// Di sini tema aplikasi dikonfigurasi (dark theme) dan halaman awal ditentukan.
// ============================================================================
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMR Calculator - Kelompok 2',
      debugShowCheckedModeBanner: false,
      // Konfigurasi tema global: warna latar gelap dan aksen warna pink/merah
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
          centerTitle: true,
          elevation: 0,
        ),
        colorScheme: const ColorScheme.dark(primary: bottomContainerColor),
      ),
      // Alur berlanjut ke InputPage sebagai layar pertama yang berinteraksi dengan pengguna
      home: const InputPage(),
    );
  }
}
