import 'dart:convert';

import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile.dart';
import 'package:dinacom_2024/data/model/poran_all_model.dart';
import 'package:dinacom_2024/data/model/poran_all_model.dart';
import 'package:dinacom_2024/data/model/poran_profile_model.dart';
import 'package:dinacom_2024/data/model/poran_profile_model.dart';
import 'package:dinacom_2024/data/model/profile_model.dart';
import 'package:dinacom_2024/data/model/search_model.dart';
import 'package:dinacom_2024/data/model/search_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService{

  Future<ProfileModel> getprofile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');


    final response =
    await http.get(Uri.parse("http://10.0.2.2:8080/api/secured/profile"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': '$token',
        },
       );

    // print(response.body);


    if (response.statusCode == 200) {
      return ProfileModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('ada yang salah');
    }
  }

  Future<ProfileModel> getprofilebyid(int id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');


    final response =
    await http.get(Uri.parse("http://10.0.2.2:8080/api/secured/profile/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
    );

    // print(response.body);


    if (response.statusCode == 200) {
      return ProfileModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('ada yang salah');
    }
  }

  Future<PoranProfileModel> getporanprofile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');


    final response =
    await http.get(Uri.parse("http://10.0.2.2:8080/api/secured/user_posts"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
    );

    // print(response.body);


    if (response.statusCode == 200) {
      return PoranProfileModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('ada yang salah');
    }
  }

  Future<SearchModel> getporansearch(String q) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');


    final response =
    await http.get(Uri.parse("http://10.0.2.2:8080/api/secured/search?content=$q"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
    );

    // print(response.body);


    if (response.statusCode == 200) {
      return SearchModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('ada yang salah');
    }
  }

}