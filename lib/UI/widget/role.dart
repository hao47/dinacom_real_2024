import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';

class Role extends StatelessWidget {
  const Role({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 1.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorValue.secondaryColor),
      child: Text(
        name,
        style: CommonAppTheme.textTheme(context)
            .bodyText1!
            .copyWith(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 10),
      ),
    );
  }
}
