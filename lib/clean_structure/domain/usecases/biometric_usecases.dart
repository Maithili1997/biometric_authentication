import 'package:biometric_authentication/clean_structure/data/model/biometric_request.dart';
import 'package:biometric_authentication/clean_structure/domain/repositories/biometric_repository.dart';

import '../entities/biometric_entity.dart';

class BiometricUseCases {
  final BiometricRepository repository;

  BiometricUseCases({required this.repository});

  Future<BiometricEntity> execute(BiometricRequest biometricRequest) {
    return repository.authenticate(biometricRequest);
  }

  Future<void> call() {
    return repository.systemFallback();
  }

}
