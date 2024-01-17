import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile_biodata.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile_post.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
        title: Text(
          "Profile",
          style: textTheme.headline1!.copyWith(fontSize: 20, height: 1.5),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileBioData(),
            ProfilePost()
          ],
        ),
      ),
    );
  }
}
