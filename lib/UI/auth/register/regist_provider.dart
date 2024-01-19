

import 'dart:convert';
import 'dart:math';
import 'package:dinacom_2024/constants/url_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../common/navigate.dart';

String generateRandomString(int length) {
  final random = Random();
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  return List.generate(length, (index) => chars[random.nextInt(chars.length)])
      .join();
}

class RegistProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController tanggaLahirController = TextEditingController();
  TextEditingController daerahController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  bool isCheckedTerms = false;
  bool checkError = false;

  void toggleTerms() {
    isCheckedTerms = !isCheckedTerms;
    checkError = false;
    notifyListeners();
  }

  void errorTerms() {
    checkError = true;
    notifyListeners();
  }

  final ValueNotifier<bool> isLoad = ValueNotifier<bool>(false);



  regist(BuildContext context,String daerah,XFile? pickedfile,String pw) async {
    String randomString = generateRandomString(10);
    try {

      isLoad.value = true;
      notifyListeners();
      Dio dio = Dio();

      if (pickedfile != null) {


        var request = http.MultipartRequest(
          'POST',
          Uri.parse('http://10.0.2.2:8080/api/user/register'),
        );

        request.headers['Content-Type'] = 'multipart/form-data';

        request.files.add(await http.MultipartFile.fromPath(
          'userFile',
          pickedfile.path,
          filename: randomString + ".jpg",
        ));

        request.fields['email'] = emailController.text ?? "";
        request.fields['username'] = usernameController.text ?? "";
        request.fields['password'] = pw ?? "";
        request.fields['tanggal_lahir'] = tanggaLahirController.text ?? "";
        request.fields['daerah'] = daerah ?? "";
        request.fields['bio'] = bioController.text ?? "";

        final response = await request.send();

        String responseBody = await response.stream.bytesToString();
        print("Response Body: $responseBody");

        print(responseBody);
        if (response.statusCode == 201 || response.statusCode == 400) {
          isLoad.value = true;
          notifyListeners();
          Map<String, dynamic> jsonResponse = json.decode(responseBody);
          bool status = jsonResponse['status'];
          String message = jsonResponse['message'];
          String? token = jsonResponse['token'];
          if (status) {

            // print(jsonResponse);

            isLoad.value = false;
            notifyListeners();

            Navigate.navigatorNamed(context, UrlRoutes.verif);
          } else {

            // print(jsonResponse);
            isLoad.value = false;
            notifyListeners();
          }
        } else {
          // print(response.data);

          isLoad.value = false;
          throw Exception('ada yang salah');
        }
      } else {}
    } catch (error) {
      print(error);
    }


  }


}
