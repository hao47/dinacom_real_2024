import 'package:dinacom_2024/UI/bottom_navigation/item/poran/poran_list.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/poran/poran_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:math';

class Poran extends StatelessWidget {
   Poran({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/images/logo.png",width: 120),
      ),
      body: Consumer<PoranProvider>(
        builder: (context, state, _) {
          print(state.categoryResult.response.length);
          if (state.state == ResultState.loading) {
            return Text("");
          } else if (state.state == ResultState.hasData) {
            return PoranList(poranAllModel: state.categoryResult);

            // print(state.categoryResult.response.length);
            return Container();

          } else if (state.state == ResultState.noData) {
            return Center(
              child: Material(
                child: Text(state.message),
              ),
            );
          } else if (state.state == ResultState.error) {
            return Center(
              child: Material(
                child: Text(state.message),
              ),
            );
          } else {
            return const Center(
              child: Material(
                child: Text(''),
              ),
            );
          }
        },
      )
    );
  }
}
