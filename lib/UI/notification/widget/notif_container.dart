import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';

class NotifContainer extends StatelessWidget {
  const NotifContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: ColorValue.VeryLightGrey,
            width: 2.0,
          ),
        ),
      ),
      child: Row(
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
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kota Kudus',
                    style:
                    CommonAppTheme.textTheme(context).bodyText1!.copyWith(
                      color: ColorValue.BaseBlack,
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text('made a new post'),
                ],
              ),
              Text('22 jam yang lalu'),
            ],
          ),
        ],
      ),
    );
  }
}