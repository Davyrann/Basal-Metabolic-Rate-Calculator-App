import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi/calculator.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/components/custom_card.dart';
import 'package:bmi/components/icon_card.dart';
import 'package:bmi/components/round_icon_button.dart';
import 'package:bmi/components/bottom_button.dart';
import 'result_page.dart';

// ============================================================================
// ALUR PROGRAM - LANGKAH 2: Pengambilan Input & Interaksi Pengguna
// InputPage adalah StatefulWidget yang mengelola state masukan pengguna:
// jenis kelamin, tinggi badan (slider), berat badan & umur (tombol counter),
// serta tingkat aktivitas harian (dropdown).
// ============================================================================
class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // State aplikasi untuk menyimpan data masukan
  Gender gender = Gender.male;
  int height = 170;
  int weight = 65;
  int age = 20;
  ActivityLevel activity = ActivityLevel.sedentary;

  /// Helper widget untuk membuat kartu counter (berat & umur) dengan tombol +/-
  Widget counterCard(String label, int value, VoidCallback minus, VoidCallback plus) {
    return CustomCard(
      color: activeCardColor,
      cardChild: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(label, style: labelTextStyle),
        const SizedBox(height: 6),
        Text('$value', style: numberTextStyle),
        const SizedBox(height: 8),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: minus),
          const SizedBox(width: 14),
          RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: plus),
        ]),
      ]),
    );
  }

  // ==========================================================================
  // ALUR PROGRAM - LANGKAH 2.1: Pemanggilan Kalkulator & Navigasi ke Hasil
  // Dipanggil saat tombol 'CALCULATE BMR' ditekan. Seluruh state input dibungkus
  // ke dalam objek Calculator, lalu dinavigasikan ke ResultPage dengan membawa hasil.
  // ==========================================================================
  void calculate() {
    final calculator = Calculator(
      height: height,
      weight: weight,
      age: age,
      gender: gender,
      activity: activity,
    );

    // Kirim hasil kalkulasi ke ResultPage via constructor
    Navigator.push(context, MaterialPageRoute(
      builder: (_) => ResultPage(
        bmr: calculator.calculateBMR(),
        tdee: calculator.calculateTDEE(),
        activity: activity,
        interpretation: calculator.getInterpretation(),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMR CALCULATOR', style: TextStyle(fontSize: 20))),
      // SingleChildScrollView mencegah render overflow pada layar kecil
      body: SafeArea(child: Column(children: [
        Expanded(child: SingleChildScrollView(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 6, 8, 12),
              child: Text('Hitung kebutuhan energi basal tubuhmu',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Color(0xFFC5C6D0))),
            ),
            // Pilihan Gender (Male / Female)
            SizedBox(height: 146, child: Row(children: [
              Expanded(child: CustomCard(
                color: gender == Gender.male ? activeCardColor : inactiveCardColor,
                onPress: () => setState(() => gender = Gender.male),
                cardChild: const IconCard(cardIcon: FontAwesomeIcons.mars, caption: 'MALE'),
              )),
              Expanded(child: CustomCard(
                color: gender == Gender.female ? activeCardColor : inactiveCardColor,
                onPress: () => setState(() => gender = Gender.female),
                cardChild: const IconCard(cardIcon: FontAwesomeIcons.venus, caption: 'FEMALE'),
              )),
            ])),
            // Input Tinggi Badan dengan Slider interaktif
            SizedBox(height: 155, child: CustomCard(
              color: activeCardColor,
              cardChild: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text('TINGGI BADAN', style: labelTextStyle),
                const SizedBox(height: 6),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [Text('$height', style: numberTextStyle),
                    const Text(' cm', style: labelTextStyle)]),
                Slider(
                  min: 120, max: 220, divisions: 100,
                  value: height.toDouble(),
                  onChanged: (v) => setState(() => height = v.round()),
                ),
              ]),
            )),
            // Input Berat Badan dan Umur menggunakan tombol increment/decrement
            SizedBox(height: 165, child: Row(children: [
              Expanded(child: counterCard('BERAT (kg)', weight,
                () => setState(() { if (weight > 20) weight--; }),
                () => setState(() { if (weight < 300) weight++; }))),
              Expanded(child: counterCard('UMUR (tahun)', age,
                () => setState(() { if (age > 15) age--; }),
                () => setState(() { if (age < 80) age++; }))),
            ])),
            // Pilihan Tingkat Aktivitas Harian menggunakan Dropdown
            CustomCard(color: activeCardColor, cardChild: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('TINGKAT AKTIVITAS', style: labelTextStyle),
                DropdownButtonFormField<ActivityLevel>(
                  initialValue: activity,
                  isExpanded: true,
                  dropdownColor: activeCardColor,
                  decoration: const InputDecoration(border: InputBorder.none),
                  items: ActivityLevel.values.map((a) => DropdownMenuItem(
                    value: a, child: Text(a.label, overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14)),
                  )).toList(),
                  onChanged: (a) { if (a != null) setState(() => activity = a); },
                ),
              ]),
            )),
            const Padding(
              padding: EdgeInsets.fromLTRB(14, 6, 14, 14),
              child: Text('Rumus: Mifflin–St Jeor  •  Umur 15–80 tahun',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Color(0xFF9EA0B4))),
            ),
          ]),
        ))),
        // Tombol Aksi Bawah: Memicu fungsi calculate() untuk memproses data
        BottomButton(buttonTitle: 'CALCULATE BMR', onTap: calculate),
      ])),
    );
  }
}
