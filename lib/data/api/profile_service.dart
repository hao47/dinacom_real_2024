import 'dart:convert';

import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile.dart';
import 'package:dinacom_2024/data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService{

  Future<ProfileModel> getprofile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');


    final response =
    await http.post(Uri.parse("http://10.0.2.2:8080/api/secured/profile"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': '$token',
        },
        body: jsonEncode({
          'jwt_token': '$token',
        }));

    // print(response.body);


    if (response.statusCode == 200) {
      return ProfileModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('ada yang salah');
    }
  }

}