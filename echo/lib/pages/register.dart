import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:echo/source/styles.dart';
import 'package:echo/source/components.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Semua elemen rata kiri
            children: [
              _buildLogo(),
              const SizedBox(height: 40),
              _buildContentText(),
              const SizedBox(height: 32),
              _buildForm(),
              const SizedBox(height: 32),
              _buildActionButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  // --- Logo ---
  Widget _buildLogo() {
    return SvgPicture.asset(
      "assets/icons/Logo.svg",
      height: 24,
    );
  }

  // --- Content Text ---
  Widget _buildContentText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Get Started!",
          style: AppTypography.heading1Medium,
        ),
        Text(
          "It only takes a minute to get started!",
          style: AppTypography.bodyRegular,
        ),
      ],
    );
  }

  // --- Form ---
  Widget _buildForm() {
    return Column(
      children: [
        _buildEmailField(),
        const SizedBox(height: 16),
        _buildPasswordField(),
      ],
    );
  }

  Widget _buildEmailField() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Email", style: AppTypography.bodyRegular),
        SizedBox(height: 8),
        CustomTextFormField(
          hintText: 'example@gmail.com',
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: AppTypography.bodyRegular.copyWith(color: AppColors.textDark),
        ),
        const SizedBox(height: 8),
        const CustomTextFormField(
          hintText: '********',
          obscureText: true,
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }

  // --- Action Buttons ---
  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        const PrimaryButton(text: "Register"),
        const SizedBox(height: 24),
        _buildRegisterText(context),
      ],
    );
  }

  Widget _buildRegisterText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account?",
          style: AppTypography.bodyRegular,
        ),
        TertiaryButton(
          text: "Login Now",
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      ],
    );
  }
}
