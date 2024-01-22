import 'package:dinacom_2024/UI/auth/verif/verif_controller.dart';
import 'package:dinacom_2024/UI/splash_screen/splash_screen_controller.dart';
import 'package:get/get.dart';

class VerifBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifControlller>(
          () => VerifControlller(),
    );
  }
}