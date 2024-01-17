import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:dinacom_2024/data/model/profile_model.dart';
import 'package:flutter/material.dart';

Widget buildBioRow(ProfileModel bio, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            bio.iconData,
            color: ColorValue.LightGrey,
            size: 18,
          ),
          SizedBox(width: 5),
          Text(
            bio.text,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 12,
              letterSpacing: 0,
            ),
          ),
        ],
      ),
      SizedBox(height: 5),
    ],
  );
}