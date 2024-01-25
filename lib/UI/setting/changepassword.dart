
import 'package:dinacom_2024/UI/setting/setting_controller.dart';
import 'package:dinacom_2024/UI/widget/custom_textfield.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:dinacom_2024/validator/Validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ChangePassword extends GetView<SettingController> {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Ganti Password",
          style: textTheme.headline1!.copyWith(fontSize: 20, height: 1.5),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Ganti Sandi',
              style: textTheme.headline1!.copyWith(
                  fontSize: 28, height: 1.5, color: ColorValue.BaseBlack),
            ),
            SizedBox(
              width: 250,
              child: Text(
                'Tolong masukan sandi lama anda, kemudian masukan sandi baru  yang anda inginkan',
                style: textTheme.bodyText1!.copyWith(
                    fontSize: 12, height: 1.5, color: ColorValue.BaseGrey, fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              label: 'Password',
              controller: controller.passwordController,
              borderRadius: 15,
              validator: (value) => Validator.passwordValidator(value),
            ),
            const SizedBox(height: 12.5),
            CustomTextFormField(
              label: 'Confirm Password',
              controller: controller.confirmpasswordController,
              borderRadius: 15,
              validator: (value) => Validator.passwordValidator(value),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Text('Ganti Sandi'),
            ),
          ],
        ),
      ),
    );
  }
}