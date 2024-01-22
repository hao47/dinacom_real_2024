import 'package:dinacom_2024/UI/bottom_navigation/bottom_navigation.dart';
import 'package:dinacom_2024/constants/url_routes.dart';
import 'package:dinacom_2024/validator/Validator.dart';
import 'package:flutter/material.dart';
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

    // print("ada" + isHasToken.toString());

    Timer(
        const Duration(seconds: 3),
        () => isHasToken
            ? Get.offNamed(UrlRoutes.bottom_nav)
            : Get.offNamed(UrlRoutes.auth_page));
  }

  Future<bool> checkTokenShared() async {
    prefs = await SharedPreferences.getInstance();


    // prefs.setString("token", "");
    // prefs.setString("token", "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImRhZmZhIiwiZW1haWwiOiJkYWZmYXJvYmFuaTU1MUBnbWFpbC5jb20iLCJpZCI6MzMsImV4cCI6MTcwNTgyMzM5MX0.Aum4RC1UNbrymoaK5-ebU3ASbhqKYGGwtJxolNh_1e4");
    String? token = prefs.getString('token');

    // print(token);

    if (token != "" && token != null) {
      print(token);
      var isTokenValid =  await Validator.isTokenStillValid(token!);
      // print(isTokenValid);
      return isHasToken = isTokenValid;
    }else {
      return false;
    }
  }
}
