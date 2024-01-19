import 'dart:io';

import 'package:csc_picker/csc_picker.dart';
import 'package:dinacom_2024/UI/auth/register/regist_provider.dart';
import 'package:dinacom_2024/UI/widget/custom_textfield.dart';
import 'package:dinacom_2024/UI/widget/loading_animation.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:dinacom_2024/validator/Validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class RegistLengkap extends StatefulWidget {
  const RegistLengkap({super.key});

  @override
  State<RegistLengkap> createState() => _RegistLengkapState();
}

class _RegistLengkapState extends State<RegistLengkap> {
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";

  var a= [];
@override
  void initState() {
  a = [
    '2024',
    '2023',
    '2022',
    '2021',
    '2020',
    '2019',
    '2018',
    '2017',
    '2016',
    '2015',
    '2014',
    '2013',
    '2012',
    '2011',
    '2010',
    '2009',
    '2008'
  ];
  super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  XFile? pickedFile;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Lengkapi profil anda!",
                      style: CommonAppTheme.textTheme(context)
                          .headline1!
                          .copyWith(fontSize: 25),
                    ),
                    Text(
                      "Mari lengkapi profil anda terlebih dahulu!",
                      style: CommonAppTheme.textTheme(context)
                          .bodyText1!
                          .copyWith(fontSize: 12, color: ColorValue.LightGrey),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          
                          height: 115,
                          width: 115,
                          margin: const EdgeInsets.symmetric(vertical: 75),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,

                              image: pickedFile != null?
                              FileImage(File(pickedFile!.path))
                                  : FileImage(File('assets/images/logo.png'))
                            ),
                          ),

                        ),
                        InkWell(
                          onTap: () {

                            checkPermissions();
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            margin: const EdgeInsets.only(top: 80, left: 70),
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(100)),
                            child: Icon(CupertinoIcons.pencil,color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    CustomTextFormField(
                      label: 'Bio',
                      controller:
                          Provider.of<RegistProvider>(context, listen: false)
                              .bioController,
                      textInputType: TextInputType.text,
                      borderRadius: 15,
                      // validator: (value) => Validator.nameValidator(value),
                    ),
                    const SizedBox(height: 12.5),
                    CustomTextFormField(
                        label: 'Tanggal Lahir',
                        controller:
                            Provider.of<RegistProvider>(context, listen: false)
                                .tanggaLahirController,
                        textInputType: TextInputType.emailAddress,
                        borderRadius: 15,
                        readOnly: true,
                        onTap: () {
                          _selectDate();
                        },
                        validator: (value) => Validator.dateValidator(value)),
                    const SizedBox(height: 12.5),
                    CSCPicker(
                      showStates: true,
                      showCities: true,
                      flagState: CountryFlag.DISABLE,
                      dropdownDecoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          color: Colors.white,
                          border: Border.all(
                            width: 1.5,
                            color: const Color(0xff666666),
                          )),
                      disabledDropdownDecoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: Colors.grey.shade300,
                          border: Border.all(
                              color: Colors.grey.shade300, width: 1)),
                      countrySearchPlaceholder: "Country",
                      stateSearchPlaceholder: "State",
                      citySearchPlaceholder: "City",
                      countryDropdownLabel: "Country",
                      stateDropdownLabel: "State",
                      cityDropdownLabel: "City",
                      countryFilter: const [CscCountry.Indonesia],
                      selectedItemStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      dropdownHeadingStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                      dropdownItemStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      dropdownDialogRadius: 10.0,
                      searchBarRadius: 10.0,
                      onCountryChanged: (value) {
                        setState(() {
                          countryValue = value;
                        });
                      },
                      onStateChanged: (value) {
                        setState(() {
                          stateValue = value ?? "";
                        });
                      },
                      onCityChanged: (value) {
                        setState(() {
                          cityValue = value ?? "";
                        });
                      },
                    ),
                    const SizedBox(height: 60),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {


                          String pw = Provider.of<RegistProvider>(context, listen: false).confirmPasswordController.text;

                          address = "$cityValue, $stateValue, $countryValue";

                          String tanggal =  Provider.of<RegistProvider>(context, listen: false)
                              .tanggaLahirController.text;

                          bool aa = false;

                          for(var data in a){
                            if(tanggal.contains(data)){
                              aa= true;
                            }
                          }

                          if(aa){

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Anda belum berumur 17 tahun ke atas'),
                              ),
                            );
                          }else {
                            Provider.of<RegistProvider>(context, listen: false)
                                .regist(context, address,pickedFile,pw);


                          }


                        }
                      },
                      child: const Text('Next'),
                    ),
                  ],
                ),
                ValueListenableBuilder<bool>(
                  valueListenable:
                      Provider.of<RegistProvider>(context, listen: true).isLoad,
                  builder: (context, value, _) => Visibility(
                    visible: value,
                    child: const LoadingAnimation(),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.white, // <-- SEE HERE
                onPrimary: Colors.black, // <-- SEE HERE
                onSurface: Colors.blueAccent, // <-- SEE HERE
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Colors.red, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (_picked != null) {
      setState(() {
        Provider.of<RegistProvider>(context, listen: false)
            .tanggaLahirController
            .text = _picked.toString().split(" ")[0];
      });
    }
  }

  checkPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.storage,
    ].request();

    if (statuses[Permission.camera] != PermissionStatus.granted &&
        statuses[Permission.storage] != PermissionStatus.granted) {
      return;
    }

    pickedImage();
  }

  pickedImage() async {
    final picker = ImagePicker();
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }
}
