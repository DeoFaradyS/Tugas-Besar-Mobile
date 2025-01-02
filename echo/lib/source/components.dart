import 'package:echo/source/styles.dart';
import 'package:flutter/material.dart';

// --- Primary Button ---
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: _buttonStyle(),
        onPressed: onPressed ?? () {},
        child: Text(
          text,
          style: _textStyle(),
        ),
      ),
    );
  }

  // Button Style
  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.buttonPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 0,
      ),
    );
  }

  // Text Style
  TextStyle _textStyle() {
    return AppTypography.bodyLargeSemibold.copyWith(
      color: AppColors.primaryTextLight,
    );
  }
}

// --- Secondary Button ---
class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const SecondaryButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SizedBox(
        height: 48,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Set border radius
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 0,
            ), // Set padding
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16, // Set font size
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

// --- Tertiary Button ---
class TertiaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const TertiaryButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: Colors.grey,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16, // Set font size
          fontWeight: FontWeight.bold, // Set font weight
        ),
      ),
    );
  }
}

// --- Text Field Form ---
class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
    );
  }
}
