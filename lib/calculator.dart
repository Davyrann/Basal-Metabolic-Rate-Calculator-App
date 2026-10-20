import 'constants.dart';

// ============================================================================
// ALUR PROGRAM - LANGKAH 3: Pemrosesan Logika Bisnis & Perhitungan
// Class Calculator memisahkan kalkulasi matematis dari antarmuka pengguna (OOP).
// Menghitung Basal Metabolic Rate (BMR) menggunakan formula Mifflin-St Jeor,
// serta Total Daily Energy Expenditure (TDEE).
// ============================================================================
class Calculator {
  const Calculator({
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
    required this.activity,
  });

  final int height; // Tinggi badan dalam centimeter (cm)
  final int weight; // Berat badan dalam kilogram (kg)
  final int age;    // Usia dalam tahun
  final Gender gender;          // Jenis kelamin (pria / wanita)
  final ActivityLevel activity; // Tingkat aktivitas fisik harian

  /// Menghitung BMR dengan Rumus Mifflin-St Jeor:
  /// - Pria:   (10 × berat) + (6.25 × tinggi) - (5 × umur) + 5
  /// - Wanita: (10 × berat) + (6.25 × tinggi) - (5 × umur) - 161
  double calculateBMR() {
    final genderConstant = gender == Gender.male ? 5 : -161;
    return 10 * weight + 6.25 * height - 5 * age + genderConstant;
  }

  /// Menghitung TDEE (Total Daily Energy Expenditure):
  /// TDEE = BMR × Faktor Aktivitas
  double calculateTDEE() => calculateBMR() * activity.factor;

  /// Memberikan teks penjelasan dan konteks hasil perhitungan
  String getInterpretation() =>
      'BMR adalah perkiraan energi yang digunakan tubuh saat istirahat. '
      'Kebutuhan kalori harian berubah sesuai tingkat aktivitas. '
      'Angka ini adalah estimasi, bukan rekomendasi diet individual.';
}
