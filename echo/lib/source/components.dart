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
      backgroundColor: AppColors.backgroundDark,
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
    return AppTypography.bodySemibold.copyWith(
      color: AppColors.textLight,
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
      height: 48,
      child: OutlinedButton(
        style: _buttonStyle(),
        onPressed: onPressed,
        child: Text(
          text,
          style: _textStyle(),
        ),
      ),
    );
  }

  // Button Style
  ButtonStyle _buttonStyle() {
    return OutlinedButton.styleFrom(
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
    return AppTypography.bodySemibold.copyWith(
      color: AppColors.textDark,
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
      style: _buttonStyle(),
      onPressed: onPressed,
      child: Text(
        text,
        style: _textStyle(),
      ),
    );
  }

  // --- Button Style ---
  ButtonStyle _buttonStyle() {
    return TextButton.styleFrom(
      foregroundColor: Colors.grey,
    );
  }

  // Text Style
  TextStyle _textStyle() {
    return AppTypography.bodyMedium.copyWith(
      color: AppColors.textDark,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.borderDark,
      decorationThickness: 1,
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
    return _buildTextField();
  }

  Widget _buildTextField() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: _buildTextFormField(),
    );
  }

  Widget _buildTextFormField() {
    return TextFormField(
      decoration: _buildInputDecoration(),
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: AppTypography.bodyRegular.copyWith(
        color: AppColors.textDark,
      ),
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      hintText: hintText,
      hintStyle: AppTypography.bodyRegular.copyWith(
        color: AppColors.textGrayLight,
      ),
      filled: true,
      fillColor: AppColors.backgroundColorGrayLight,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
