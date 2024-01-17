import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';

class PoranRepostTab extends StatelessWidget {
  const PoranRepostTab({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      padding: const EdgeInsets.only(top: 10, bottom: 5),
      dividerColor: Colors.transparent,
      indicator: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorValue.BaseBlue,
            width: 3,
          ),
        ),
      ),
      unselectedLabelStyle:
          CommonAppTheme.textTheme(context).bodyText1!.copyWith(
                fontWeight: FontWeight.w900,
                fontSize: 16,
              ),
      unselectedLabelColor: ColorValue.LightGrey,
      labelStyle: CommonAppTheme.textTheme(context).bodyText1!.copyWith(
        fontWeight: FontWeight.w900,
        fontSize: 16,
      ),
      labelColor: ColorValue.BaseBlack,
      tabs: const [
        Tab(
          text: 'Poran',
        ),
        Tab(
          text: 'Repost',
        ),
      ],
    );
  }
}
