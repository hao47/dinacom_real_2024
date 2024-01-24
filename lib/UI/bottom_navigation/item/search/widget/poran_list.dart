import 'package:dinacom_2024/UI/bottom_navigation/item/poran/widget/poran_card.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/search/widget/poran_card.dart';
import 'package:dinacom_2024/data/model/poran_all_model.dart';
import 'package:dinacom_2024/data/model/search_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PoranListSearch extends StatelessWidget {
  SearchModel searchModel;
BuildContext? newContext;
  // newContext: newContext


  PoranListSearch({super.key, required this.searchModel,this.newContext});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 0),
      shrinkWrap: true,
      itemCount: searchModel.posts.length,
      itemBuilder: (context, index) {
        var result = searchModel.posts[index];

        return PoranCardItemSearch(response: result,newContext: newContext);
      },
    );
  }
}

