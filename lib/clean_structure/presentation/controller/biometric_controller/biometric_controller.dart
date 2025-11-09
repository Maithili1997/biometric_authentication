import 'package:biometric_authentication/clean_structure/data/model/biometric_request.dart';
import 'package:biometric_authentication/clean_structure/domain/entities/biometric_entity.dart';
import 'package:biometric_authentication/clean_structure/domain/usecases/biometric_usecases.dart';
import 'package:get/get.dart';

class BiometricController extends GetxController{

  final BiometricUseCases biometricUseCases;

  BiometricController({required this.biometricUseCases});

  bool isLoading = false;
  BiometricEntity? biometricEntity;

  var isAuthenticated = false.obs;
  var failedAttempts = 0.obs;


  Future<BiometricEntity?> authenticate() async {
    final request = BiometricRequest(
      biometricOnly: false,
      maxAttempts: 3,
      allowFallback: true,
    );

    final result = await biometricUseCases.execute(request);

    isAuthenticated.value = result.isAuthenticated ?? false;
    failedAttempts.value = result.failedAttempts ?? 0;

    if (isAuthenticated.value) {
      Get.snackbar("Success", "Authentication successful");
    } else {
      Get.snackbar("Failed", "Attempt: ${failedAttempts.value}");
      if (failedAttempts.value >= request.maxAttempts) {
        await biometricUseCases.call();
      }
    }
    return null;
  }

}