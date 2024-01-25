import 'dart:convert';

import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile.dart';
import 'package:dinacom_2024/data/model/like_all_model.dart';
import 'package:dinacom_2024/data/model/poran_all_model.dart';
import 'package:dinacom_2024/data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LikeService {
  Future<GetLikeModel> getlike(int id,int uslike) async {

    print("ini id" + id.toString());
    print("ini id user" + uslike.toString());
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');

    final response = await http.post(
        Uri.parse("https://urchin-app-hlgon.ondigitalocean.app/api/secured/likes/$id/$uslike"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': '$token',
        });


    if (response.statusCode == 200) {

      print("halok dek");
      return GetLikeModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('ada yang salah');
    }
  }
}
