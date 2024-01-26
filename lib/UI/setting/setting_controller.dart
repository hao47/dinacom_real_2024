import 'dart:convert';
import 'dart:math';

import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile_provider.dart';
import 'package:dinacom_2024/constants/url_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SettingController extends GetxController {
  String generateRandomString(int length) {
    final random = Random();
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    return List.generate(length, (index) => chars[random.nextInt(chars.length)])
        .join();
  }

  final ValueNotifier<bool> isLoad = ValueNotifier<bool>(false);
  TextEditingController usernameController = TextEditingController(
      text: Get.put(ProfileController())
          .profileModel
          .value
          .responseProfile!
          .username);
  TextEditingController tanggaLahirController = TextEditingController(
      text: Get.put(ProfileController())
          .profileModel
          .value
          .responseProfile!
          .tanggalLahir
          .year
          .toString() +
          "-" +
          Get.put(ProfileController())
              .profileModel
              .value
              .responseProfile!
              .tanggalLahir
              .month
              .toString() +
          "-" +
          Get.put(ProfileController())
              .profileModel
              .value
              .responseProfile!
              .tanggalLahir
              .day
              .toString());
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  String daerah = "Bae";

  Rx<XFile?> pickedFile = Rx<XFile?>(null);

  void pickedImage() async {
    final picker = ImagePicker();
    XFile? newPickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (newPickedFile != null) {
      pickedFile.value = newPickedFile;
      update(); // Perbarui widget yang menggunakan pickedFile
    }
  }

  void onChangeSetting(String username, String tanggalLahir, String daerah,
      XFile? pickedfile) async {
    // print("INI USERNAME : $username");
    // print("INI TANGGAL LAHIR : $tanggalLahir");
    // print("INI DAERAH : $daerah");

    String randomString = generateRandomString(10);
    try {

      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('token');
      isLoad.value = true;

      var request = http.MultipartRequest(
        'PUT',
        Uri.parse(
            'https://urchin-app-hlgon.ondigitalocean.app/api/secured/profile'),
      );

      request.headers['Content-Type'] = 'multipart/form-data';
      request.headers['Authorization'] = token!;


      if (pickedfile != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'userFile',
          pickedfile.path,
          filename: randomString + ".jpg",
        ));
      }
      request.fields['username'] = username ?? "";
      request.fields['tanggal_lahir'] = tanggalLahir ?? "";
      request.fields['daerah'] = daerah ?? "";

      final response = await request.send();

      String responseBody = await response.stream.bytesToString();
      print("Response Body: $responseBody");

      print(responseBody);
      if (response.statusCode == 200) {
        isLoad.value = true;

        Map<String, dynamic> jsonResponse = json.decode(responseBody);
        bool status = jsonResponse['status'];
        String message = jsonResponse['message'];
        String? token = jsonResponse['token'];
        if (message == "berhasil") {
          // print(jsonResponse);


          isLoad.value = false;

          Get.put(ProfileController());
          Get.back();

          // Get.toNamed(UrlRoutes.verif);
        } else {
          // print(jsonResponse);
          isLoad.value = false;
        }
      } else {
        // print(response.data);

        isLoad.value = false;
        throw Exception('ada yang salah');
      }
      // } else {
      //
      //   isLoad.value = false;
      // }
    } catch (error) {
      print(error);
    }
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    prefs.remove("token");
    Get.offAllNamed(UrlRoutes.auth_page);
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
      tanggaLahirController.text = _picked.toString().split(" ")[0];
      update();
    }
    }
}