import 'package:flutter/material.dart';

// ============================================================================
// ALUR PROGRAM: Definisi Konstanta, Tema, dan Nilai Parameter
// Menyimpan konstanta warna, tipografi, serta enum untuk pilihan gender
// dan tingkat aktivitas beserta faktor pengali kalori (TDEE).
// ============================================================================

// Konstanta warna UI konsisten antar halaman
const activeCardColor = Color(0xFF1D1E33);     // Kartu aktif/terpilih
const inactiveCardColor = Color(0xFF111328);   // Kartu tidak aktif
const bottomContainerColor = Color(0xFFEB1555); // Warna tombol aksi bawah
const bottomContainerHeight = 80.0;

// Gaya teks terstandarisasi
const labelTextStyle = TextStyle(fontSize: 16, color: Color(0xFFB2B3C2));
const numberTextStyle = TextStyle(fontSize: 36, fontWeight: FontWeight.w800);
const buttonTextStyle = TextStyle(fontSize: 19, fontWeight: FontWeight.bold);

/// Enum pilihan jenis kelamin (mempengaruhi konstanta rumus Mifflin-St Jeor)
enum Gender { male, female }

/// Enum tingkat aktivitas fisik harian beserta faktor pengali TDEE (Total Daily Energy Expenditure)
enum ActivityLevel {
  sedentary('Jarang bergerak', 1.2),
  light('Olahraga ringan (1-3x/minggu)', 1.375),
  moderate('Olahraga sedang (3-5x/minggu)', 1.55),
  active('Aktif (6-7x/minggu)', 1.725),
  veryActive('Sangat aktif', 1.9);

  const ActivityLevel(this.label, this.factor);
  final String label;   // Teks deskripsi yang ditampilkan di UI dropdown
  final double factor;  // Faktor pengali: TDEE = BMR * factor
}
