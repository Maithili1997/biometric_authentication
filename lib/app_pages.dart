import 'package:biometric_authentication/screens/biometric_screen.dart';
import 'package:biometric_authentication/screens/dashboard_screen.dart';
import 'package:biometric_authentication/screens/pin_lock_screen.dart';
import 'package:get/get.dart';
import '../screens/login_screen.dart';



abstract class Routes {
  static const LOGIN = '/login';
  static const BIOMETRIC = '/biometric';
  static const DASHBOARD = '/dashboard';
  static const PIN = '/pin';
}



class AppPages {
  static final routes = [
    GetPage(name: Routes.LOGIN, page: () => const LoginScreenPage()),
    GetPage(name: Routes.BIOMETRIC, page: () => const BiometricScreenPage()),
    GetPage(name: Routes.DASHBOARD, page: () => const DashboardScreenPage()),
    GetPage(name: Routes.PIN, page: () => const PinLockScreen()),
  ];
}
