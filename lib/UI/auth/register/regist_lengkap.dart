import 'package:csc_picker/csc_picker.dart';
import 'package:dinacom_2024/UI/auth/register/regist_provider.dart';
import 'package:dinacom_2024/UI/widget/custom_textfield.dart';
import 'package:dinacom_2024/UI/widget/loading_animation.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:dinacom_2024/validator/Validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  final _formKey = GlobalKey<FormState>();

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
                    Container(
                      height: 115,
                      width: 115,
                      margin: const EdgeInsets.symmetric(vertical: 75),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(100)),
                      child: const Icon(Icons.camera_alt,
                          color: ColorValue.VeryLightGrey, size: 35),
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
                      ///Enable disable state dropdown [OPTIONAL PARAMETER]
                      showStates: true,

                      /// Enable disable city drop down [OPTIONAL PARAMETER]
                      showCities: true,

                      ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                      flagState: CountryFlag.DISABLE,

                      ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                      dropdownDecoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          color: Colors.white,
                          border: Border.all(
                            width: 1.5,
                            color: const Color(0xff666666),
                          )),

                      ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                      disabledDropdownDecoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          color: Colors.grey.shade300,
                          border: Border.all(
                              color: Colors.grey.shade300, width: 1)),

                      ///placeholders for dropdown search field
                      countrySearchPlaceholder: "Country",
                      stateSearchPlaceholder: "State",
                      citySearchPlaceholder: "City",

                      ///labels for dropdown
                      countryDropdownLabel: "Country",
                      stateDropdownLabel: "State",
                      cityDropdownLabel: "City",

                      ///Default Country
                      ///defaultCountry: CscCountry.India,

                      ///Country Filter [OPTIONAL PARAMETER]
                      countryFilter: const [CscCountry.Indonesia],

                      ///Disable country dropdown (Note: use it with default country)
                      //disableCountry: true,

                      ///selected item style [OPTIONAL PARAMETER]
                      selectedItemStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),

                      ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                      dropdownHeadingStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),

                      ///DropdownDialog Item style [OPTIONAL PARAMETER]
                      dropdownItemStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),

                      ///Dialog box radius [OPTIONAL PARAMETER]
                      dropdownDialogRadius: 10.0,

                      ///Search bar radius [OPTIONAL PARAMETER]
                      searchBarRadius: 10.0,

                      ///triggers once country selected in dropdown
                      onCountryChanged: (value) {
                        setState(() {
                          ///store value in country variable
                          countryValue = value;
                        });
                      },

                      ///triggers once state selected in dropdown
                      onStateChanged: (value) {
                        setState(() {
                          ///store value in state variable
                          stateValue = value ?? "";
                        });
                      },

                      ///triggers once city selected in dropdown
                      onCityChanged: (value) {
                        setState(() {
                          ///store value in city variable
                          cityValue = value ?? "";
                        });
                      },

                      ///Show only specific countries using country filter
                      // countryFilter: ["United States", "Canada", "Mexico"],
                    ),
                    const SizedBox(height: 60),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          address = "$cityValue, $stateValue, $countryValue";

                          Provider.of<RegistProvider>(context, listen: false)
                              .regist(context, address);
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
}
