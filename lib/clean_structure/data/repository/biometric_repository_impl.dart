import 'package:biometric_authentication/clean_structure/data/model/biometric_request.dart';
import 'package:biometric_authentication/clean_structure/domain/entities/biometric_entity.dart';
import 'package:biometric_authentication/clean_structure/domain/repositories/biometric_repository.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class BiometricRepositoryImpl implements BiometricRepository {
  final LocalAuthentication auth = LocalAuthentication();
  int failedAttempts = 0;

  @override
  Future<BiometricEntity> authenticate(
    BiometricRequest biometricRequest,
  ) async {
    try {
      bool isDeviceSupported = await auth.isDeviceSupported();
      bool canCheckBiometrics = await auth.canCheckBiometrics;

      if (!isDeviceSupported || !canCheckBiometrics) {
        return BiometricEntity(
          failedAttempts: failedAttempts,
          isAuthenticated: false,
        );
      }

      bool didAuthenticate = await auth.authenticate(
        localizedReason:
            'Authenticate to continue using\nbiometrics or device credentials.',
        options: const AuthenticationOptions(
          biometricOnly: false,
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );
      if (!didAuthenticate) {
        failedAttempts++;
      }
      return BiometricEntity(
        isAuthenticated: didAuthenticate,
        failedAttempts: failedAttempts,
      );
    } on PlatformException catch (_) {
      failedAttempts++;
      return BiometricEntity(
        isAuthenticated: false,
        failedAttempts: failedAttempts,
      );
    }
  }

  @override
  Future<void> systemFallback() async {
    await auth.authenticate(
      localizedReason: "Use device PIN / Pattern to continue",
      options: const AuthenticationOptions(
        biometricOnly: false,
        stickyAuth: true,
      ),
    );
  }
}
