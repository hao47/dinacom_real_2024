import 'package:dinacom_2024/UI/auth/login/login_provider.dart';
import 'package:dinacom_2024/UI/auth/register/regist_page_view.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../validator/Validator.dart';
import '../../widget/custom_textfield.dart';
import '../../widget/loading_animation.dart';

class LoginPageView extends StatefulWidget {
  LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),

        child: Form(
          key: _formKey,
          child: Container(
              padding: EdgeInsets.only(top: 40,right: 20,left: 20),
              width: screenWidth,
              height: 450,
              decoration: BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25))
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Selamat datang kembali!",
                        style: textTheme.headline1!.copyWith(
                            fontSize: 23
                        ),
                      ),
                      Text("kami sangat senang bisa bertemu Anda lagi!",
                        style: textTheme.bodyText1!.copyWith(
                            fontSize: 12.5,
                            color: Color(0xff333333)
                        ),


                      ),

                      SizedBox(
                        height: 40,
                      ),
                      CustomTextFormField(
                        label: 'Email',
                        controller: _emailController,
                        textInputType: TextInputType.emailAddress,
                          borderRadius: 15,
                        validator: (value) => Validator.emailValidator(value),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        label: 'Masukkan kata sandi',
                        controller: _passwordController,
                        isPassword: true,
                          borderRadius: 15,
                        validator: (value) =>
                        Validator.passwordValidator(value),
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      Text("Lupa password?",style: textTheme.bodyText2!.copyWith(
                          color: ColorValue.secondaryColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w500
                      ),
                        textAlign: TextAlign.end,

                      ),

                      SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            Provider.of<LoginProvider>(context, listen: false).login(context,_emailController.text, _passwordController.text);
                          }

                        },
                        child: const Text('Masuk'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Belum punya akun? ",
                          style: textTheme.bodyText1!.copyWith(
                              fontSize: 15,
                              color: Color(0xff666666),
                              fontWeight: FontWeight.normal
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Daftar',
                              style: textTheme.headline1!.copyWith(
                                  fontSize: 15,
                                  color: ColorValue.secondaryColor,

                                  fontWeight: FontWeight.normal
                              ),
                              //
                              recognizer: TapGestureRecognizer()..onTap = () {
                                Navigator.pop(context);
                                showModalBottomSheet(

                                  isScrollControlled: true,
                                  context: context, builder: (context) {
                                  return RegistPageView();
                                },);
                              },



                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable:  Provider.of<LoginProvider>(context, listen: true).isLoad,
                    builder: (context, value, _) => Visibility(
                      visible: value,
                      child: const LoadingAnimation(),
                    ),
                  ),
                ],
              )
          ),
        )
    );
  }
}
