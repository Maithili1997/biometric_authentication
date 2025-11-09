import 'package:biometric_authentication/clean_structure/data/model/login_request.dart';
import 'package:biometric_authentication/clean_structure/domain/entities/login_entity.dart';
import 'package:biometric_authentication/clean_structure/domain/usecases/login_usecases.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  final LoginUseCases loginUseCases;

  LoginController({required this.loginUseCases});

  bool isLoading = false;
  LoginEntity? loginEntity;

  final emailController = TextEditingController(text: 'eve.holt@reqres.in').obs;
  final passwordController = TextEditingController(text: 'cityslicka').obs;

  Future<LoginEntity?> loginApi(BuildContext context) async {

    isLoading = true;


    try {
      LoginRequest request = LoginRequest(email: emailController.value.text, password: passwordController.value.text);
      loginEntity = await loginUseCases.execute(request);
    isLoading = false;
      return loginEntity!;
    } catch (e) {
      isLoading = false;
      loginEntity = null;
    } finally {
      isLoading = false;
      isLoading = false;

    }
    return null;
  }

}