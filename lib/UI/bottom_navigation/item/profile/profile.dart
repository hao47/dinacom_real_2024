import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile_biodata.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile_post.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        automaticallyImplyLeading: false,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ProfileBioData(),
            ProfilePost(),
          ],
        ),
      ),
    );
  }
}
