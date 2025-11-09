import 'package:get/get.dart';
import '../../presentation/pages/biometric_screen/biometric_screen.dart';
import '../../presentation/pages/dashboard_screen/dashboard_screen.dart';
import '../../presentation/pages/login/login_screen.dart';

abstract class Routes {
  static const loginPage = '/login';
  static const biometricPage = '/biometric';
  static const dashboardPage = '/dashboard';
}

class AppPages {
  static final routes = [
    GetPage(name: Routes.loginPage, page: () => const LoginScreen()),
    GetPage(name: Routes.biometricPage, page: () => const BiometricScreen()),
    GetPage(name: Routes.dashboardPage, page: () => const DashboardScreen()),
  ];
}
