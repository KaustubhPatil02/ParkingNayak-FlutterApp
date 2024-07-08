import 'package:flutter/material.dart';
import 'package:parking_nayak/config/colors_manager.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final Color primaryColor, secondaryColor;

  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.width,
      required this.primaryColor,
      required this.secondaryColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all<Color>(primaryColor),
          backgroundColor:
              MaterialStateProperty.all<Color>(secondaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
