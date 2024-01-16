

import 'dart:convert';

import 'package:dinacom_2024/constants/url_routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../common/navigate.dart';

class RegistProvider extends ChangeNotifier {



  final ValueNotifier<bool> isLoad = ValueNotifier<bool>(false);



  regist(BuildContext context, String email, String username,String password, String tanggal_lahir,String daerah) async {

    isLoad.value = true;
    notifyListeners();
    final response = await http.post(
        Uri.parse("http://10.0.2.2:8080/api/user/register"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({

          'email': email,
          'username': username,
          'password': password,
          'tanggal_lahir': tanggal_lahir,
          'daerah': "Kudus",

        })
    );
    if (response.statusCode == 201 || response.statusCode == 400) {
      isLoad.value = true;
      notifyListeners();
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      bool status = jsonResponse['status'];
      String message = jsonResponse['message'];
      String? token = jsonResponse['token'];
      if (status) {

        print(jsonResponse);

        //     await prefs.setString("username", username);
        //     this.message.value = message;
        //     successfulRegist.value = true;
        isLoad.value = false;
        notifyListeners();
        //     print("INI UDAH MASUK KE LOGIN HEHEHE");
        //     Get.offNamed("/menu");

        Navigate.navigatorReplacement(context, UrlRoutes.auth_page);
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
