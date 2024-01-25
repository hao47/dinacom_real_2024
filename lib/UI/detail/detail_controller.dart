

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:dinacom_2024/data/api/poran_service.dart';
import 'package:dinacom_2024/data/model/detail_model.dart';
import 'package:dinacom_2024/data/model/detail_model.dart';
import 'package:dinacom_2024/data/model/detail_model.dart';
import 'package:dinacom_2024/data/model/get_comment_model.dart';
import 'package:dinacom_2024/data/model/get_comment_model.dart';
import 'package:dinacom_2024/data/model/get_comment_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ResultState { loading, noData, hasData, error }
class DetailController extends GetxController{

  final PoranService profileService = PoranService();


  TextEditingController bodycontroller = TextEditingController();
  RxString _message = ''.obs;

  Rx<DetailModel> _detailModel =
      DetailModel( status: 200).obs;

  Rx<DetailModel> get detailModel => _detailModel;


  Rx<GetCommentModel> _getcommentModel =
      GetCommentModel( status: 200,responseComment: []).obs;

  Rx<GetCommentModel> get getcommentModel => _getcommentModel;

  RxString get message => _message;

  Rx<ResultState> get state => _state;

  Rx<ResultState> _state = ResultState.loading.obs;

  Rx<ResultState> get states => _state;

  Rx<ResultState> _states = ResultState.loading.obs;
  var one = Get.arguments;


  @override
  void onInit() async{
    super.onInit();
    detail();
    getComment();
  }


  Future<dynamic> detail() async {
    try {
      _state.value = ResultState.loading;


      final profile = await profileService.getdetail(one[0]);

      // print(profile.response.length.toString());

      if (profile.responseDetail!.id == 0) {
        _state.value = ResultState.noData;

        return _message.value = 'Empty Data';
      } else {
        _state.value = ResultState.hasData;

        update();

        return _detailModel.value = profile;
      }
    } catch (e) {
      print(e.runtimeType);
      _state.value = ResultState.error;

      return _message.value = "ada yang salah";
    }
  }

  Future<dynamic> getComment() async {
    try {
      _states.value = ResultState.loading;


      final profile = await profileService.getcomment(one[0]);

      // print(profile.response.length.toString());

      if (profile.responseComment!.isEmpty) {
        _states.value = ResultState.noData;

        return _message.value = 'Empty Data';
      } else {
        _states.value = ResultState.hasData;

        update();

        return _getcommentModel.value = profile;
      }
    } catch (e) {
      print(e.runtimeType);
      _states.value = ResultState.error;

      return _message.value = "ada yang salah";
    }
  }

  Future<bool> createporan(int postid,String body) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');

    final response =
    await http.post(Uri.parse("https://urchin-app-hlgon.ondigitalocean.app/api/secured/comments/$postid"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': '$token',

        },
        body: jsonEncode({
          'body': body,
        }));

    // print(response.body);

    if (response.statusCode == 201) {
      // return PoranAllModel.fromJson(jsonDecode(response.body));



      return true;
    } else {
      throw Exception('ada yang salah');
    }
  }
}