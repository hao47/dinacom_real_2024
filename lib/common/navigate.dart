import 'package:flutter/cupertino.dart';

class Navigate {
  static void navigatorNamed(BuildContext context, String routeName ) {
    Navigator.pushNamed(context, routeName);
  }

  static void navigatorNamedWithArgument(BuildContext context, String routeName ) {
    Navigator.pushNamed(context, routeName,arguments: "");
  }
  // static void navigatorNamedArgument(BuildContext context, String routeName, Object? object) {
  //   Navigator.pushNamed(context, routeName,arguments: object);
  // }


  static void navigatorReplacement(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

}