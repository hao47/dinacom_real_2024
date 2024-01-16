import 'package:dinacom_2024/UI/auth/login/login_page_view.dart';
import 'package:dinacom_2024/UI/auth/login/login_provider.dart';
import 'package:dinacom_2024/UI/auth/register/regist_provider.dart';
import 'package:dinacom_2024/UI/widget/custom_textfield.dart';
import 'package:dinacom_2024/UI/widget/loading_animation.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class RegistPageView extends StatefulWidget {
  @override
  State<RegistPageView> createState() => _RegistPageViewState();
}

class _RegistPageViewState extends State<RegistPageView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _tanggaLahirController = TextEditingController();
  TextEditingController _daerahController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme
        .of(context)
        .textTheme;
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return SafeArea(
      child: Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery
                  .of(context)
                  .viewInsets
                  .bottom),

          child: Form(
            key: _formKey,
            child: Container(
                padding: EdgeInsets.only(top: 40, right: 20, left: 20),
                width: screenWidth,
                height: 650,
                decoration: BoxDecoration(

                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25))
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
                        Text(
                          "Lengkapi profil Anda dan dapatkan akses ke Go-Connect gratis!",
                          style: textTheme.bodyText1!.copyWith(
                              fontSize: 12.5,
                              color: Color(0xff333333)
                          ),


                        ),

                        SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          label: 'Email',
                          controller: _emailController,
                          textInputType: TextInputType.emailAddress,
                          borderRadius: 15,
                          // validator: (value) => Validator.emailValidator(value),
                        ),
                        SizedBox(
                          height: 12.5,
                        ),
                        CustomTextFormField(
                          label: 'Username',
                          controller: _usernameController,
                          textInputType: TextInputType.emailAddress,
                          borderRadius: 15,
                          // validator: (value) => Validator.emailValidator(value),
                        ),

                        SizedBox(
                          height: 12.5,
                        ),
                        CustomTextFormField(
                          label: 'Password',
                          controller: _passwordController,
                          isPassword: true,
                          borderRadius: 15,
                          // validator: (value) =>
                          // Validator.passwordValidator(value),
                        ),
                        SizedBox(
                          height: 12.5,
                        ),
                        CustomTextFormField(
                          label: 'Tanggal Lahir',
                          controller: _tanggaLahirController,
                          textInputType: TextInputType.emailAddress,
                          borderRadius: 15,
                          readOnly: true,
                          onTap: () {
                            _selectDate();
                          },
                          // validator: (value) => Validator.emailValidator(value),
                        ),
                        SizedBox(
                          height: 12.5,
                        ),
                        CustomTextFormField(
                          label: 'Daerah',
                          controller: _daerahController,
                          textInputType: TextInputType.emailAddress,
                          borderRadius: 15,
                          // validator: (value) => Validator.emailValidator(value),
                        ),


                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              Provider.of<RegistProvider>(
                                  context, listen: false).regist(
                                  context, _emailController.text,_usernameController.text,_passwordController.text,_tanggaLahirController.text,"Kudus");

                            }
                          },
                          child: const Text('Daftar'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Sudah punya akun? ",
                            style: textTheme.bodyText1!.copyWith(
                                fontSize: 15,
                                color: Color(0xff666666),
                                fontWeight: FontWeight.normal
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Masuk',
                                style: textTheme.headline1!.copyWith(
                                    fontSize: 15,
                                    color: ColorValue.secondaryColor,

                                    fontWeight: FontWeight.normal
                                ),
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  Navigator.pop(context);
                                  showModalBottomSheet(

                                    isScrollControlled: true,
                                    context: context, builder: (context) {
                                    return LoginPageView();
                                  },);
                                },

                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: Provider
                          .of<LoginProvider>(context, listen: true)
                          .isLoad,
                      builder: (context, value, _) =>
                          Visibility(
                            visible: value,
                            child: const LoadingAnimation(),
                          ),
                    ),
                  ],
                )
            ),
          )
      ),
    );
  }

  _selectDate() async {
    DateTime? _picked = await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if(_picked != null){
      setState(() {
        _tanggaLahirController.text = _picked.toString().split(" ")[0];
      });
    }

  }
}

