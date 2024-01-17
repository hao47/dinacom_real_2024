import 'dart:convert';
import 'package:dinacom_2024/UI/bottom_navigation/bottom_navigation.dart';
import 'package:dinacom_2024/common/navigate.dart';
import 'package:dinacom_2024/constants/url_routes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VerifProvider extends ChangeNotifier {
  Future<dynamic> verif(BuildContext context, String email) async {
    final response =
        await http.post(Uri.parse("http://10.0.2.2:8080/api/emailver"),
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


        Navigate.navigatorNamed(context, UrlRoutes.auth_page);

        return true;
      } else {
        return false;
      }
    } else {
      throw Exception('ada yang salah');
    }
  }
}
