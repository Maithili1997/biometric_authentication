import 'package:biometric_authentication/clean_structure/data/model/login_request.dart';

import '../entities/login_entity.dart';

abstract class LoginRepository {
  Future<LoginEntity> loginApi(LoginRequest loginRequest);
}
