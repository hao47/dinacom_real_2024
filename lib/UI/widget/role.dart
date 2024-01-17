import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';

class Role extends StatelessWidget {
  const Role({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorValue.secondaryColor),
      child: Text(
        "Instansi",
        style: CommonAppTheme.textTheme(context)
            .bodyText1!
            .copyWith(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 10),
      ),
    );
  }
}
