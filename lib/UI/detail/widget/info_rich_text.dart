import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';

class InfoRichText extends StatelessWidget {
  const InfoRichText({super.key, required this.total, required this.title});
  final int total;
  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return RichText(
      text: TextSpan(
        text: '$total',
        style: textTheme.bodyText1!.copyWith(
            fontSize: 12,
            height: 1.5,
            color: ColorValue.BaseGrey,
            fontWeight: FontWeight.w900),
        children: [
          TextSpan(
            text: ' $title',
            style: CommonAppTheme.textTheme(context)
                .bodyText1!
                .copyWith(
                fontSize: 12,
                color: ColorValue.LightGrey),
          ),
        ],
      ),
    );
  }
}