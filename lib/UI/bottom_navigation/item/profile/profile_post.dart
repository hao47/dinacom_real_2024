import 'package:dinacom_2024/UI/widget/poran_card.dart';
import 'package:flutter/material.dart';

class ProfilePost extends StatelessWidget {
  const ProfilePost({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          PoranCard(),
        ],
      ),
    );
  }
}
