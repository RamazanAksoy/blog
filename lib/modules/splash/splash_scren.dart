import 'package:blog/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Image.asset("assets/images/logo.png"),
      )),
    );
  }
}
