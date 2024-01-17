import 'package:dinacom_2024/UI/widget/poran_card.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:dinacom_2024/data/model/profile_model.dart';
import 'package:flutter/material.dart';

import 'widget/buildIBioInstansi.dart';

class ProfilePost extends StatelessWidget {
  const ProfilePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PoranCard(),
      ],
    );
  }
}
