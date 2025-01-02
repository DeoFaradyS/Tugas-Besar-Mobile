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
      crossAxisAlignment: CrossAxisAlignment.start, // Teks rata kiri
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
    return const Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Email", style: AppTypography.bodyRegular),
            SizedBox(height: 8),
            CustomTextFormField(
              hintText: 'example@gmail.com',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            Text("Email", style: AppTypography.bodyRegular),
            SizedBox(height: 8),
            CustomTextFormField(
              hintText: '********',
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        )
      ],
    );
  }

  // --- Action Buttons ---
  Widget _buildActionButtons() {
    return const Column(
      children: [
        PrimaryButton(
          text: "Login",
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don’t have a account?",
              style: AppTypography.bodyRegular,
            ),
            TertiaryButton(text: "Register Here"),
          ],
        )
      ],
    );
  }
}
