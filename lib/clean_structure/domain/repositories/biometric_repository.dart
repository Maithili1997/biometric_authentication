import 'package:biometric_authentication/clean_structure/data/model/biometric_request.dart';
import 'package:biometric_authentication/clean_structure/domain/entities/biometric_entity.dart';

abstract class BiometricRepository{
  Future<BiometricEntity> authenticate(BiometricRequest biometricRequest);
  Future<void> systemFallback();
}