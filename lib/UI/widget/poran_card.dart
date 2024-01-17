import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:dinacom_2024/data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PoranCard extends StatelessWidget {
  const PoranCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: ColorValue.VeryLightBlue,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFd5d5d5),
            offset: Offset(10, 11),
            blurRadius: 14,
            spreadRadius: -2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: ColorValue.VeryLightGrey,
                      size: 10,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Dalam antrian',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: ColorValue.VeryLightGrey,
                          fontSize: 10),
                    ),
                  ],
                ),
                Icon(Icons.more_horiz)
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
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
                SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Kota Kudus',
                          style: CommonAppTheme.textTheme(context)
                              .headline1!
                              .copyWith(fontSize: 20),
                        ),
                        SizedBox(width: 10),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorValue.secondaryColor),
                          child: Text(
                            "Instansi",
                            style: CommonAppTheme.textTheme(context)
                                .bodyText1!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 7),
                          ),
                        ),
                        SizedBox(width: 3),
                        Image.asset(
                          "assets/images/verified.png",
                          fit: BoxFit.fill,
                          width: 16,
                        ),
                      ],
                    ),
                    Text('10 jam yang lalu'),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Haiii kawan kawan Gonnect gimana nih kabar kalian? kabar mindus sih baik nih. Kalian pada gasabar ga sih dengan perkembangan IKN?  kalo mindus udah gasabar bangett nunguin IKN gimana kedepanya btw kalian udah pada tau belum apa itu IKN? kalau ada yang belum tau yuk simak link dibawah ini!!',
              maxLines: 5,
              style: CommonAppTheme.textTheme(context).bodyText1!.copyWith(
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0, 10))
                ],
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.chat_bubble_outline,
                      color: ColorValue.VeryLightGrey,
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    Text('154', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: ColorValue.LightGrey))
                  ],
                ),
                SizedBox(width: 10),
                Row(
                  children: [
                    Icon(
                      Icons.send_rounded,
                      color: ColorValue.VeryLightGrey,
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    Text('154', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: ColorValue.LightGrey))
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
