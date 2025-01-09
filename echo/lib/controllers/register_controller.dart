import 'package:echo/DB/echo_api.dart';
import 'package:flutter/material.dart';

class RegisterController {
  // Controller untuk input data
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Instance dari EchoApi
  final EchoApi echoApi = EchoApi();

  // Fungsi untuk memvalidasi email dan password
  bool validateInput(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      return false; // Jika ada yang kosong
    }

    // Validasi format email
    if (!email.endsWith('@gmail.com')) {
      return false; // Email harus berformat @gmail.com
    }

    // Validasi panjang password
    if (password.length < 8) {
      return false; // Password minimal 8 karakter
    }

    return true;
  }

  // Fungsi untuk melakukan registrasi
  Future<bool> register(String email, String password) async {
    // Validasi data input sebelum dikirim ke API
    if (!validateInput(email, password)) {
      return false; // Jika validasi gagal
    }

    // Mengirimkan data ke API
    return await echoApi.postData(email, password);
  }
}
