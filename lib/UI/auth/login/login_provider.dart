

import 'dart:convert';

import 'package:dinacom_2024/constants/url_routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../common/navigate.dart';

class LoginProvider extends ChangeNotifier {
  final ValueNotifier<bool> isLoad = ValueNotifier<bool>(false);
  late final SharedPreferences prefs;
  login(BuildContext context, String username, String password) async {

    isLoad.value = true;
    notifyListeners();
    final response = await http.post(
      Uri.parse("http://10.0.2.2:8080/api/login"),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({    'email': username,
        'password': password,})
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      isLoad.value = true;
      notifyListeners();
      Map<String, dynamic> jsonResponse = json.decode(response.body);
        bool status = jsonResponse['status'];
        String message = jsonResponse['message'];
        String? token = jsonResponse['token'];
        if (status) {

          prefs = await SharedPreferences.getInstance();
          print(jsonResponse);

          await prefs.setString("token", token!);
      //     await prefs.setString("username", username);
      //     this.message.value = message;
      //     successfulLogin.value = true;
          isLoad.value = false;
          notifyListeners();
      //     print("INI UDAH MASUK KE LOGIN HEHEHE");
      //     Get.offNamed("/menu");
          
          Navigate.navigatorReplacement(context, UrlRoutes.home);
        } else {

          print(jsonResponse);
          isLoad.value = false;
          notifyListeners();
          // this.message.value = message;
          // successfulLogin.value = false;
          // isLoading.value = false;
          // print("INI SALAH KAMU NI GIMANA");
        }
      } else {
      print(response.body);

      isLoad.value = false;
          throw Exception('ada yang salah');
      }
    }
  }
