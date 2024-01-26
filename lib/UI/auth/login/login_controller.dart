import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:dinacom_2024/UI/bottom_navigation/item/poran/poran_provider.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
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





  login(String username, String password,BuildContext context) async {



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


        showCustom(context);

      }
    } else {
      print(response.body);

      isLoad.value = false;
      throw Exception('ada yang salah');
    }
  }

  showCustom(BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);

    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(5),
        color: Colors.black.withOpacity(0.85),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.max,
        children: [

          Expanded(
            child: Text(
              "maaf, email atau username sudah ada",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
    fToast.showToast(
        child: toast,
        toastDuration: const Duration(seconds: 3),
        gravity: ToastGravity.SNACKBAR,
        isDismissable: true
    );
  }
  String generateRandomString(int length) {
    final random = Random();
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    return List.generate(length, (index) => chars[random.nextInt(chars.length)])
        .join();
  }
}
