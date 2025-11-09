import 'package:biometric_authentication/clean_structure/data/model/login_request.dart';
import 'package:biometric_authentication/clean_structure/domain/repositories/login_repository.dart';

import '../entities/login_entity.dart';

class LoginUseCases {
  final LoginRepository loginRepository;

  LoginUseCases({required this.loginRepository});

  Future<LoginEntity> execute(LoginRequest loginRequest) {
    return loginRepository.loginApi(loginRequest);
  }
}
