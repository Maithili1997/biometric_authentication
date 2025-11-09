import 'package:biometric_authentication/clean_structure/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({String? token}) {
    _token = token;
  }

  LoginModel.fromJson(dynamic json) {
    _token = json['token'];
  }
  String? _token;
  LoginModel copyWith({String? token}) => LoginModel(token: token ?? _token);
  @override
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    return map;
  }
}
