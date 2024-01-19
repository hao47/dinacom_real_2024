import 'dart:convert';
import 'dart:math';
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile.dart';
import 'package:dinacom_2024/data/api/like_service.dart';
import 'package:dinacom_2024/data/api/poran_service.dart';
import 'package:dinacom_2024/data/api/profile_service.dart';
import 'package:dinacom_2024/data/model/check_like_model.dart';
import 'package:dinacom_2024/data/model/get_like_model.dart';
import 'package:dinacom_2024/data/model/poran_all_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:dinacom_2024/constants/url_routes.dart';
import 'package:dinacom_2024/data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';


// import 'package:flutter_quill/translations.dart' show FlutterQuillLocalizations;

enum ResultState { loading, noData, hasData, error }

String generateRandomString(int length) {
  final random = Random();
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  return List.generate(length, (index) => chars[random.nextInt(chars.length)])
      .join();
}

class PoranProvider extends ChangeNotifier {
  //
  //
  //
  final PoranService profileService = PoranService();
  final LikeService likeService = LikeService();
  final ValueNotifier<bool> isLoad = ValueNotifier<bool>(false);

  PoranAllModel _profileModel = PoranAllModel(response: [], status: 200);
  GetLikeModel _likeModel = GetLikeModel(status: 0);

  late ResultState _state;
  String _message = '';

  String get message => _message;

  PoranAllModel get categoryResult => _profileModel;

  GetLikeModel get likeModel => _likeModel;

  ResultState get state => _state;

  int count = 0;

  // PoranProvider(){
  //   profile();
  // }


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
      print(e.runtimeType);
      _state = ResultState.error;
      notifyListeners();
      return _message = "ada yang salah";
    }
  }

  addcounter(int counte) {
    count = counte + 1;

    notifyListeners();
  }

  resetcounter(int counte) {
    count = counte--;
    notifyListeners();
  }

  like(BuildContext context, int id, int uslike) async {
    // notifyListeners();

    print("adwawd");

    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');

    final response = await http.post(
        Uri.parse("http://10.0.2.2:8080/api/secured/likes/$id/$uslike"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': '$token',
        });

    if (response.statusCode == 200) {
      var responses = jsonDecode(response.body);
      _likeModel = GetLikeModel.fromJson(responses);

      // Provider.of<PoranProvider>(context, listen: false).profile();
    } else {
      throw Exception('ada yang salah');
    }
  }

  dislike(BuildContext context, int id,int post_id) async {
    // notifyListeners();

    print("adwawd");

    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');

    final response = await http.delete(
        Uri.parse("http://10.0.2.2:8080/api/secured/likes/$id/$post_id"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': '$token',
        });

    if (response.statusCode == 200) {
      print("halok dek");

      // Provider.of<PoranProvider>(context, listen: false).profile();
    } else {
      throw Exception('ada yang salah');
    }
  }

  CheckLikeModel a = CheckLikeModel(exist: false, responseLike: [], status: 0);


  bool check  = false;

  setlike(){
    check = false;
    notifyListeners();
  }
  unlike(){
    check = true;
    notifyListeners();
  }
  Future<dynamic>checklike(int post_id) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');

    final response = await http.get(
        Uri.parse("http://10.0.2.2:8080/api/secured/likes/$post_id"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': '$token',
        });



    if (response.statusCode == 200) {

      var responses = jsonDecode(response.body);
       a = CheckLikeModel.fromJson(responses);



      if(a.responseLike.isEmpty){
        notifyListeners();
        return check = false;
      }else {
        notifyListeners();
        return check = true;
      }

      // print("halok dek");

      // Provider.of<PoranProvider>(context, listen: false).profile();
    } else {
      throw Exception('ada yang salah');
    }
  }
  //
  String randomString = generateRandomString(10);

  Future<void> uploadImage(XFile? pickedfile,String text) async {
    try {

      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('token');
      Dio dio = Dio();

      if (pickedfile != null) {
        FormData formData = FormData.fromMap({
          'userFile': await MultipartFile.fromFile(pickedfile.path,
              filename: randomString + ".jpg"),
          'content': text,
          'ditujukan': "kepada instasi kudus"
        });
        //
        dio.options.headers['content-Type'] = 'multipart/form-data';
        dio.options.headers["authorization"] = token;
        var response = await dio.post('http://10.0.2.2:8080/api/secured/posts',
            data: formData);

        // print(response.data);
        if (response.statusCode == 201) {
          profile();
          print(response.data);
          notifyListeners();
        } else {
          print("gagal");
        }
      } else {}
    } catch (error) {
      print(error);
    }
  }


  deleteporan(int id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');

    final response = await http.delete(
        Uri.parse("http://10.0.2.2:8080/api/secured/posts/$id"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': '$token',
        });

    // print(response.body);

    if (response.statusCode == 200) {
      print("berhasil hapus");
    } else {
      throw Exception('ada yang salah');
    }
  }
}
