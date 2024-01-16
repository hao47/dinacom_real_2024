import 'package:flutter/material.dart';

class AuthBanner extends StatelessWidget {
  const AuthBanner({super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
        // alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            "assets/images/orang.png",
            width: screenWidth,
            fit: BoxFit.fill,
          ),

          SizedBox(height: 30,),

          Image.asset("assets/images/auth_logo.png",width: screenWidth * 0.22,fit: BoxFit.fill),
        ],
      );
  }
}
