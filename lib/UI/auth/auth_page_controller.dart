import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:dinacom_2024/constants/url_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthPageController extends GetxController {

  final formKeyRegist = GlobalKey<FormState>();
  final formKeyLogin = GlobalKey<FormState>();
  final ValueNotifier<bool> isLoad = ValueNotifier<bool>(false);
  TextEditingController emailControllerLogin = TextEditingController();
  TextEditingController passwordControllerLogin = TextEditingController();
  TextEditingController emailControllerRegist = TextEditingController();
  TextEditingController passwordControllerRegist = TextEditingController();


  TextEditingController usernameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController tanggaLahirController = TextEditingController();
  TextEditingController daerahController = TextEditingController();
  TextEditingController bioController = TextEditingController();

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

  @override
  dispose(){
    emailControllerLogin.dispose();
    passwordControllerLogin.dispose();
    emailControllerLogin.clear();
    passwordControllerLogin.clear();
    super.dispose();
  }

  selectDate(BuildContext context) async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.white, // <-- SEE HERE
                onPrimary: Colors.black, // <-- SEE HERE
                onSurface: Colors.blueAccent, // <-- SEE HERE
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Colors.red, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (_picked != null) {
     tanggaLahirController
          .text = _picked.toString().split(" ")[0];
     update();
    }
  }
  Rx<XFile?> pickedFile = Rx<XFile?>(null);

  void pickedImage() async {
    final picker = ImagePicker();
    XFile? newPickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (newPickedFile != null) {
      pickedFile.value = newPickedFile;
      update(); // Perbarui widget yang menggunakan pickedFile
    }
  }

  regist(BuildContext context,String daerah,XFile? pickedfile,String pw) async {
    String randomString = generateRandomString(10);
    try {

      isLoad.value = true;

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

        request.fields['email'] = emailControllerRegist.text ?? "";
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

          Map<String, dynamic> jsonResponse = json.decode(responseBody);
          bool status = jsonResponse['status'];
          String message = jsonResponse['message'];
          String? token = jsonResponse['token'];
          if (status) {

            // print(jsonResponse);

            isLoad.value = false;


            Get.toNamed(UrlRoutes.verif);
          } else {

            // print(jsonResponse);
            isLoad.value = false;

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





  login(String username, String password) async {


    print(username);
    print(password);

    isLoad.value = true;
    final response =
        await http.post(Uri.parse("http://10.0.2.2:8080/api/login"),
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

        Get.offAllNamed("/menu");
        isLoad.value = false;
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
