import 'dart:async';
import 'dart:convert';
import 'package:dinacom_2024/UI/auth/register/regist_controller.dart';
import 'package:dinacom_2024/constants/url_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VerifControlller extends GetxController {
  Future<dynamic> verif( String email) async {
    final response =
        await http.post(Uri.parse("https://urchin-app-hlgon.ondigitalocean.app/api/emailver"),
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: jsonEncode({
              'email': email,
            }));
    if (response.statusCode == 200 || response.statusCode == 400) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      String message = jsonResponse['message'];

      if (message == "email Sudah terverifikasi") {


        print("halo");
        Get.toNamed( UrlRoutes.auth_page);


        // Get.toNamed(UrlRoutes.verif);
        return true;
      } else {
        return false;
      }
    } else {
      throw Exception('ada yang salah');
    }
  }


  final ValueNotifier<bool> _isEmailVerified = ValueNotifier<bool>(false);
  Timer? timer;



  Future _checkEmailVerified() async {

    final a = Get.put(RegistPageController());

    var check = await verif(a.emailControllerRegist.text);

    _isEmailVerified.value = check;

    if (_isEmailVerified.value) {
      timer?.cancel();
    }
  }

  @override
  void onInit() {
      if (!_isEmailVerified.value) {

        timer = Timer.periodic(
          const Duration(seconds: 3),
              (_) => _checkEmailVerified(),
        );
      }

    super.onInit();
  }

  @override
  void dispose() {
      timer?.cancel();
      super.dispose();
  }

}
