// import 'package:dinacom_2024/UI/auth/auth_page_controller.dart';
import 'package:dinacom_2024/UI/auth/login/login_page_view.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../validator/Validator.dart';
import '../../widget/custom_textfield.dart';
import '../../widget/loading_animation.dart';
import '../register/regist_page_view.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key});

  @override
  Widget build(BuildContext context) {

    // Get.put(AuthPageController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Stack(
        children: [
          Wrap(
            runSpacing: 9,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.bottomSheet(

                      isScrollControlled: true,
                      RegistPageView(),
                      backgroundColor: Colors.white,
                      elevation: 0,
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                    );
                  },
                  child: const Text("Daftar")),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.black,
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(color: Colors.black, width: 1)),
                    textStyle: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 17.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {
                    // showModalBottomSheet(
                    //
                    //   useSafeArea: true,
                    //   isScrollControlled: true,
                    //   context: context,
                    //   builder: (context) => LoginPageView(),
                    // );

                    Get.bottomSheet(

                      isScrollControlled: true,
                      // ignoreSafeArea: false,
                      LoginPageView(),
                      backgroundColor: Colors.white,
                      elevation: 0,
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                    );
                  },
                  child: const Text("Masuk"))
            ],
          ),
        ],
      ),
    );
  }
}
