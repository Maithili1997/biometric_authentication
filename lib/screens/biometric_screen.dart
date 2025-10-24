import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/biometric_controller.dart';

class BiometricScreenPage extends StatefulWidget {
  const BiometricScreenPage({super.key});

  @override
  State<BiometricScreenPage> createState() => _BiometricScreenPageState();
}

class _BiometricScreenPageState extends State<BiometricScreenPage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BiometricController());

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
                controller.authenticate();
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
