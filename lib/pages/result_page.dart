import 'package:flutter/material.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/components/custom_card.dart';
import 'package:bmi/components/bottom_button.dart';

// ============================================================================
// ALUR PROGRAM - LANGKAH 4: Menampilkan Hasil & Interaksi Kembali
// ResultPage menerima hasil kalkulasi dari InputPage melalui constructor.
// Menampilkan skor BMR, interpretasi, dan estimasi TDEE.
// Tombol 'RE-CALCULATE' memicu Navigator.pop untuk kembali ke InputPage.
// ============================================================================
class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    required this.bmr,
    required this.tdee,
    required this.activity,
    required this.interpretation,
  });

  // Data hasil kalkulasi yang diterima dari InputPage
  final double bmr;
  final double tdee;
  final ActivityLevel activity;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMR RESULT')),
      body: SafeArea(child: Column(children: [
        Expanded(child: SingleChildScrollView(child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Text(
              'Hasil Perhitungan', style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold))),
            // Kartu Utama: Menampilkan Angka BMR (Basal Metabolic Rate)
            CustomCard(color: activeCardColor, cardChild: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(children: [
                const Text('BASAL METABOLIC RATE', style: TextStyle(
                  color: Color(0xFF24D876), fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 24),
                FittedBox(fit: BoxFit.scaleDown, child: Text(bmr.toStringAsFixed(0),
                  style: const TextStyle(fontSize: 70, fontWeight: FontWeight.w900))),
                const Text('kcal / hari', style: TextStyle(fontSize: 20)),
                const SizedBox(height: 30),
                Text(interpretation, textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, height: 1.4)),
              ]),
            )),
            const SizedBox(height: 12),
            // Kartu Sekunder: Menampilkan Estimasi Kebutuhan Kalori Harian (TDEE)
            CustomCard(color: activeCardColor, cardChild: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                const Text('ESTIMASI KEBUTUHAN KALORI HARIAN',
                  textAlign: TextAlign.center, style: labelTextStyle),
                const SizedBox(height: 10),
                Text('${tdee.toStringAsFixed(0)} kcal/hari',
                  style: const TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(activity.label, textAlign: TextAlign.center),
              ]),
            )),
            const Padding(padding: EdgeInsets.all(16), child: Text(
              'Perhitungan memakai rumus Mifflin–St Jeor. '
              'Hasil merupakan estimasi dan bukan diagnosis medis.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFFB2B3C2), fontSize: 13))),
          ]),
        ))),
        // ======================================================================
        // ALUR PROGRAM - LANGKAH 4.1: Kembali ke Layar Input (Pop Route)
        // Tombol RE-CALCULATE menutup ResultPage dan mengembalikan pengguna ke
        // InputPage tanpa kehilangan input sebelumnya.
        // ======================================================================
        BottomButton(buttonTitle: 'RE-CALCULATE', onTap: () => Navigator.pop(context)),
      ])),
    );
  }
}
