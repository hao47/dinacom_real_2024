import 'dart:async';

import 'package:dinacom_2024/UI/auth/verif/verifprovider.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class VerifPage extends StatefulWidget {
  const VerifPage({super.key});

  @override
  State<VerifPage> createState() => _VerifPageState();
}

class _VerifPageState extends State<VerifPage> {


  final ValueNotifier<bool> _isEmailVerified = ValueNotifier<bool>(false);
  Timer? timer;



  Future _checkEmailVerified() async {

    Provider.of<VerifProvider>(context, listen: false).verif(context, "daffarobani551@gmail.com");

    var check = await Provider.of<VerifProvider>(context, listen: false).verif(context, "daffarobani551@gmail.com");

    _isEmailVerified.value = check;

    if (_isEmailVerified.value) {
      timer?.cancel();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (!_isEmailVerified.value) {

      timer = Timer.periodic(
        const Duration(seconds: 3),
            (_) => _checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

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
