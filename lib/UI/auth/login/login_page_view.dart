import 'package:dinacom_2024/UI/auth/login/login_controller.dart';
import 'package:dinacom_2024/UI/auth/register/regist_page_view.dart';
import 'package:dinacom_2024/UI/widget/custom_textfield.dart';
import 'package:dinacom_2024/UI/widget/loading_animation.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:dinacom_2024/validator/Validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageView extends GetView<LoginPageController> {

  final formKeyLogin = GlobalKey<FormState>();
  // final controller = Get.put( LoginPageController());

  @override
  Widget build(BuildContext context) {
    Get.put( LoginPageController());
    final textTheme = Theme.of(context).textTheme;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Form(
        key: formKeyLogin,
        child: Container(
            padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
            width: screenWidth,
            height: 450,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(25))),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Selamat datang kembali!",
                      style: textTheme.headline1!.copyWith(fontSize: 23),
                    ),
                    Text(
                      "kami sangat senang bisa bertemu Anda lagi!",
                      style: textTheme.bodyText1!.copyWith(
                          fontSize: 12.5, color: const Color(0xff333333)),
                    ),
                    const SizedBox(height: 40),
                    CustomTextFormField(
                      label: 'Email',
                      controller: controller.emailController,
                      textInputType: TextInputType.emailAddress,
                      borderRadius: 15,
                      validator: (value) => Validator.emailValidator(value),
                    ),
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      label: 'Masukkan kata sandi',
                      controller: controller.passwordController,
                      isPassword: true,
                      borderRadius: 15,
                      // validator: (value) =>
                      //     Validator.passwordValidator(value),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Lupa password?",
                      style: textTheme.bodyText2!.copyWith(
                          color: ColorValue.secondaryColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.end,
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () async {
                        if (formKeyLogin.currentState!.validate()) {

                          controller.login(controller.emailController.text, controller.passwordController.text);
                        }
                      },
                      child: const Text('Masuk'),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Belum punya akun? ",
                        style: textTheme.bodyText1!.copyWith(
                            fontSize: 15,
                            color: const Color(0xff666666),
                            fontWeight: FontWeight.normal),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Daftar',
                            style: textTheme.headline1!.copyWith(
                                fontSize: 15,
                                color: ColorValue.secondaryColor,
                                fontWeight: FontWeight.normal),
                            //
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pop(context);
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return RegistPageView();
                                  },
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: controller.isLoad,
                  builder: (context, value, _) => Visibility(
                    visible: value,
                    child: const LoadingAnimation(),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
