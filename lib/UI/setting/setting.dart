import 'dart:io';

import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile_provider.dart';
import 'package:dinacom_2024/UI/masyarakat_profile/widget/profile_biodata.dart';

// import 'package:dinacom_2024/UI/masyarakat_profile/profile_post.dart';
import 'package:dinacom_2024/UI/setting/setting_controller.dart';
import 'package:dinacom_2024/UI/setting/widget/text_setting.dart';
import 'package:dinacom_2024/UI/widget/custom_textfield.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:dinacom_2024/validator/Validator.dart';
import 'package:csc_picker/csc_picker.dart';

class Setting extends GetView<SettingController> {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 75,
          backgroundColor: ColorValue.secondaryColor,
          leading: IconButton(
            onPressed:
            () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          title: Text(
            "Setelan",
            style: textTheme.headline1!
                .copyWith(fontSize: 19, height: 1.5, color: Colors.white),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Simpan",
                  style: CommonAppTheme.textTheme(context)
                      .headline1!
                      .copyWith(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(

                  margin: const EdgeInsets.symmetric(vertical: 25),
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Obx(() =>
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                  width: 110,
                                  height: 110,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 2,
                                            blurRadius: 10,
                                            color: Colors.black.withOpacity(0.1),
                                            offset: const Offset(0, 10))
                                      ],
                                      shape: BoxShape.circle,
                                      image:  controller.pickedFile.value != null? DecorationImage(
                                        fit: BoxFit.cover,
                                        image: FileImage(File(controller.pickedFile.value!.path)),

                                      ):
                                      DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(



                                                    Get.put(ProfileController()).profileModel.value.responseProfile!.photoProfile


                                          ))

                                  )
                              ),
                              Positioned(
                                  top: 0,
                                  right: 0,
                                  child: InkWell(
                                    onTap: () {
                                      checkPermissions();
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorValue.BaseGrey.withOpacity(0.8),
                                      ),
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  )),
                            ],
                          ),)
                    ],
                  ),
                ),
          
                TextSetting(text: "Username"),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  label: "username",
                  controller: controller.usernameController,
                  borderRadius: 20,
          
          
                ),
                SizedBox(
                  height: 15,
                ),
                TextSetting(text: "Tanggal Lahir"),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    label: 'Tanggal Lahir',
                    controller: controller.tanggaLahirController,
                    textInputType: TextInputType.emailAddress,
                    borderRadius: 20,
                    readOnly: true,
                    onTap: () {
                      controller.selectDate(context);
                    },
                    validator: (value) => Validator.dateValidator(value)),
          
                SizedBox(
                  height: 15,
                ),
                TextSetting(text: "Daerah"),
                SizedBox(
                  height: 10,
                ),
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
                    // controller.countryValue!.value = value ?? "";
                  },
                  onStateChanged: (value) {
                    // controller.stateValue!.value = value ?? "";
                  },
                  onCityChanged: (value) {
                    // controller.cityValue!.value = value ?? "";
                  },
                ),
          
          
          
          
          
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {
              controller.logout();
            },
            child: Text('Keluar'),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  ColorValue.BaseRed, // Change the background color here
            ),
          ),
        ),
      ),
    );
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

    controller.pickedImage();
  }
}
