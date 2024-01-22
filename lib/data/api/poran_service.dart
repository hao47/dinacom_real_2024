import 'dart:convert';

import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile.dart';
import 'package:dinacom_2024/data/model/detail_model.dart';
import 'package:dinacom_2024/data/model/detail_model.dart';
import 'package:dinacom_2024/data/model/get_comment_model.dart';
import 'package:dinacom_2024/data/model/get_comment_model.dart';
import 'package:dinacom_2024/data/model/poran_all_model.dart';
import 'package:dinacom_2024/data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PoranService {
  Future<PoranAllModel> getporan() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');

    final response = await http.get(
        Uri.parse("http://10.0.2.2:8080/api/secured/posts"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': '$token',
        });

    // print(response.body);

    if (response.statusCode == 200) {
      return PoranAllModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('ada yang salah');
    }
  }

  Future<DetailModel> getdetail(int id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');

    final response = await http.get(
        Uri.parse("http://10.0.2.2:8080/api/secured/posts/$id"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': '$token',
        });

    // print(response.body);

    if (response.statusCode == 200) {
      return DetailModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('ada yang salah');
    }
  }



  Future<GetCommentModel> getcomment(int id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');

    final response = await http.get(
        Uri.parse("http://10.0.2.2:8080/api/secured/comments/$id"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': '$token',
        });

    // print(response.body);

    if (response.statusCode == 200) {
      return GetCommentModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('ada yang salah');
    }
  }
  Future<PoranAllModel> deleteporan() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');

    final response = await http.get(
        Uri.parse("http://10.0.2.2:8080/api/secured/posts"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': '$token',
        });

    // print(response.body);

    if (response.statusCode == 200) {
      return PoranAllModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('ada yang salah');
    }
  }
}
