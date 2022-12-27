import 'package:blog/modules/auth/login/login_controller.dart';
import 'package:blog/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../animation/fadeanimation.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: buildPage(context),
    );
  }

  SizedBox buildPage(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const FadeAnimation(
                        1,
                        Text(
                          "Login",
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                        1.2,
                        Text(
                          "Login to your account",
                          style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                        )),
                  ],
                ),
                Form(
                  key: controller.formkey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(1.2, makeInput(controller.textEditingControllerEmail, label: "Email")),
                        FadeAnimation(1.3, makeInput(controller.textEditingControllerPassword, label: "Password", obscureText: true)),
                      ],
                    ),
                  ),
                ),
                FadeAnimation(1.4, buildButtonLogin()),
                FadeAnimation(1.5, buildButtonSignUp())
              ],
            ),
          ),
          FadeAnimation(1.2, buildContainerBottomBackground(context))
        ],
      ),
    );
  }

  Container buildContainerBottomBackground(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/background.png'), fit: BoxFit.cover)),
    );
  }

  Row buildButtonSignUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text("Don't have an account?"),
        TextButton(
            onPressed: () {
              Get.toNamed(Routes.REGISTER);
            },
            child: const Text(
              "Sign up",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            )),
      ],
    );
  }

  Padding buildButtonLogin() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        padding: const EdgeInsets.only(top: 3, left: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: const Border(
              bottom: BorderSide(color: Colors.black),
              top: BorderSide(color: Colors.black),
              left: BorderSide(color: Colors.black),
              right: BorderSide(color: Colors.black),
            )),
        child: MaterialButton(
          minWidth: double.infinity,
          height: 60,
          onPressed: () {
            controller.login();
          },
          color: Colors.greenAccent,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: const Text(
            "Login",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget makeInput(
    TextEditingController textEditingController, {
    label,
    obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'boş olamaz';
            }
            return null;
          },
          controller: textEditingController,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
