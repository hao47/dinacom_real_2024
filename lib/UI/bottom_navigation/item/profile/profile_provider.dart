import 'dart:convert';
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile.dart';
import 'package:dinacom_2024/data/api/profile_service.dart';
import 'package:dinacom_2024/data/model/poran_all_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:dinacom_2024/constants/url_routes.dart';
import 'package:dinacom_2024/data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:flutter/material.dart';


enum ResultState { loading, noData, hasData, error }

class ProfileProvider extends ChangeNotifier {



  final ProfileService profileService = ProfileService();
  final ValueNotifier<bool> isLoad = ValueNotifier<bool>(false);
  late final SharedPreferences prefs;



  late ProfileModel _profileModel;
  late PoranAllModel _poranModel;

  late ResultState _state;
  String _message = '';

  String get message => _message;

  ProfileModel get categoryResult => _profileModel;
  PoranAllModel get poranModel => _poranModel;

  ResultState get state => _state;


  ProfileProvider(){
    getporanprofile();
  }

  Future<dynamic> profilee() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final profile = await profileService.getprofile();
      if (profile.responseProfile.id == 0) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _profileModel = profile;
      }
    } catch (e) {
      print(e);
      _state = ResultState.error;
      notifyListeners();
      return _message = "ada yang salah";
    }
  }


  Future<dynamic> getporanprofile() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final profile = await profileService.getporanprofile();
      if (profile.response.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _poranModel = profile;
      }
    } catch (e) {
      print(e);
      _state = ResultState.error;
      notifyListeners();
      return _message = "ada yang salah";
    }
  }
}
