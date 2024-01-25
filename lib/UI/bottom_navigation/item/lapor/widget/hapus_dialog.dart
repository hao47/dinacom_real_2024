import 'package:dinacom_2024/UI/bottom_navigation/bottom_navigation.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/poran/poran_provider.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile_provider.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExitPostDialog extends StatelessWidget {
  const ExitPostDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color(0xFFFEF3F2), shape: BoxShape.circle),
            padding: EdgeInsets.all(8),
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: Color(0xFFFEE4E2), shape: BoxShape.circle),
              child: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(height: 14),
          Text(
            'Keluar dari post',
            style: textTheme.bodyText1!.copyWith(
              fontSize: 16,
              height: 1.5,
              fontWeight: FontWeight.w900,
              color: ColorValue.BaseBlack,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Apakah anda yakin mau keluar dari post? aksi ini tidak bisa di kembalikan.',
            style: textTheme.bodyText1!.copyWith(
              fontSize: 12,
              height: 1.5,
              color: ColorValue.LightGrey,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              //Pindah Page


              // Get.back(closeOverlays: )

              Get.offAllNamed('/menu');

              Get.put(ProfileController());
              Get.put(PoranController());
            },
            child: Text(
              'Keluar',
              style: textTheme.bodyText1!.copyWith(
                fontSize: 16,
                height: 1.5,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              //Batal
              // Navigator.of(context).pop();

              Get.back();
            },
            child: Text(
              'Batal',
              style: textTheme.bodyText1!.copyWith(
                fontSize: 16,
                height: 1.5,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              side: BorderSide(color: Colors.black, width: 1),
            ),
          ),
        ],
      ),
    );
  }
}