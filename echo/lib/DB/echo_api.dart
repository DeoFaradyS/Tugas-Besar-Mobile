import 'dart:convert';

import 'package:echo/Model/echo_api_model.dart';
import 'package:http/http.dart' as http;

class EchoApi {
  final baseUrl = 'https://6777960480a79bf919022ea7.mockapi.io/api/v1';
  final baseUrll = 'https://6777960480a79bf919022ea7.mockapi.io/api/v1/users';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(baseUrll));
      if (response.statusCode == 200) {
        Iterable iterable = jsonDecode(response.body);
        List<Users> user = iterable.map((e) => Users.fromJson(e)).toList();
        return user;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  Future<bool> postData(String email, String password) async {
    try {
      // Validasi email harus menggunakan domain @gmail.com
      if (!email.endsWith('@gmail.com')) {
        throw Exception("Email must use @gmail.com domain.");
      }

      // Validasi panjang password minimal 8 karakter
      if (password.length < 8) {
        throw Exception("Password must be at least 8 characters long.");
      }

      // Kirim data ke server jika validasi lolos
      final response = await http.post(
        Uri.parse('$baseUrl/users'),
        body: {"email": email, "password": password},
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return false;
    }
  }

  // Metode login yang memeriksa apakah email dan password cocok dengan data di API
  Future<bool> login(String email, String password) async {
    try {
      // Ambil data pengguna dari API
      List<Users> users = await getData();
      // Cari pengguna yang cocok dengan email dan password
      for (var user in users) {
        if (user.email == email && user.password == password) {
          return true; // Login berhasil
        }
      }
      return false; // Login gagal jika tidak ada yang cocok
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return false; // Gagal jika ada error dalam mengambil data
    }
  }
}
