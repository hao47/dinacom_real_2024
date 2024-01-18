import 'package:dinacom_2024/UI/widget/poran_card.dart';
import 'package:dinacom_2024/data/model/poran_all_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PoranList extends StatelessWidget {
  PoranAllModel poranAllModel;

  PoranList({super.key, required this.poranAllModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: poranAllModel.response.length,
      itemBuilder: (context, index) {
        var result = poranAllModel.response[index];

        return PoranCardItem(response: result);
      },
    );
  }
}

