import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_pages.dart';

class PatternLockScreen extends StatelessWidget {
  const PatternLockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // For demonstration, automatically “verify” success
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pattern Lock"),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.pattern, size: 100, color: Colors.indigo),
            const SizedBox(height: 20),
            const Text("Draw your unlock pattern"),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Get.snackbar('Success', 'Pattern verified successfully!');
                Get.offAllNamed(Routes.DASHBOARD);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
              child: const Text("Simulate Success"),
            )
          ],
        ),
      ),
    );
  }
}
