import 'package:dinacom_2024/common/app_theme.dart';
import 'package:flutter/material.dart';



PreferredSizeWidget? TitleBackScreen(BuildContext context,String text){
  return AppBar(
    leading:  Icon(
      Icons.arrow_back_ios,
      color: Colors.black,
    ),
    title:Text(
      text,
      style: CommonAppTheme.textTheme(context)
          .headline1!
          .copyWith(
          fontSize: 20,  height: 1.5),
    ),


  );
}

