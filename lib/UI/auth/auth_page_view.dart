import 'dart:ui';

import 'package:dinacom_2024/UI/auth/widget/auth_banner.dart';
import 'package:dinacom_2024/UI/auth/widget/auth_button.dart';
import 'package:dinacom_2024/UI/auth/widget/chat_content.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../common/theme/color_value.dart';
import '../widget/custom_textfield.dart';
import '../widget/loading_animation.dart';

class AuthPageView extends StatelessWidget {
  const AuthPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
              children: [
                AuthBanner(),
                ChatContent(),
                SizedBox(height: 60,),

              ]),
        )
    ,bottomNavigationBar:  AuthButton(),
    );
  }
}
