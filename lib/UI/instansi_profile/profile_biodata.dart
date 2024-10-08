import 'package:dinacom_2024/UI/instansi_profile/widget/buildIBioInstansi.dart';
import 'package:dinacom_2024/UI/widget/role.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:dinacom_2024/data/model/profile_model.dart';
import 'package:flutter/material.dart';

class ProfileBioData extends StatelessWidget {
  const ProfileBioData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 5),
        Center(
          child: Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 10))
                    ],
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                        ))),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorValue.BaseBlue,
                    ),
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 20,
                    ),
                  )),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10,
          children: [
            Text(
              "Kota Kudus",
              style: CommonAppTheme.textTheme(context)
                  .headline1!
                  .copyWith(fontSize: 23),
            ),
            Image.asset(
              "assets/images/verified.png",
              fit: BoxFit.fill,
              width: 22,
            ),
          ],
        ),
        Text(
          "haiii! kenalankan aku mindus dari \n Jawa Tengah !",
          style: CommonAppTheme.textTheme(context)
              .bodyText1!
              .copyWith(color: Colors.black, fontSize: 14.5),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        const Role(name: "Instansi"),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: bios.map((bio) => buildBioRow(bio, context)).toList(),
        ),
      ],
    );
  }
}
