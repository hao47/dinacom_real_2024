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

import '../../common/enums/status.dart';



class ProfileMasyarakatController extends GetxController {

  final ProfileService profileService = ProfileService();

  Rx<ResultState> _state = ResultState.loading.obs;
  RxString _message = ''.obs;

  Rx<ProfileModel> _profileModel =
      ProfileModel( status: 200).obs;

  Rx<ProfileModel> get profileModel => _profileModel;

  RxString get message => _message;


  Rx<ResultState> get state => _state;


  Rx<ResultState> _statep = ResultState.loading.obs;

  Rx<ResultState> get statep => _state;
//
//
//
//   final ProfileService profileService = ProfileService();
//   final ValueNotifier<bool> isLoad = ValueNotifier<bool>(false);
//   late final SharedPreferences prefs;
//
//
//
//   late ProfileModel _profileModel;
  Rx<PoranProfileModel> _poranModel = PoranProfileModel(responseProfileModel: [], status: 0).obs;
//
//   late ResultState _state;
//   String _message = '';
//
//   String get message => _message;
//
//   ProfileModel get categoryResult => _profileModel;
  Rx<PoranProfileModel> get poranModel => _poranModel;
//
//   ResultState get state => _state;
//
//
//   ProfileProvider(){
//     getporanprofile();
//   }
//

  var one = Get.arguments;
  @override
  void onInit() async{
    super.onInit();
    profilebyid();
    getporanprofileuser();
  }

  Future<dynamic> profilebyid() async {
    try {
      _state.value = ResultState.loading;


      final profile = await profileService.getprofilebyid(one[0]);

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


  Future<dynamic> getporanprofileuser() async {
    try {
      _statep.value = ResultState.loading;


      final profile = await profileService.getporanpuser(one[0]);

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
//
//
//   Future<dynamic> getporanprofile() async {
//     try {
//       _state = ResultState.loading;
//       notifyListeners();
//       final profile = await profileService.getporanprofile();
//       if (profile.response.isEmpty) {
//         _state = ResultState.noData;
//         notifyListeners();
//         return _message = 'Empty Data';
//       } else {
//         _state = ResultState.hasData;
//         notifyListeners();
//         return _poranModel = profile;
//       }
//     } catch (e) {
//       print(e);
//       _state = ResultState.error;
//       notifyListeners();
//       return _message = "ada yang salah";
//     }
//   }
}
