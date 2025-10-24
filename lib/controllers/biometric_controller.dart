
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import '../app_pages.dart';



class BiometricController extends GetxController {

  final LocalAuthentication auth = LocalAuthentication();
  var isAuthenticated = false.obs;
  var failedAttempts = 0;

  Future<void> authenticate() async {
    bool isDeviceSupported = await auth.isDeviceSupported();
    bool canCheckBiometrics = await auth.canCheckBiometrics;
    final List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();

    try {
      if (!isDeviceSupported) {
        Get.snackbar('Error', 'Device authentication not supported');
      //  showFallback();
        return;
      }

      bool didAuthenticate = false;
      if (canCheckBiometrics && availableBiometrics.isNotEmpty) {
        Get.snackbar(
          snackPosition: SnackPosition.TOP,
          'Info',
          'Authenticating using biometrics...',
          // mainButton: TextButton(
          //   style: TextButton.styleFrom(backgroundColor: Colors.indigo),
          //   onPressed: () {
          //     AppSettings.openAppSettings(type: AppSettingsType.generalSettings);
          //   },
          //   child: const Text('Open Settings', style: TextStyle(color: Colors.white)),
          // )

        );
        didAuthenticate = await auth.authenticate(
          localizedReason:
          'Authenticate to continue using biometrics or device credentials.',
          options: const AuthenticationOptions(
            biometricOnly: false, // allows system PIN/pattern fallback
            stickyAuth: true,
            useErrorDialogs: true,
          ),
        );
      //  showFallback();
       // return;
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
            biometricOnly: false, // direct system fallback
            stickyAuth: true,
            useErrorDialogs: true,
          ),
        );
      // if(availableBiometrics.contains(BiometricType.face)){
      //   Get.snackbar('Info', 'Face ID available — look at your device to authenticate');
      //  // showFallback();
      // }else if (availableBiometrics.contains(BiometricType.fingerprint)) {
      //   Get.snackbar('Info', 'Fingerprint available — touch the sensor to authenticate');
      // //  showFallback();
      }


      // final bool didAuthenticate = await auth.authenticate(
      //   localizedReason: 'Please authenticate using your fingerprint or face',
      //   options: const AuthenticationOptions(
      //     biometricOnly: true,
      //     stickyAuth: true,
      //   ),
      // );


      if (didAuthenticate) {
        isAuthenticated.value = true;
        failedAttempts = 0;
        Get.snackbar('Success', 'Authentication successful!');
        Get.offAllNamed(Routes.DASHBOARD);
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
         // showFallback();
        }
      }

    } on PlatformException catch (e) {
      Get.snackbar('Error', e.message ?? 'Something went wrong');
      await systemFallback();
    //  showFallback();
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




