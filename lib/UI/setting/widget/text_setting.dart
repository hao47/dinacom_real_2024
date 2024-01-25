import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';

class TextSetting extends StatelessWidget {
  String text = "";
   TextSetting({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return   Text(text,style: CommonAppTheme.textTheme(context).bodyText1!.copyWith(
        color: ColorValue.secondaryColor,
        fontSize: 13,
        fontWeight: FontWeight.w700
    ),);
  }
}
