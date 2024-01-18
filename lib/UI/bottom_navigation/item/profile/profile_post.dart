import 'package:dinacom_2024/UI/widget/poran_card.dart';
import 'package:dinacom_2024/data/model/profile_model.dart';
import 'package:flutter/material.dart';

class ProfilePost extends StatelessWidget {

  ProfileModel profileModel;
   ProfilePost({super.key,required this.profileModel});

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: EdgeInsets.only(top: 10),
      child: ListView.builder(
        itemCount: profileModel.post.length,
        itemBuilder: (context, index) {
        return PoranCard(profileModel: profileModel,);
      },)

    );
  }
}
