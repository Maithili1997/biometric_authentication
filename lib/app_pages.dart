import 'package:get/get_navigation/src/routes/get_route.dart';
import 'normal_structure/screens/biometric_screen.dart';
import 'normal_structure/screens/dashboard_screen.dart';
import 'normal_structure/screens/login_screen.dart';

abstract class Routes {
  static const login = '/login';
  static const biometric = '/biometric';
  static const dashboard = '/dashboard';
}

class AppPages {
  static final routes = [
    GetPage(name: Routes.login, page: () => const LoginScreenPage()),
    GetPage(name: Routes.biometric, page: () => const BiometricScreenPage()),
    GetPage(name: Routes.dashboard, page: () => const DashboardScreenPage()),
  ];
}
