
import 'package:dinacom_2024/UI/auth/auth_page_view.dart';
import 'package:dinacom_2024/UI/auth/login/login_page_view.dart';
import 'package:dinacom_2024/UI/auth/register/regist_page_view.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/beranda/beranda.dart';
import 'package:dinacom_2024/UI/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

import '../../constants/url_routes.dart';


var appRoutes = {

  UrlRoutes.initial: (context) => SplashScreen(),
  UrlRoutes.regist: (context) =>  RegistPageView(),
  // UrlRoutes.login: (context) =>  LoginPageView(),
  UrlRoutes.auth_page: (context) =>  AuthPageView(),
  UrlRoutes.home: (context) =>  Beranda(),
};