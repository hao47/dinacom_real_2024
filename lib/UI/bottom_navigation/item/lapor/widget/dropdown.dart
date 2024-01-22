import 'package:dinacom_2024/UI/bottom_navigation/item/poran/poran_provider.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropdownDitujukan extends StatefulWidget {
  @override
  _DropdownDitujukanState createState() => _DropdownDitujukanState();
}

class _DropdownDitujukanState extends State<DropdownDitujukan> {
  String selectedValue = '';


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: const EdgeInsets.only(top: 15,left: 20,right: 20),
            // width: MediaQuery.sizeOf(context).width,
            child: DropdownSearch<String>(
              items: ["Instasi Kudus", "Instasi Jeparan", "Instasi Bali", 'Instasi Surabayan'],
              popupProps: PopupProps.dialog(
                showSelectedItems: true,
                containerBuilder: (context, popupWidget) {
                  return Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: popupWidget
                  );
                },
              ),
              dropdownDecoratorProps: DropDownDecoratorProps(
                baseStyle: CommonAppTheme.textTheme(context)
                    .bodyText1!
                    .copyWith(
                    color: ColorValue.BaseBlack,
                    fontSize: 12,
                    fontWeight: FontWeight.w900),
                dropdownSearchDecoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                      BorderSide(width: 2, color: ColorValue.BaseBlue)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                      BorderSide(width: 2, color: ColorValue.BaseBlue)),
                ),
              ),
              onChanged: (value) {
                // Provider.of<PoranProvider>(context,listen: false).setinstasi(value!);
              },
              selectedItem: "Instasi Kudus",
            )
        ),
      ],
    );
  }
}