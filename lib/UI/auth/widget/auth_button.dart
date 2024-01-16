import 'package:dinacom_2024/UI/auth/login/login_page_view.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../validator/Validator.dart';
import '../../widget/custom_textfield.dart';
import '../../widget/loading_animation.dart';
import '../login/login_provider.dart';
import '../register/regist_page_view.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Stack(
        children: [
          Wrap(
            runSpacing: 9,
            children: [
              // RegistPageView(),
              // LoginPageView(),

              ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return RegistPageView();
                      },
                    );
                  },
                  child: Text("Daftar")),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.black,
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(color: Colors.black, width: 1)),
                    textStyle: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 17.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return LoginPageView();
                      },
                    );
                  },
                  child: Text("Masuk"))
            ],
          ),
        ],
      ),
    );
  }
}
