import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../screens/dashboard_screen.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController(text: 'eve.holt@reqres.in').obs;
  final passwordController = TextEditingController(text: 'cityslicka').obs;

  Future<bool> login() async {
    final url = Uri.parse('https://reqres.in/api/login');
    final response = await http.post(
      url,
      headers: {
        'x-api-key': 'reqres-free-v1',
      },
      body: {'email': emailController.value.text, 'password': passwordController.value.text},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      Get.offAll(DashboardScreenPage());
      return data.containsKey('token');
    } else {
      return false;
    }
  }
}
