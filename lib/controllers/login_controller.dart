import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final emailController = TextEditingController(text: 'eve.holt@reqres.in').obs;
  final passwordController = TextEditingController(text: 'cityslicka').obs;

  Future<bool> login() async {
    final url = Uri.parse('https://reqres.in/api/login');
    final response = await http.post(
      url,
      body: {'email': emailController.value, 'password': passwordController.value},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data.containsKey('token');
    } else {
      return false;
    }
  }
}
