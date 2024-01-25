import 'dart:convert';
import 'package:dinacom_2024/UI/bottom_navigation/item/poran/poran.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile.dart';
import 'package:dinacom_2024/data/api/profile_service.dart';
import 'package:dinacom_2024/data/model/poran_all_model.dart';
import 'package:dinacom_2024/data/model/poran_profile_model.dart';
import 'package:dinacom_2024/data/model/poran_profile_model.dart';
import 'package:dinacom_2024/data/model/poran_profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:dinacom_2024/constants/url_routes.dart';
import 'package:dinacom_2024/data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:flutter/material.dart';

import '../../../../common/enums/status.dart';



class ProfileController extends GetxController {

  final ProfileService profileService = ProfileService();

  Rx<ResultState> _state = ResultState.loading.obs;
  Rx<ResultState> _statep = ResultState.loading.obs;
  RxString _message = ''.obs;

  Rx<ProfileModel> _profileModel =
      ProfileModel( status: 200).obs;

  Rx<ProfileModel> get profileModel => _profileModel;

  RxString get message => _message;


  Rx<ResultState> get state => _state;


  // Rx<ResultState> _statep = ResultState.loading.obs;

  Rx<ResultState> get statep => _statep;

    Rx<PoranProfileModel> _poranModel = PoranProfileModel(responseProfileModel: [], status: 0).obs;

  Rx<PoranProfileModel> get poranModel => _poranModel;


  @override
  void onInit() async{
    super.onInit();
    profilee();
    getporanprofile();
    getporanprolike();
  }



  Future<dynamic> profilee() async {
    try {
      _state.value = ResultState.loading;


      final profile = await profileService.getprofile();

      // print(profile.response.length.toString());

      if (profile.responseProfile!.id == 0) {
        _state.value = ResultState.noData;

        return _message.value = 'Empty Data';
      } else {
        _state.value = ResultState.hasData;

        update();

        return _profileModel.value = profile;
      }
    } catch (e) {
      print(e.runtimeType);
      _state.value = ResultState.error;

      return _message.value = "ada yang salah";
    }
  }







  Future<dynamic> getporanprofile() async {
    try {
      _statep.value = ResultState.loading;


      final profile = await profileService.getporanprofile();

      // print(profile.response.length.toString());

      if (profile.responseProfileModel.isEmpty) {
        _statep.value = ResultState.noData;

        return _message.value = 'Empty Data';
      } else {
        _statep.value = ResultState.hasData;

        // update();

        return _poranModel.value = profile;
      }
    } catch (e) {
      print(e.runtimeType);
      _statep.value = ResultState.error;

      return _message.value = "ada yang salah";
    }
  }
  Future<dynamic> getporanprolike() async {
    try {
      _statep.value = ResultState.loading;


      final profile = await profileService.getporanlike();

      // print(profile.response.length.toString());

      if (profile.responseProfileModel.isEmpty) {
        _statep.value = ResultState.noData;

        return _message.value = 'Empty Data';
      } else {
        _statep.value = ResultState.hasData;

        // update();

        return _poranModel.value = profile;
      }
    } catch (e) {
      print(e.runtimeType);
      _statep.value = ResultState.error;

      return _message.value = "ada yang salah";
    }
  }

}
