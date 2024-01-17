import 'package:dinacom_2024/UI/bottom_navigation/item/profile/widget/buildIBioInstansi.dart';
import 'package:dinacom_2024/UI/widget/role.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';

class ProfileBioData extends StatelessWidget {
  const ProfileBioData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 10))
                    ],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ColorValue.secondaryColor),
                  child: Text(
                    "Setelan",
                    style: CommonAppTheme.textTheme(context)
                        .bodyText1!
                        .copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 10),
                  ),
                ),
              ],
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Nyoman Deka',
                      style: CommonAppTheme.textTheme(context)
                          .headline1!
                          .copyWith(fontSize: 20),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorValue.secondaryColor),
                      child: Text(
                        "Masyarakat",
                        style: CommonAppTheme.textTheme(context)
                            .bodyText1!
                            .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 7),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 250,
                  child: Text(
                    'halo gais ini aplikasi kapan jadinya ya ...',
                    maxLines: 3,
                    style: CommonAppTheme.textTheme(context)
                        .bodyText1!
                        .copyWith(fontSize: 13, color: ColorValue.LightGrey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: ColorValue.LightGrey,
                          size: 16,
                        ),
                        SizedBox(width: 3),
                        Text(
                          '12 Desember 1998',
                          style: CommonAppTheme.textTheme(context)
                              .bodyText1!
                              .copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: ColorValue.LightGrey,
                          size: 16,
                        ),
                        SizedBox(width: 3),
                        Text(
                          'Bogor, Jawa Barat',
                          style: CommonAppTheme.textTheme(context)
                              .bodyText1!
                              .copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        SizedBox(height: 15),
        Divider(
          thickness: 1.75,
          color: ColorValue.VeryLightGrey,
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
