
// import 'package:dinacom_2024/UI/bottom_navigation/item/notification/widget/notif_container.dart';
import 'package:dinacom_2024/UI/notification/widget/notif_container.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool truefalse = true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
      ),
      body: truefalse
          ? SafeArea(
        child: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return NotifContainer();
          },
        ),
      )
          : Container(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/mail_logo.png",
              width: MediaQuery.sizeOf(context).width * 0.6,
              fit: BoxFit.fill,
            ),
            Text(
              'Belum ada notifikasi untuk anda',
              style:
              CommonAppTheme.textTheme(context).bodyText1!.copyWith(
                color: ColorValue.LightGrey,
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}