import 'package:dinacom_2024/UI/auth/auth_page_controller.dart';
import 'package:dinacom_2024/UI/masyarakat_profile/widget/profile_biodata.dart';
// import 'package:dinacom_2024/UI/masyarakat_profile/profile_post.dart';
import 'package:dinacom_2024/UI/setting/setting_controller.dart';
import 'package:dinacom_2024/UI/widget/custom_textfield.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:dinacom_2024/validator/Validator.dart';
import 'package:csc_picker/csc_picker.dart';

class Setting extends GetView<SettingController> {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    String countryValue = "";
    String stateValue = "";
    String cityValue = "";
    String address = "";

    final textTheme = Theme.of(context).textTheme;
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 75,
          leading: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          title: Text(
            "Setelan",
            style: textTheme.headline1!.copyWith(fontSize: 20, height: 1.5),
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
                      .copyWith(color: ColorValue.secondaryColor, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
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
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                            ))),
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () {},
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
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    textAlign: TextAlign.start,
                    style:
                    CommonAppTheme.textTheme(context).bodyText1!.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                      color: ColorValue.BaseBlue,
                    ),
                  ),
                  SizedBox(height: 2),
                  TextFormField(
                    controller:controller.usernameController,
                    cursorColor: ColorValue.BaseBlue,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 1.5,
                          color: Color(0xff666666),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 1.5,
                          color: Color(0xff666666),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 2,
                          color: ColorValue.secondaryColor,
                        ),
                      ),
                    ),
                    validator: (value) => Validator.dateValidator(value),
                  )
                ],
              ),
              const SizedBox(height: 12.5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tanggal Lahir',
                    textAlign: TextAlign.start,
                    style:
                    CommonAppTheme.textTheme(context).bodyText1!.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                      color: ColorValue.BaseBlue,
                    ),
                  ),
                  SizedBox(height: 2),
                  CustomTextFormField(
                      label: 'Tanggal Lahir',
                      controller:
                      controller
                          .tanggaLahirController,
                      textInputType: TextInputType.emailAddress,
                      borderRadius: 15,
                      readOnly: true,
                      onTap: () {
                        controller.selectDate(context);
                      },

                      validator: (value) => Validator.dateValidator(value)),

                ],
              ),
              const SizedBox(height: 12.5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Daerah',
                    textAlign: TextAlign.start,
                    style:
                    CommonAppTheme.textTheme(context).bodyText1!.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                      color: ColorValue.BaseBlue,
                    ),
                  ),
                  SizedBox(height: 2),
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
                      controller.countryValue!.value = value ?? "";
                    },
                    onStateChanged: (value) {
                      controller.stateValue!.value = value ?? "";
                    },
                    onCityChanged: (value) {
                      controller.cityValue!.value = value ?? "";
                    },
                  ),
                ],
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/change');
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Ganti Sandi'),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ],
                  )),
              const Spacer(),
              Container(
                margin: EdgeInsets.only(bottom: 20),
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
              )
            ],
          ),
        ),
      ),
    );
  }


}