import 'package:echo/source/styles.dart';
import 'package:flutter/material.dart';
import 'package:echo/source/components.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              _buildSplashImage(),
              const SizedBox(height: 40),
              _buildWelcomeText(),
              const SizedBox(height: 40),
              _buildActionButtons(context), // Pass context here
            ],
          ),
        ),
      ),
    );
  }

  // --- Image ---
  Widget _buildSplashImage() {
    return const Image(
      image: AssetImage("assets/images/image_splash_1.png"),
      height: 500,
    );
  }

  // --- Text ---
  Widget _buildWelcomeText() {
    return const Column(
      children: [
        Text(
          "Welcome to Echo!",
          style: AppTypography.heading1Bold,
        ),
        SizedBox(height: 4),
        Text(
          "Your shopping journey begins here.",
          style: AppTypography.bodyRegular,
        ),
      ],
    );
  }

  // --- Action Button ---
  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(
          text: "Continue",
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/splash_screen_2');
          },
        ),
        const SizedBox(height: 8),
        SecondaryButton(
          text: "Skip the Intro",
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/register');
          },
        ),
      ],
    );
  }
}
