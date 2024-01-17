import 'package:dinacom_2024/UI/widget/poran_card.dart';
import 'package:dinacom_2024/data/model/profile_model.dart';
import 'package:flutter/material.dart';


class ProfilePost extends StatelessWidget {

  ProfileModel profileModel;
   ProfilePost({super.key,required this.profileModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PoranCard(profileModel: profileModel,),
      ],
    );
  }
}
