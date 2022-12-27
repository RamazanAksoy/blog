import 'package:blog/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../animation/fadeanimation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const FadeAnimation(
                      1,
                      Text(
                        "Welcome",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                      1.2,
                      Text(
                        "Automatic identity verification which enables you to verify your identity",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey[700], fontSize: 15),
                      )),
                ],
              ),
              FadeAnimation(
                  1.4,
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Illustration.png'))),
                  )),
              Column(
                children: <Widget>[
                  FadeAnimation(1.5, buildButtonLogin(context)),
                  const SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(1.6, buildButtonSignUp())
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  MaterialButton buildButtonLogin(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 60,
      onPressed: () {
        Get.toNamed(Routes.LOGIN);
      },
      shape: RoundedRectangleBorder(side: const BorderSide(color: Colors.black), borderRadius: BorderRadius.circular(50)),
      child: const Text(
        "Login",
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      ),
    );
  }

  Container buildButtonSignUp() {
    return Container(
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
          Get.toNamed(Routes.REGISTER);
        },
        color: Colors.yellow,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Text(
          "Sign up",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
    );
  }
}
