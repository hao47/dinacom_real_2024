import 'dart:ui';

import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:dinacom_2024/data/model/berita_model.dart';
import 'package:flutter/material.dart';

class DetailBeritaPage extends StatelessWidget {
  Result result;

  DetailBeritaPage({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    String tahun = result.pubDate.year.toString();
    String bulan = result.pubDate.month.toString();
    String hari = result.pubDate.day.toString();
    final textTheme = Theme.of(context).textTheme;
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: ColorValue.LightBlue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Berita",
          style: textTheme.headline1!
              .copyWith(fontSize: 20, height: 1.5, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: height * 0.4,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(result.imageUrl ??
                    "https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ="),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    left: width * 0.07,
                    right: width * 0.07,
                    top: height * 0.035),
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(result.title,
                        style: textTheme.bodyText1!.copyWith(
                            fontSize: 16,
                            height: 1.5,
                            color: ColorValue.BaseBlack,
                            fontWeight: FontWeight.w900)),
                    SizedBox(height: 10),
                    Text("$tahun-$bulan-$hari",
                        style: textTheme.bodyText1!.copyWith(
                            fontSize: 12,
                            height: 1.5,
                            color: ColorValue.BaseGrey,
                            fontWeight: FontWeight.w900)),
                    SizedBox(height: 25),
                    Text(
                      """
                    ${result.description}
                    
                    ${result.description}
                    
                    ${result.description}
                        ${result.description}
                    
                    ${result.description}
                    
                    ${result.description}
                    
                    """,
                      style: textTheme.bodyText1!.copyWith(
                          fontSize: 14,
                          height: 1.5,
                          color: ColorValue.BaseBlack),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
