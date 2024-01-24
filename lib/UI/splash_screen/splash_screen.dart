import 'dart:async';

import 'package:dinacom_2024/UI/splash_screen/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Get.put(SplashScreenController());
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Center(
              child: Image.asset(
            "assets/images/logo.png",
            fit: BoxFit.fill,
            width: screenWidth * 0.35,
          )),
        ),
      ),
    );
  }
}
