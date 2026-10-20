import 'package:flutter/material.dart';

// Seluruh warna dan style dipusatkan agar konsisten di semua halaman.
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);
const bottomContainerHeight = 80.0;
const labelTextStyle = TextStyle(fontSize: 16, color: Color(0xFFB2B3C2));
const numberTextStyle = TextStyle(fontSize: 36, fontWeight: FontWeight.w800);
const buttonTextStyle = TextStyle(fontSize: 19, fontWeight: FontWeight.bold);

enum Gender { male, female }

enum ActivityLevel {
  sedentary('Jarang bergerak', 1.2),
  light('Olahraga ringan (1-3x/minggu)', 1.375),
  moderate('Olahraga sedang (3-5x/minggu)', 1.55),
  active('Aktif (6-7x/minggu)', 1.725),
  veryActive('Sangat aktif', 1.9);

  const ActivityLevel(this.label, this.factor);
  final String label;
  final double factor;
}
