import 'constants.dart';

/// Model OOP yang memisahkan rumus dari antarmuka pengguna.
/// Rumus Mifflin-St Jeor mengestimasi energi basal per hari (kcal/hari).
class Calculator {
  const Calculator({
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
    required this.activity,
  });

  final int height; // cm
  final int weight; // kg
  final int age; // tahun
  final Gender gender;
  final ActivityLevel activity;

  /// Pria: 10*BB + 6.25*TB - 5*umur + 5
  /// Wanita: 10*BB + 6.25*TB - 5*umur - 161
  double calculateBMR() {
    final genderConstant = gender == Gender.male ? 5 : -161;
    return 10 * weight + 6.25 * height - 5 * age + genderConstant;
  }

  /// Estimasi kebutuhan kalori total harian (TDEE) berdasarkan aktivitas.
  double calculateTDEE() => calculateBMR() * activity.factor;

  String getInterpretation() =>
      'BMR adalah perkiraan energi yang digunakan tubuh saat istirahat. '
      'Kebutuhan kalori harian berubah sesuai tingkat aktivitas. '
      'Angka ini adalah estimasi, bukan rekomendasi diet individual.';
}
