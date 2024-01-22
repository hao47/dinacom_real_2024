import 'package:dinacom_2024/UI/auth/auth_page_controller.dart';
import 'package:dinacom_2024/UI/auth/login/login_page_view.dart';
import 'package:dinacom_2024/UI/auth/register/regist_lengkap.dart';
import 'package:dinacom_2024/UI/widget/custom_textfield.dart';
import 'package:dinacom_2024/UI/widget/loading_animation.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:dinacom_2024/validator/Validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class RegistPageView extends GetView<AuthPageController> {
  @override
  Widget build(BuildContext context) {

    Get.put(AuthPageController());
    final textTheme = Theme.of(context).textTheme;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Form(
        key: controller.formKeyRegist,
        child: Container(
            padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
            width: screenWidth,
            height: 600,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(25))),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Selamat datang kembali!",
                        style: textTheme.headline1!.copyWith(fontSize: 23),
                      ),
                      Text(
                        "Lengkapi profil Anda dan dapatkan akses ke Go-Connect gratis!",
                        style: textTheme.bodyText1!.copyWith(
                            fontSize: 12.5, color: const Color(0xff333333)),
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        label: 'Email',
                        controller: controller.emailControllerRegist,
                        textInputType: TextInputType.emailAddress,
                        borderRadius: 15,
                        validator: (value) =>
                            Validator.emailValidator(value),
                      ),
                      const SizedBox(height: 12.5),
                      CustomTextFormField(
                          label: 'Username',
                          controller: controller.usernameController,
                          textInputType: TextInputType.name,
                          borderRadius: 15,
                          validator: (value) =>
                              Validator.nameValidator(value)),
                      const SizedBox(height: 12.5),
                      CustomTextFormField(
                        label: 'Password',
                        controller: controller.passwordControllerRegist,
                        isPassword: true,
                        borderRadius: 15,
                        validator: (value) =>
                            Validator.passwordValidator(value),
                      ),
                      const SizedBox(height: 12.5),
                      CustomTextFormField(
                        label: 'Confirm Password',
                        controller: controller.confirmPasswordController,
                        isPassword: true,
                        borderRadius: 15,
                        validator: (value) =>
                            Validator.confirmPasswordValidator(value!,controller.passwordControllerRegist.text),
                      ),
                      const SizedBox(height: 12.5),
                      Row(
                        children: [
                          Obx(
                            () => Checkbox(
                              value: controller.isCheckedTerms.value,
                              onChanged: (newBool) {
                                controller.toggleTerms();
                              },
                              activeColor: ColorValue.BaseBlue,
                              isError: controller.checkError.value,
                            ),
                          ),
                          Text(
                            "By registering, you are agreeing with our Terms \nof Use and Privacy Policy",
                            style: CommonAppTheme.textTheme(context)
                                .bodyText1!
                                .copyWith(color: ColorValue.LightGrey),
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      const SizedBox(height: 14),
                      ElevatedButton(
                        onPressed: () async {
                          if (controller.formKeyRegist.currentState!
                              .validate()) {
                            // print(Provider.of<RegistProvider>(
                            //     context, listen: false).emailController.text);
                            // if (controller.confirmPasswordController.text != controller.passwordController.text) {
                            //   return;
                            // }
                            if (!controller.isCheckedTerms.value) {
                              controller.errorTerms();
                              return;
                            }
                            //
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return RegistLengkap();
                              },
                            ));

                            // Provider.of<RegistProvider>(
                            //     context, listen: false).regist(
                            //     context, controller.formKeyRegistntroller.text,controller.formKeyRegisteController.text,controller.formKeyRegistdController.text,_tanggaLahirController.text,"Kudus");
                          }
                        },
                        child: const Text('Next'),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Sudah punya akun? ",
                          style: textTheme.bodyText1!.copyWith(
                              fontSize: 15,
                              color: const Color(0xff666666),
                              fontWeight: FontWeight.normal),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Masuk',
                              style: textTheme.headline1!.copyWith(
                                  fontSize: 15,
                                  color: ColorValue.secondaryColor,
                                  fontWeight: FontWeight.normal),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pop(context);
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return LoginPageView();
                                    },
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
