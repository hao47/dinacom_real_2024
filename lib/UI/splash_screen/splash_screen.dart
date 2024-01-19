import 'dart:async';
import 'package:dinacom_2024/UI/bottom_navigation/bottom_navigation.dart';
import 'package:dinacom_2024/constants/url_routes.dart';
import 'package:dinacom_2024/validator/Validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/navigate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late final SharedPreferences prefs;
  bool isHasToken = false;

  @override
  void initState() {
    super.initState();

    checkTokenShared();
    Timer(const Duration(seconds: 3), () => isHasToken ?

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MainScreen();
    },))
        : Navigate.navigatorReplacement(context, UrlRoutes.auth_page));


  }

  void checkTokenShared() async{

    prefs = await SharedPreferences.getInstance();

    // prefs.setString("token","eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImRhZmZhIiwiZW1haWwiOiJkYWZmYXJvYmFuaTU1MUBnbWFpbC5jb20iLCJleHAiOjE3MDU2MTQ0Nzh9.OjGkU2OwenmqVaf0qVm6dIOSoZc-_gOt7w_ToqY2ROo");

    // prefs.setString("token","eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImRhZmZhIiwiZW1haWwiOiJkYWZmYXJvYmFuaTU1MUBnbWFpbC5jb20iLCJpZCI6MSwiZXhwIjoxNzA1NjYxOTU0fQ.aamqFwyjMlqiTpl8OC72N0axTw07rh6RBmxsKukcHDs");
    prefs.setString("token","eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImRhZmZhIiwiZW1haWwiOiJkYWZmYXJvYmFuaTU1MUBnbWFpbC5jb20iLCJpZCI6MjcsImV4cCI6MTcwNTc1NTE1Nn0.CmAUTazX1feyWj4XPSKY7VPPlZixKo_ZkWHy3da2Z-g");
    String? token = prefs.getString('token');

    if( token != "" && token != null ){

      print(token);
      bool isTokenValid = await Validator.isTokenStillValid(token!);
      print(isTokenValid);
      isHasToken = isTokenValid;
    }



  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Center(
            child: Image.asset("assets/images/logo.png",fit: BoxFit.fill,width: screenWidth * 0.35,)
          ),
        ),
      ),
    );
  }
}
