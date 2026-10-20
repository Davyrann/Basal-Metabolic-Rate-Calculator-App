import 'package:flutter/material.dart';

/// Komponen wadah kartu persegi yang dapat diklik atau statis.
/// Digunakan di InputPage dan ResultPage untuk membungkus setiap kelompok kontrol/informasi.
class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.color, this.cardChild, this.onPress});

  final Color color;
  final Widget? cardChild;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(9),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: cardChild,
      ),
    );
  }
}
