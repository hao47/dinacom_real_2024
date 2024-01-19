import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';

class DropdownDitujukan extends StatefulWidget {
  @override
  _DropdownDitujukanState createState() => _DropdownDitujukanState();
}

class _DropdownDitujukanState extends State<DropdownDitujukan> {
  String selectedValue = 'Option 1';

  List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 25, left: 25, top: 15),
          width: MediaQuery.sizeOf(context).width,
          child: DropdownButtonFormField(
            decoration: InputDecoration(
              contentPadding:
              EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(width: 2, color: ColorValue.BaseBlue)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(width: 2, color: ColorValue.BaseBlue)),
            ),
            value: selectedValue,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue!;
              });
            },
            items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: CommonAppTheme.textTheme(context).displayLarge!.copyWith(
                    color: ColorValue.BaseGrey,
                    fontSize: 14,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}