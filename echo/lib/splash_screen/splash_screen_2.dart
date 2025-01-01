import 'package:echo/source/styles.dart';
import 'package:flutter/material.dart';
import 'package:echo/source/components.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      image: AssetImage("assets/images/image_splash_2.png"),
      height: 500,
    );
  }

  // --- Text ---
  Widget _buildWelcomeText() {
    return const Column(
      children: [
        Text(
          "Explore Top Products!",
          style: AppTypography.heading1Bold,
        ),
        SizedBox(height: 4),
        Text(
          "Find the best products at unbeatable prices.",
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