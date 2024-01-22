import 'package:dinacom_2024/UI/masyarakat_profile/profile_masyarakat_controller.dart';
import 'package:dinacom_2024/UI/splash_screen/splash_screen_controller.dart';
import 'package:get/get.dart';

class AuthPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileMasyarakatController>(
          () => ProfileMasyarakatController(),
    );
  }
}