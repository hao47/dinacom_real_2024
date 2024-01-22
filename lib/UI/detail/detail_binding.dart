import 'package:dinacom_2024/UI/bottom_navigation/item/poran/poran_provider.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/poran/poran_provider.dart';
import 'package:dinacom_2024/UI/detail/detail_controller.dart';
import 'package:dinacom_2024/UI/detail/detail_controller.dart';
import 'package:dinacom_2024/UI/splash_screen/splash_screen_controller.dart';
import 'package:get/get.dart';

class DetailPoranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(
          () => DetailController(),
    );
  }
}