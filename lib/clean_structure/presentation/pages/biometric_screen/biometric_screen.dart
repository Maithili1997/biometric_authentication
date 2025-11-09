import 'package:biometric_authentication/clean_structure/data/repository/biometric_repository_impl.dart';
import 'package:biometric_authentication/clean_structure/domain/usecases/biometric_usecases.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/biometric_controller/biometric_controller.dart';


class BiometricScreen extends StatefulWidget {
  const BiometricScreen({super.key});

  @override
  State<BiometricScreen> createState() => _BiometricScreenState();
}

class _BiometricScreenState extends State<BiometricScreen> {
  @override
  Widget build(BuildContext context) {
    final biometricController = Get.put(BiometricController(biometricUseCases: BiometricUseCases(repository: BiometricRepositoryImpl())));

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.indigo,
          title: const Text('Biometric Authentication',style: TextStyle(color: Colors.white),)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.fingerprint, size: 100, color: Colors.indigo),
            const SizedBox(height: 20),
            const Text('Use your biometric to continue'),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: (){
                biometricController.authenticate();
              },
              icon: const Icon(Icons.fingerprint, color: Colors.indigo),
              label: const Text('Use fingerprint or faceId',style: TextStyle(color: Colors.indigo),),
            )

          ],
        ),
      ),
    );
  }
}
