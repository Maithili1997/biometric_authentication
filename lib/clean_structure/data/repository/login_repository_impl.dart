import 'package:biometric_authentication/clean_structure/core/network/api_services.dart';
import 'package:biometric_authentication/clean_structure/core/network/services.dart';
import 'package:biometric_authentication/clean_structure/data/model/login_request.dart';
import 'package:biometric_authentication/clean_structure/domain/entities/login_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../model/login_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<LoginEntity> loginApi(LoginRequest loginRequest)async {
    try{
      final response = await ApiService.post(loginRequest, loginUrl);
      final model = LoginModel.fromJson(response);
      return LoginEntity(token: model.token);
    }catch(e){
      throw Exception(e);
    }
  }

}