import 'dart:convert';
import 'dart:math';
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile.dart';
import 'package:dinacom_2024/data/api/poran_service.dart';
import 'package:dinacom_2024/data/api/profile_service.dart';
import 'package:dinacom_2024/data/model/poran_all_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:dinacom_2024/constants/url_routes.dart';
import 'package:dinacom_2024/data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';


enum ResultState { loading, noData, hasData, error }

String generateRandomString(int length) {
  final random = Random();
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  return List.generate(length, (index) => chars[random.nextInt(chars.length)]).join();
}
class PoranProvider extends ChangeNotifier {



  final PoranService profileService = PoranService();
  final ValueNotifier<bool> isLoad = ValueNotifier<bool>(false);
  late final SharedPreferences prefs;



  PoranAllModel _profileModel = PoranAllModel(response: [], status: 200);

  late ResultState _state;
  String _message = '';

  String get message => _message;

  PoranAllModel get categoryResult => _profileModel;

  ResultState get state => _state;


  PoranProvider(){
    profile();
  }

  Future<dynamic> profile() async {
    notifyListeners();

    try {
      _state = ResultState.loading;
      notifyListeners();
      final profile = await profileService.getporan();
      if (profile.response.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        // print(profile.response.length);

        _state = ResultState.hasData;
        notifyListeners();
        return _profileModel = profile;
      }
    } catch (e) {
      print(e.runtimeType );
      _state = ResultState.error;
      notifyListeners();
      return _message = "ada yang salah";
    }
  }

  String randomString = generateRandomString(10);
  Future<void> uploadImage(XFile? pickedfile) async{
    try{
      Dio dio = Dio();

      if(pickedfile != null){
        FormData formData = FormData.fromMap({
          'userFile': await MultipartFile.fromFile(pickedfile.path,filename:randomString + ".jpg"),
          'content':"hawdnawuidnawuidnawuidnawuidawndiuawnduawndianwuidanwudnaiwudnawidnaiwu",
          'ditujukan':"kepada instasi kudus lol"
        }
        );
        //
        dio.options.headers['content-Type'] = 'multipart/form-data';
        dio.options.headers["authorization"] = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImRhZmZhIiwiZW1haWwiOiJkYWZmYXJvYmFuaTU1MUBnbWFpbC5jb20iLCJpZCI6MSwiZXhwIjoxNzA1NjYxOTU0fQ.aamqFwyjMlqiTpl8OC72N0axTw07rh6RBmxsKukcHDs";

        var response = await dio.post(

            'http://10.0.2.2:8080/api/secured/posts',
            data: formData
        );

        // print(response.data);
        if(response.statusCode == 201){
           profile();
          print(response.data);
          notifyListeners();
        }else{
          print("gagal");
        }
      }else{

      }

    } catch (error){
      print(error);
    }
  }
}
