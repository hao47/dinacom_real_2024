import 'dart:async';
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
    Timer(const Duration(seconds: 3), () => isHasToken ? Navigate.navigatorReplacement(context, UrlRoutes.home) : Navigate.navigatorReplacement(context, UrlRoutes.auth_page));


  }

  void checkTokenShared() async{

    prefs = await SharedPreferences.getInstance();

    // prefs.setString("token","");

    String? token = prefs.getString('token');

    print(token);
    if( token != "" || token != null ){

      bool isTokenValid = await Validator.isTokenStillValid(token!);
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
