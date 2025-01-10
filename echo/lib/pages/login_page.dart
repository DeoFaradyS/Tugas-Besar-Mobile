import 'package:echo/DB/echo_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:echo/source/styles.dart';
import 'package:echo/source/components.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final EchoApi _echoApi = EchoApi(); // Inisialisasi EchoApi

  // Flag untuk memeriksa apakah sedang melakukan login
  bool _isLoading = false;

  // Fungsi login yang akan dipanggil saat tombol login ditekan
  void _login(BuildContext context) async {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Validasi input
    if (email.isEmpty || password.isEmpty) {
      _showSnackBar(context, "Email and password cannot be empty.");
      return;
    }

    setState(() {
      _isLoading = true; // Menampilkan loading indicator
    });

    // Cek login melalui API
    bool isSuccess = await _echoApi.login(email, password);

    setState(() {
      _isLoading = false; // Menyembunyikan loading indicator
    });

    if (isSuccess) {
      _showSnackBar(context, "Login successful!");
      // Pindah ke halaman berikutnya, misalnya HomePage
      Navigator.pushReplacementNamed(context, '/profile');
    } else {
      _showSnackBar(context, "Invalid email or password.");
    }
  }

  // Menampilkan Snackbar
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.black, // Sesuaikan dengan warna tema
        behavior: SnackBarBehavior.fixed, // SnackBar tetap ada di bawah layar
      ),
    );
  }

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Email", style: AppTypography.bodyRegular),
        const SizedBox(height: 8),
        CustomTextFormField(
          controller: _emailController,
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
        CustomTextFormField(
          controller: _passwordController,
          hintText: '********',
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
        ),
      ],
    );
  }

  // --- Action Buttons ---
  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        _isLoading
            ? const CircularProgressIndicator() // Menampilkan indikator loading saat login
            : PrimaryButton(
                text: "Login",
                onPressed: () => _login(context), // Perhatikan perubahan di sini
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
          "Don’t have an account?",
          style: AppTypography.bodyRegular,
        ),
        TertiaryButton(
          text: "Register Here",
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/register');
          },
        ),
      ],
    );
  }
}
