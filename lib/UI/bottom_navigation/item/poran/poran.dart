import 'package:dinacom_2024/UI/bottom_navigation/item/poran/widget/poran_list.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/poran/poran_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:math';

import 'widget/poranAppBar.dart';

class Poran extends StatefulWidget {
  Poran({super.key});

  @override
  State<Poran> createState() => _PoranState();
}

class _PoranState extends State<Poran> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PoranProvider>(context, listen: false).profile();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TitlePoranScreen(),
        body: Consumer<PoranProvider>(
          builder: (context, state, _) {
            print(state.categoryResult.response.length);
            if (state.state == ResultState.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.state == ResultState.hasData) {
              return PoranList(poranAllModel: state.categoryResult);
            } else if (state.state == ResultState.noData) {
              return Center(
                child: Material(
                  child: Text(state.message),
                ),
              );
            } else if (state.state == ResultState.error) {
              return Center(
                child: Material(
                  child: Text("halo"),
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
        ));
  }
}
