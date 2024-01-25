import 'package:dinacom_2024/UI/bottom_navigation/item/berita/news_detail.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:dinacom_2024/data/model/berita_model.dart';
import 'package:dinacom_2024/teset.dart';
import 'package:flutter/material.dart';

class BeritaCard extends StatelessWidget {

  Result result;
   BeritaCard({super.key,required this.result});

  @override
  Widget build(BuildContext context) {

    String tahun = result.pubDate.year.toString();
    String bulan = result.pubDate.month.toString();
    String hari = result.pubDate.day.toString();

    return InkWell(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context) {
          return DetailBeritaPage(result: result);
        },));
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                spreadRadius: 2,
                blurRadius: 10,
                color: Colors.black.withOpacity(0.1),
                offset: Offset(0, 10))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
      
                  result.imageUrl ?? "https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ="
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
      
             result.title ?? "",
              style: CommonAppTheme.textTheme(context)
                  .bodyText1!
                  .copyWith(fontSize: 12, color: ColorValue.BaseBlack),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(),
            Text(
              "$tahun-$bulan-$hari",
              style: CommonAppTheme.textTheme(context)
                  .bodyText1!
                  .copyWith(fontSize: 12),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}