import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:echo/source/styles.dart';
import 'package:echo/source/components.dart';
import 'package:echo/controllers/register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterController _controller = RegisterController();

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
        _buildInputField(
          label: "Email",
          controller: _controller.emailController,
          hintText: 'example@gmail.com',
        ),
        const SizedBox(height: 16),
        _buildInputField(
          label: "Password",
          controller: _controller.passwordController,
          hintText: '********',
          obscureText: true,
        ),
      ],
    );
  }

  // --- Input Field Builder ---
  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        CustomTextFormField(
          controller: controller,
          hintText: hintText,
          obscureText: obscureText,
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
          onPressed: () => _handleRegister(context),
        ),
        const SizedBox(height: 24),
        _buildLoginText(context),
      ],
    );
  }

  // --- Handle Register ---
  Future<void> _handleRegister(BuildContext context) async {
    final email = _controller.emailController.text.trim();
    final password = _controller.passwordController.text.trim();

    if (!_validateInputs(context, email, password)) return;

    try {
      final isSuccess = await _controller.register(email, password);
      if (isSuccess) {
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        _showSnackBar(context, "Registration failed. Please try again.");
      }
    } catch (e) {
      _showSnackBar(context, "An error occurred. Please try again.");
    }
  }

  // --- Input Validation ---
  bool _validateInputs(BuildContext context, String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      _showSnackBar(context, "Please fill in all fields.");
      return false;
    }

    if (!email.endsWith('@gmail.com')) {
      _showSnackBar(context, "Email must use @gmail.com domain.");
      return false;
    }

    if (password.length < 8) {
      _showSnackBar(context, "Password must be at least 8 characters long.");
      return false;
    }

    return true;
  }

  // --- Show SnackBar ---
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  // --- Login Text ---
  Widget _buildLoginText(BuildContext context) {
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
