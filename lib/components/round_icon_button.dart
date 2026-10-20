import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.icon, required this.onPressed});
  final FaIconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0,
      constraints: const BoxConstraints.tightFor(width: 42, height: 42),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: FaIcon(icon, size: 18),
    );
  }
}
