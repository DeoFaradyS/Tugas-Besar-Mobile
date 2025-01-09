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

  Future postData(String email, String password) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/users'),
          body: {"email": email, "password": password});
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
