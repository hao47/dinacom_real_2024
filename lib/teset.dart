import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

import 'UI/widget/custom_textfield.dart';


class CountryPicker extends StatefulWidget {
  const CountryPicker({super.key});

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  String countryValue = "";

  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New App"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CSCPicker(
              flagState: CountryFlag.ENABLE,
              disabledDropdownDecoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
              ),
              dropdownDecoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
              ),
              dropdownHeadingStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              showCities: true,
              showStates: true,

              searchBarRadius: 50,
              defaultCountry: CscCountry.Pakistan,
              countryDropdownLabel: countryValue,
              onCountryChanged: (value) {
                setState(() {
                  countryValue = value;
                });
              },
            ),
            CustomTextFormField(
              label: 'Masukkan kata sandi',
              controller: _passwordController,
              isPassword: true,
              borderRadius: 15,
              // validator: (value) =>
              //     Validator.passwordValidator(value),
            ),
          ],
        ),
      )
    );
  }
}