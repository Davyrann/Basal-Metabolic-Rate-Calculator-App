import 'package:flutter_test/flutter_test.dart';
import 'package:bmi/calculator.dart';
import 'package:bmi/constants.dart';

void main() {
  // Data contoh dipilih agar hasil mudah diperiksa dengan perhitungan manual.
  test('BMR pria: 65 kg, 170 cm, 20 tahun', () {
    const calc = Calculator(height: 170, weight: 65, age: 20,
      gender: Gender.male, activity: ActivityLevel.sedentary);
    expect(calc.calculateBMR(), 1617.5);
    expect(calc.calculateTDEE(), closeTo(1941, 0.001));
  });

  test('BMR wanita: 60 kg, 160 cm, 25 tahun', () {
    const calc = Calculator(height: 160, weight: 60, age: 25,
      gender: Gender.female, activity: ActivityLevel.moderate);
    expect(calc.calculateBMR(), 1314);
    expect(calc.calculateTDEE(), closeTo(2036.7, 0.001));
  });
}
