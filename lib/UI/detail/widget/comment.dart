import 'package:dinacom_2024/UI/widget/role.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentPoran extends StatelessWidget {
  const CommentPoran({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorValue.VeryLightGrey,
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Text(
                  'Membalas',
                  style: CommonAppTheme.textTheme(context)
                      .bodyText1!
                      .copyWith(fontSize: 12, color: ColorValue.LightGrey),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child:
                  Icon(Icons.circle, size: 4, color: ColorValue.LightGrey),
                ),
                Text(
                  'Nyoman Deka',
                  style: CommonAppTheme.textTheme(context).bodyText1!.copyWith(
                      fontSize: 12,
                      color: ColorValue.BaseBlack,
                      fontWeight: FontWeight.w900),
                )
              ],
            ),
          ),
          Column(
            children: [
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
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Calvil Aprillio",
                            style: CommonAppTheme.textTheme(context)
                                .bodyText1!
                                .copyWith(
                                fontSize: 10,
                                color: ColorValue.BaseBlack,
                                fontWeight: FontWeight.w900),
                          ),
                          SizedBox(width: 10),
                          Role(name: "masyarakat", ),
                        ],
                      ),
                      const Text("36 Menit yang lalu"),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 36, height: 36),
                  const SizedBox(width: 5),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    child: Text(
                      "Setuju banget @minadus paslon nomor 2 adalah yang terbaik karena kinjeranya sudah terlihat sebagai menhan & dan wali kota Solo, yuk guyss pilih #paslon2",
                      style: CommonAppTheme.textTheme(context)
                          .bodyText1!
                          .copyWith(
                          fontSize: 12, color: ColorValue.BaseBlack),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}