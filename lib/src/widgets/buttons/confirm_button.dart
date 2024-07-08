import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed; // Usamos VoidCallback en lugar de Function
  final double height;

  const ConfirmButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 60.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          backgroundColor: Theme.of(context).buttonTheme.colorScheme?.primary,
          foregroundColor: Colors.white.withOpacity(0.9),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18.0,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
