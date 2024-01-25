import 'package:carousel_slider/carousel_slider.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        CarouselSlider(
          items: [
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(6.0),
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
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Pemilu sudah dekat ayo pilih cawapres pilihan kamu lewat Go connect",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: CommonAppTheme.textTheme(context)
                              .bodyText1!
                              .copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: Colors.white,
                              height: 1.25
                          ),
                        ),
                        width: MediaQuery.sizeOf(context).width * .7,
                      ),
                      Spacer(),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: ColorValue.BaseBlue,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.open_in_new,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Text("Rab, 14 Feb – Rab, 26 Jun 2024"),
                ],
              ),
            ),
          ],
          options: CarouselOptions(
            height: 190,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.9,
          ),
        ),
      ],
    );
  }
}