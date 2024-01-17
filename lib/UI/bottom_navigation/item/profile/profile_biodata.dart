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
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(100)),
        ),
        SizedBox(height: 20),
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
            )
          ],
        ),
        SizedBox(height: 10),
        Text(
          "haiii! kenalankan aku mindus dari \n Jawa Tengah !",
          style: CommonAppTheme.textTheme(context).bodyText1!.copyWith(
                color: Colors.black,
                fontSize: 14.5,
              ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorValue.secondaryColor),
          child: Text(
            "Instansi",
            style: CommonAppTheme.textTheme(context)
                .bodyText1!
                .copyWith(color: Colors.white),
          ),
        ),
        SizedBox(height: 10),
        ListView.builder(

          itemExtent: 27,
          itemCount: bios.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return SizedBox(
              width: 10,
              child: Row(
                children: [
                  Icon(bios[index].iconData),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    bios[index].text,
                    style: CommonAppTheme.textTheme(context)
                        .bodyText1!
                        .copyWith(fontSize: 14, letterSpacing: 0),
                  ),
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
