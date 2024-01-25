import 'package:dinacom_2024/UI/bottom_navigation/bottom_navigation.dart';
import 'package:dinacom_2024/constants/url_routes.dart';
import 'package:dinacom_2024/validator/Validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SplashScreenController extends GetxController {
  late final SharedPreferences prefs;

  bool isHasToken = false;

  @override
  void onInit() async{
    super.onInit();

    await checkTokenShared();

    Timer(
        const Duration(seconds: 3),
        () => isHasToken
            ? Get.offNamed(UrlRoutes.bottom_nav)
            : Get.offNamed(UrlRoutes.auth_page));
  }


  @override
  void dispose() async{
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
  }
  Future<bool> checkTokenShared() async {
    prefs = await SharedPreferences.getInstance();


    // prefs.setString("token", "");
   String? token = prefs.getString('token');


    if (token != "" && token != null) {
      print(token);
      var isTokenValid =  await Validator.isTokenStillValid(token!);
      return isHasToken = isTokenValid;
    }else {
      return false;
    }
  }
}
