import 'package:blog/routes/app_pages.dart';
import 'package:blog/shared/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  AuthService authService = AuthService();
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  final formkey = GlobalKey<FormState>();

  login() async {
    if (formkey.currentState!.validate()) {
      User? user = await authService.loginUser(textEditingControllerEmail.text, textEditingControllerPassword.text);
      if (user != null) {
        Get.snackbar("Succes", "Login successful");
        Get.toNamed(Routes.BLOG);
      } else {
        Get.snackbar("Eror", "E-mail or password is incorrect");
      }
    }
  }
}
