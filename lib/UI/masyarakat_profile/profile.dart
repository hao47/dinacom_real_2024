import 'package:dinacom_2024/UI/masyarakat_profile/profile_biodata.dart';
import 'package:dinacom_2024/UI/masyarakat_profile/profile_post.dart';
import 'package:flutter/material.dart';

class ProfileMasyarakat extends StatelessWidget {
  const ProfileMasyarakat({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
        title: Text(
          "Profile",
          style: textTheme.headline1!.copyWith(fontSize: 20, height: 1.5),
        ),
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
