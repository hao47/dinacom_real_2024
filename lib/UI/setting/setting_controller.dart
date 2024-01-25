
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile_provider.dart';
import 'package:dinacom_2024/constants/url_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingController  extends GetxController{


  TextEditingController usernameController = TextEditingController(text: Get.put(ProfileController()).profileModel.value.responseProfile!.username);
  TextEditingController tanggaLahirController = TextEditingController(text: Get.put(ProfileController()).profileModel.value.responseProfile!.tanggalLahir.year.toString() +"-"+  Get.put(ProfileController()).profileModel.value.responseProfile!.tanggalLahir.month.toString() +"-"+ Get.put(ProfileController()).profileModel.value.responseProfile!.tanggalLahir.day.toString());
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();


  Rx<XFile?> pickedFile = Rx<XFile?>(null);

  void pickedImage() async {
    final picker = ImagePicker();
    XFile? newPickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (newPickedFile != null) {
      pickedFile.value = newPickedFile;
      update(); // Perbarui widget yang menggunakan pickedFile
    }
  }

  logout() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", "");
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
      tanggaLahirController
          .text = _picked.toString().split(" ")[0];
      update();
    }
  }


}