import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import '../../app_pages.dart';


class BiometricController extends GetxController {
  final LocalAuthentication auth = LocalAuthentication();
  var isAuthenticated = false.obs;
  var failedAttempts = 0;

  Future<void> authenticate() async {
    bool isDeviceSupported = await auth.isDeviceSupported();
    bool canCheckBiometrics = await auth.canCheckBiometrics;
    final List<BiometricType> availableBiometrics = await auth
        .getAvailableBiometrics();

    try {
      if (!isDeviceSupported) {
        Get.snackbar('Error', 'Device authentication not supported');
        return;
      }

      bool didAuthenticate = false;
      if (canCheckBiometrics && availableBiometrics.isNotEmpty) {
        Get.snackbar(
          snackPosition: SnackPosition.TOP,
          'Info',
          'Authenticating using biometrics...',
        );
        didAuthenticate = await auth.authenticate(
          localizedReason:
              'Authenticate to continue using\nbiometrics or device credentials.',
          options: const AuthenticationOptions(
            biometricOnly: false,
            stickyAuth: true,
            useErrorDialogs: true,
          ),
        );
      } else {
        Get.snackbar(
          'Fallback',
          'No biometrics enrolled — using device PIN or pattern.',
          snackPosition: SnackPosition.TOP,
        );

        didAuthenticate = await auth.authenticate(
          localizedReason:
              'Authenticate using your device PIN, pattern, or password.',
          options: const AuthenticationOptions(
            biometricOnly: false,
            stickyAuth: true,
            useErrorDialogs: true,
          ),
        );
      }
      if (didAuthenticate) {
        isAuthenticated.value = true;
        failedAttempts = 0;
        Get.snackbar('Success', 'Authentication successful!');
        Get.offAllNamed(Routes.dashboard);
      } else {
        failedAttempts++;
        Get.snackbar('Failed', 'Authentication failed ($failedAttempts/3)');
        if (failedAttempts >= 3) {
          Get.snackbar(
            'Fallback',
            'Biometric attempts exceeded — use device PIN/pattern.',
            snackPosition: SnackPosition.TOP,
          );
          await auth.authenticate(
            localizedReason:
                'Authenticate using your device PIN, pattern, or password.',
            options: const AuthenticationOptions(
              biometricOnly: false,
              stickyAuth: true,
              useErrorDialogs: true,
            ),
          );
          failedAttempts = 0;
        }
      }
    } on PlatformException catch (e) {
      Get.snackbar('Error', e.message ?? 'Something went wrong');
      await systemFallback();
    }
  }

  Future<void> systemFallback() async {
    try {
      await auth.authenticate(
        localizedReason:
            'Authenticate using your device PIN, pattern, or password.',
        options: const AuthenticationOptions(
          biometricOnly: false,
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );
    } catch (e) {
      Get.snackbar('Error', 'Unable to open system authentication screen.');
    }
  }
}
