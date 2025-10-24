import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/pattern_lock_screen.dart';
import '../screens/pin_lock_screen.dart';


String fallbackType = "pin";

void showFallback() {
  List<Widget> fallbackOptions = [];

  if (fallbackType == "pattern" || fallbackType == "both") {
    fallbackOptions.add(
      ListTile(
        leading: const Icon(Icons.pattern, color: Colors.indigo),
        title: const Text('Use Pattern'),
        onTap: () {
          Get.back();
          _authenticateWithPattern();
        },
      ),
    );
  }

  if (fallbackType == "pin" || fallbackType == "both") {
    fallbackOptions.add(
      ListTile(
        leading: const Icon(Icons.pin, color: Colors.indigo),
        title: const Text('Use PIN'),
        onTap: () {
          Get.back();
          _authenticateWithPIN();
        },
      ),
    );
  }

  if (fallbackOptions.isEmpty) {
    fallbackOptions.add(
      const Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text(
            "No fallback set. Please set up PIN or Pattern in settings.",
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
      ),
    );
  }

  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Wrap(
        children: [
          const Center(
            child: Text(
              'Fallback Authentication',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo),
            ),
          ),
          const SizedBox(height: 20),
          ...fallbackOptions,
        ],
      ),
    ),
    isScrollControlled: true,
  );
}


void _authenticateWithPattern() {
  Get.to(() => const PatternLockScreen());
}


void _authenticateWithPIN() {
  Get.to(() => const PinLockScreen());
}
