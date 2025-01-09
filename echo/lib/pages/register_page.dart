import 'package:echo/DB/echo_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:echo/source/styles.dart';
import 'package:echo/source/components.dart';
import 'package:echo/controllers/register_controller.dart'; // Import controller

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterController _controller =
      RegisterController(); // Instance dari controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Email"),
        const SizedBox(height: 8),
        CustomTextFormField(
          controller: _controller
              .emailController, // Menggunakan controller dari RegisterController
          hintText: 'example@gmail.com',
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Password"),
        const SizedBox(height: 8),
        CustomTextFormField(
          controller: _controller
              .passwordController, // Menggunakan controller dari RegisterController
          obscureText: true,
          hintText: '********',
        ),
      ],
    );
  }

  // --- Action Buttons ---
  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(
          text: "Register",
          onPressed: () async {
            final email = _controller.emailController.text.trim();
            final password = _controller.passwordController.text.trim();

            // Validasi email
            if (email.isEmpty || password.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Please fill in all fields."),
                ),
              );
              return; // Early return jika ada field yang kosong
            }

            // Validasi format email
            if (!email.endsWith('@gmail.com')) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Email must use @gmail.com domain."),
                ),
              );
              return;
            }

            // Validasi panjang password
            if (password.length < 8) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Password must be at least 8 characters long."),
                ),
              );
              return;
            }

            // Registrasi dengan controller
            bool response = await _controller.register(email, password);

            if (response) {
              // Jika berhasil, navigasi ke halaman berikutnya
              Navigator.of(context).popAndPushNamed('/profile');
            } else {
              // Jika gagal, tampilkan pesan kesalahan
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Registration failed. Please try again."),
                ),
              );
            }
          },
        ),
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
            // Navigasi ke halaman login jika sudah punya akun
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      ],
    );
  }
}
