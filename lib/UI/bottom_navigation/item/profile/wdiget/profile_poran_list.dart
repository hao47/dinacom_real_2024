import 'package:dinacom_2024/UI/bottom_navigation/item/profile/wdiget/poran_card.dart';

import 'package:dinacom_2024/data/model/poran_all_model.dart';
import 'package:dinacom_2024/data/model/poran_profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePoranList extends StatelessWidget {

  PoranProfileModel poranAllModel;
  // GetLikeModel getLikeModel;

   // Profile({super.key,required this.poranAllModel,required this.getLikeModel});
  ProfilePoranList({super.key,required this.poranAllModel});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: poranAllModel.responseProfileModel.length,
      itemBuilder: (context, index) {

        var result = poranAllModel.responseProfileModel[index];


        // return Container();

      return PoranCardItemProfile(response: result);
    },);
  }
}

