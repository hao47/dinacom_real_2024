import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:dinacom_2024/UI/bottom_navigation/item/poran/poran_provider.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile_provider.dart';
import 'package:dio/dio.dart';
import 'package:dinacom_2024/constants/url_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginPageController extends GetxController {

  final ValueNotifier<bool> isLoad = ValueNotifier<bool>(false);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  SharedPreferences? prefs;

  RxString? countryValue = "".obs;

  RxString? stateValue = "".obs;

  RxString? cityValue = "".obs;
  RxBool isCheckedTerms = false.obs;
  RxBool checkError = false.obs;

  void toggleTerms() {
    isCheckedTerms.value = !isCheckedTerms.value;
    checkError.value = false;
  }

  void errorTerms() {
    checkError.value = true;
  }




  login(String username, String password) async {


    print(username);
    print(password);

    isLoad.value = true;
    final response =
    await http.post(Uri.parse("https://urchin-app-hlgon.ondigitalocean.app/api/login"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': username,
          'password': password,
        }));
    if (response.statusCode == 200 || response.statusCode == 400) {
      isLoad.value = true;

      Map<String, dynamic> jsonResponse = json.decode(response.body);
      bool status = jsonResponse['status'];
      String message = jsonResponse['message'];
      String? token = jsonResponse['token'];


      print(response.body);

      if (status) {
        prefs = await SharedPreferences.getInstance();
        print(jsonResponse);

        await prefs!.setString("token", token!);


        // Future.delayed(Duration(days: 1));

        String? tokens = prefs!.getString('token');


        if(tokens != "" && tokens != null){

          Timer(
              const Duration(seconds: 2),() {

            Get.offAllNamed("/menu");

            Get.put(ProfileController());
            Get.put(PoranController());

            isLoad.value = false;
              },);
        }

        // Timer(
        //     const Duration(seconds: 2),() {
        //
        //   Get.offAllNamed("/menu");
        //
        //   Get.put(ProfileController());
        //   Get.put(PoranController());
        //
        //   isLoad.value = false;
        //     },);
      } else {
        isLoad.value = false;
      }
    } else {
      print(response.body);

      isLoad.value = false;
      throw Exception('ada yang salah');
    }
  }

  String generateRandomString(int length) {
    final random = Random();
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    return List.generate(length, (index) => chars[random.nextInt(chars.length)])
        .join();
  }
}
