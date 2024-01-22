import 'package:dinacom_2024/UI/widget/poran_card.dart';
import 'package:dinacom_2024/data/model/poran_all_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePoranList extends StatelessWidget {

  PoranAllModel poranAllModel;
  // GetLikeModel getLikeModel;

   // Profile({super.key,required this.poranAllModel,required this.getLikeModel});
  ProfilePoranList({super.key,required this.poranAllModel});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: poranAllModel.responseAllModel.length,
      itemBuilder: (context, index) {

        var result = poranAllModel.responseAllModel[index];

      return PoranCardItem(response: result);
    },);
  }
}

