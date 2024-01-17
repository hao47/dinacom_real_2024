import 'package:dinacom_2024/UI/instansi/profile_biodata.dart';
import 'package:dinacom_2024/UI/instansi/profile_post.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';

class ProfileInstansi extends StatelessWidget {
  const ProfileInstansi({super.key});

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
            Container(
              height: MediaQuery.of(context).size.height / 2.2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topRight, stops: [
                  0.1,
                  0.8
                ], colors: [
                  Colors.black.withOpacity(.2),
                  Colors.white.withOpacity(.0)
                ]),
                image: DecorationImage(
                  image: AssetImage("assets/images/bg-profile.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: ProfileBioData(),
            ),
            ProfilePost()
          ],
        ),
      ),
    );
  }
}
