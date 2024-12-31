import 'package:echo/source/styles.dart';
import 'package:flutter/material.dart';
import '../source/components.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({super.key});

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

  // --- Widget untuk menampilkan gambar splash ---
  Widget _buildSplashImage() {
    return const Image(
      image: AssetImage("assets/images/image_splash_1.png"),
      height: 500,
    );
  }

  // --- Widget untuk menampilkan teks welcome ---
  Widget _buildWelcomeText() {
    return const Column(
      children: [
        Text(
          "Welcome to Echo!",
          style: AppTypography.heading1Bold,
        ),
        SizedBox(height: 8),
        Text(
          "Your shopping journey begins here.",
          style: AppTypography.bodyRegular,
        ),
      ],
    );
  }

  // --- Widget untuk menampilkan tombol aksi ---
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