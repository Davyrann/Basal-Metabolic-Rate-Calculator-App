import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi/constants.dart';

/// Komponen visual kartu gender berisi icon FontAwesome dan teks caption ('MALE' / 'FEMALE').
class IconCard extends StatelessWidget {
  const IconCard({super.key, required this.cardIcon, required this.caption});
  final FaIconData cardIcon;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(cardIcon, size: 62),
        const SizedBox(height: 12),
        Text(caption, style: labelTextStyle),
      ],
    );
  }
}
