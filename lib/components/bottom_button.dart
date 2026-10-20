import 'package:flutter/material.dart';
import 'package:bmi/constants.dart';

/// Tombol lebar di bagian bawah layar untuk aksi utama (Calculate / Re-Calculate).
class BottomButton extends StatelessWidget {
  const BottomButton({super.key, required this.buttonTitle, required this.onTap});
  final String buttonTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: SizedBox(
          height: bottomContainerHeight,
          width: double.infinity,
          child: Material(
            color: bottomContainerColor,
            child: InkWell(
              onTap: onTap,
              child: Center(child: Text(buttonTitle, style: buttonTextStyle)),
            ),
          ),
        ),
      ),
    );
  }
}
