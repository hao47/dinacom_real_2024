

import 'dart:convert';

import 'package:dinacom_2024/constants/url_routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../common/navigate.dart';

class RegistProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController tanggaLahirController = TextEditingController();
  TextEditingController daerahController = TextEditingController();
  TextEditingController bioController = TextEditingController();



  final ValueNotifier<bool> isLoad = ValueNotifier<bool>(false);



  regist(BuildContext context,String daerah) async {

    print("a");

    isLoad.value = true;
    notifyListeners();
    final response = await http.post(
        Uri.parse("http://10.0.2.2:8080/api/user/register"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({

          'email': emailController.text ?? "",
          'username':  usernameController.text ?? "",
          'password': passwordController.text ?? "",
          'tanggal_lahir': tanggaLahirController.text ?? "",
          'daerah': daerah ?? "",
          'bio':bioController.text ?? ""

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

        isLoad.value = false;
        notifyListeners();

        Navigate.navigatorNamed(context, UrlRoutes.verif);
      } else {

        print(jsonResponse);
        isLoad.value = false;
        notifyListeners();
      }
    } else {
      print(response.body);

      isLoad.value = false;
      throw Exception('ada yang salah');
    }
  }
}
