import 'dart:convert';
import 'package:dinacom_2024/UI/bottom_navigation/item/poran/poran.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile.dart';
import 'package:dinacom_2024/data/api/profile_service.dart';
import 'package:dinacom_2024/data/model/poran_all_model.dart';
import 'package:dinacom_2024/data/model/poran_profile_model.dart';
import 'package:dinacom_2024/data/model/poran_profile_model.dart';
import 'package:dinacom_2024/data/model/poran_profile_model.dart';
import 'package:dinacom_2024/data/model/search_model.dart';
import 'package:dinacom_2024/data/model/search_model.dart';
import 'package:dinacom_2024/data/model/search_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:dinacom_2024/constants/url_routes.dart';
import 'package:dinacom_2024/data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:flutter/material.dart';

import '../../../../common/enums/status.dart';



class SearchPageController extends GetxController {

  final ProfileService profileService = ProfileService();

  Rx<ResultState> _statep = ResultState.loading.obs;
  RxString _message = ''.obs;

  Rx<SearchModel> _searchmodel =
      SearchModel( posts: []).obs;

  Rx<SearchModel> get searchmodel => _searchmodel;

  RxString get message => _message;



  Rx<ResultState> get statep => _statep;


  TextEditingController controllersearch = TextEditingController();

//
//   ResultState get state => state;
//
//
//   ProfileProvider(){
//     getporanprofile();
//   }
//

  @override
  void onInit() async{
    super.onInit();
    getPoranSearch(controllersearch.text ?? "");
  }

  Future<dynamic> getPoranSearch(String q) async {

    // print(q);
    try {
      _statep.value = ResultState.loading;


      final profile = await profileService.getporansearch(q);

      // print(profile.response.length.toString());

      if (profile.posts!.isEmpty) {
        _statep.value = ResultState.noData;

        return _message.value = 'Empty Data';
      } else {
        _statep.value = ResultState.hasData;

        update();

        return _searchmodel.value = profile;
      }
    } catch (e) {
      print(e.runtimeType);
      _statep.value = ResultState.error;

      return _message.value = "ada yang salah";
    }
  }


}
