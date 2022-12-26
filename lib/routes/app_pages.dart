import 'package:blog/modules/login/login_binding.dart';
import 'package:blog/modules/login/login_scren.dart';
import 'package:blog/modules/register/register_binding.dart';
import 'package:blog/modules/register/register_scren.dart';
import 'package:get/get.dart';

import '../modules/home/home_binding.dart';
import '../modules/home/home_scren.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_scren.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(name: Routes.HOME, page: () => const HomeScreen(), binding: HomeBinding()),
    GetPage(name: Routes.SPLASH, page: () => const SplashScreen(), binding: SplashBinding()),
    GetPage(name: Routes.REGISTER, page: () => const RegisterScreen(), binding: RegisterBinding()),
    GetPage(name: Routes.LOGIN, page: () => const LoginScreen(), binding: LoginBinding()),
  ];
}
