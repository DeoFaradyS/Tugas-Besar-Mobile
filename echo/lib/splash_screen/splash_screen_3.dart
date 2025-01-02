import 'package:echo/source/styles.dart';
import 'package:flutter/material.dart';
import 'package:echo/source/components.dart';

class SplashScreen3 extends StatelessWidget {
  const SplashScreen3({super.key});

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
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  // --- Image ---
  Widget _buildSplashImage() {
    return const Image(
      image: AssetImage("assets/images/image_splash_3.png"),
      height: 500,
    );
  }

  // --- Text ---
  Widget _buildWelcomeText() {
    return const Column(
      children: [
        Text(
          "Let’s Start Shopping!",
          style: AppTypography.heading1Bold,
        ),
        SizedBox(height: 4),
        Text(
          "Amazing deals are waiting for you.",
          style: AppTypography.bodyRegular,
        ),
      ],
    );
  }

  // --- Action Button ---
  Widget _buildActionButtons() {
    return const Column(
      children: [
        PrimaryButton(text: "Continue"),
        SizedBox(height: 8),
        SecondaryButton(text: "Skip the Intro"),
      ],
    );
  }
}
