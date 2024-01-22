import 'dart:async';

import 'package:dinacom_2024/UI/auth/verif/verif_controller.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


class VerifPage extends GetView<VerifControlller> {
  const VerifPage({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(VerifControlller());

    final textTheme = Theme.of(context).textTheme;
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Image.asset("assets/images/big-logo.png"),
            Text("Check your email  ",
              style: textTheme.headline1!.copyWith(
                  fontSize: 23
              ),
            ),

SizedBox(height: 30),
        Text("To verify your email address, tap the \n button in the email we sent you.",
          style: textTheme.bodyText1!.copyWith(
              fontSize: 12.5,
              color: Color(0xff333333),

          ),
          textAlign: TextAlign.center,
        ),

            SizedBox(height: 20),

            Text("Resend ",
              style: textTheme.headline1!.copyWith(
                fontSize: 14.5,
                color: ColorValue.secondaryColor,

              ),
              textAlign: TextAlign.center,
            )



          ],
        ),
      ),
    );
  }
}
