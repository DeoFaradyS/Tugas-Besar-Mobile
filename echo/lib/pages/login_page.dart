import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:echo/source/styles.dart';
import 'package:echo/source/components.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              _buildActionButtons(),
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
          "Welcome Back!",
          style: AppTypography.heading1Medium,
        ),
        Text(
          "Missed us? We’re ready when you are!",
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
  Widget _buildActionButtons() {
    return Column(
      children: [
        const PrimaryButton(text: "Login"),
        const SizedBox(height: 24),
        _buildRegisterText(),
      ],
    );
  }

  Widget _buildRegisterText() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have a account?",
          style: AppTypography.bodyRegular,
        ),
        TertiaryButton(text: "Register Here"),
      ],
    );
  }
}
