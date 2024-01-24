import 'package:dinacom_2024/UI/auth/login/login_controller.dart';
import 'package:dinacom_2024/UI/auth/login/login_controller.dart';
import 'package:dinacom_2024/UI/auth/login/login_controller.dart';
import 'package:dinacom_2024/UI/auth/register/regist_controller.dart';
import 'package:dinacom_2024/UI/splash_screen/splash_screen_controller.dart';
import 'package:get/get.dart';

class RegistPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistPageController>(
          () => RegistPageController(),
    );
  }
}