import 'package:dinacom_2024/UI/bottom_navigation/item/search/search_controller.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SortShowmodal extends StatelessWidget {

  SortShowmodal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,),
            child: ListTile(
              onTap: (){
                Navigator.of(context).pop();
                Get.put(SearchPageController()).getPoranSearch("awdmnawdmnawjndiuawndiauwnduiandiawundiuaw");
                
              },
              shape: Border(
                bottom: BorderSide(
                  color: ColorValue.LightGrey,
                  width: 1, // Adjust the width of the bottom border
                ),
              ),
              title: Text(
                'Poran terbaru - terlama',
                style: CommonAppTheme.textTheme(context).bodyText1!.copyWith(
                  fontSize: 14,
                  color: ColorValue.BaseBlack,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,),
            child: ListTile(
              onTap: (){
                Navigator.of(context).pop();
                Get.put(SearchPageController()).getPoranSearch("awdawdawdawdawbndbuawnduawndaiwdnauwindawudnia");

              },

              title: Text(
                'Poran terlama - terbaru  ',
                style: CommonAppTheme.textTheme(context).bodyText1!.copyWith(
                  fontSize: 14,
                  color: ColorValue.BaseBlack,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}