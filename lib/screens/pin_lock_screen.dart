import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_pages.dart';

class PinLockScreen extends StatefulWidget {
  const PinLockScreen({super.key});

  @override
  State<PinLockScreen> createState() => _PinLockScreenState();
}

class _PinLockScreenState extends State<PinLockScreen> {
  final pinController = TextEditingController();

  void verifyPin() {
    if (pinController.text == "1234") {
      Get.snackbar('Success', 'PIN verified successfully!');
      Get.offAllNamed(Routes.DASHBOARD);
    } else {
      Get.snackbar('Error', 'Invalid PIN');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: const Text(
                "Enter PIN",
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
