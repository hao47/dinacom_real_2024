
import 'package:dinacom_2024/constants/url_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingController  extends GetxController{
  TextEditingController usernameController = TextEditingController(text: 'Initial Value');
  TextEditingController tanggaLahirController = TextEditingController(text: 'Initial Value');
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxString? countryValue = "".obs;

  RxString? stateValue = "".obs;

  RxString? cityValue = "".obs;


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


  logout() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();


    prefs.setString("token", "");
    Get.toNamed(UrlRoutes.auth_page);

    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return AuthPA
    // },));

  }

}