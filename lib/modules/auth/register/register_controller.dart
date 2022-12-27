import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/service/auth_service.dart';

class RegisterController extends GetxController {
  AuthService authService = AuthService();
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  TextEditingController textEditingControllerPasswordConfirm = TextEditingController();
  final formkey = GlobalKey<FormState>();

  register() async {
    if (formkey.currentState!.validate()) {
      User? user = await authService.createUser(textEditingControllerEmail.text, textEditingControllerPassword.text);
      if (user != null) {
        Get.snackbar("Succes", "Registration Successful");
      }
    }
  }
}
