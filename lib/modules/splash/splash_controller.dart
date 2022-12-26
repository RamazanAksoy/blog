import 'package:blog/shared/service/auth_service.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  AuthService authService=AuthService();

  @override
  void onReady() async{
    await Future.delayed(const Duration(milliseconds: 3000));
    authService.userNullCheck();
    super.onReady();
  }
  @override
  void onInit() {
    print("Splash sayfası açıldı");
    super.onInit();
  }
}
