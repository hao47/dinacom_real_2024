import 'package:dinacom_2024/UI/widget/poran_card.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:dinacom_2024/data/model/poran_all_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
class PoranList extends StatelessWidget {

  PoranAllModel poranAllModel;

   PoranList({super.key,required this.poranAllModel});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: poranAllModel.response.length,
      itemBuilder: (context, index) {

        var result = poranAllModel.response[index];

      return PoranCardItem(response: result);
    },);
  }
}


class PoranCardItem extends StatelessWidget {

  Response response;

  PoranCardItem({super.key,required this.response});


  @override
  Widget build(BuildContext context) {

    timeago.setLocaleMessages('id', timeago.IdMessages());

    // Waktu sekarang dengan zona waktu Indonesia (WIB)
    DateTime now = DateTime.now().toLocal();

    // Waktu dari string input dengan zona waktu Indonesia (WIB)

    DateTime inputDate = response.createdAt.toLocal();

    // Hitung selisih waktu
    Duration difference = now.difference(inputDate);

    // Format tanggal dan waktu menggunakan intl package
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss.SSS').format(inputDate);

    // Format waktu relatif menggunakan timeago package
    String timeAgo = timeago.format(now.subtract(difference), locale: 'id');

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      image: NetworkImage('http://10.0.2.2:8080/api/uploads/fh39aclx0p.jpg'
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
                          response.author.username,
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
                            response.author.role,
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
                    Text(timeAgo),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              response.content,
              maxLines: 5,
              style: CommonAppTheme.textTheme(context).bodyText1!.copyWith(
                color: Colors.black,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 10,
            ),

            response.gambar == "" ?
            Container():
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
                      response.gambar

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
                      color: ColorValue.LightGrey,
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    // Text('154', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: ColorValue.LightGrey))
                  ],
                ),
                SizedBox(width: 10),
                Row(
                  children: [
                    Icon(
                      Icons.send_rounded,
                      color: ColorValue.LightGrey,
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    // Text('154', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: ColorValue.LightGrey))
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
