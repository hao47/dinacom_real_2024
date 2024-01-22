import 'package:dinacom_2024/UI/widget/poran_card.dart';
import 'package:dinacom_2024/data/model/poran_all_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PoranList extends StatelessWidget {
  PoranAllModel poranAllModel;
BuildContext? newContext;
  // newContext: newContext


  PoranList({super.key, required this.poranAllModel,this.newContext});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 0),
      shrinkWrap: true,
      itemCount: poranAllModel.responseAllModel.length,
      itemBuilder: (context, index) {
        var result = poranAllModel.responseAllModel[index];

        return PoranCardItem(response: result,newContext: newContext);
      },
    );
  }
}

