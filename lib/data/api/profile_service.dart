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


    print("token awalaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

    final response =
    await http.get(Uri.parse("https://urchin-app-hlgon.ondigitalocean.app/api/secured/profile"),
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
    await http.get(Uri.parse("https://urchin-app-hlgon.ondigitalocean.app/api/secured/profile/$id"),
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
    await http.get(Uri.parse("https://urchin-app-hlgon.ondigitalocean.app/api/secured/user_posts"),
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

  Future<PoranProfileModel> getporanpuser(int id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');


    final response =
    await http.get(Uri.parse("https://urchin-app-hlgon.ondigitalocean.app/api/secured/user_posts/$id"),
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
  Future<PoranProfileModel> getporanlike() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');


    final response =
    await http.get(Uri.parse("https://urchin-app-hlgon.ondigitalocean.app/api/secured/user_posts"),
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


    print("dari api" + q);

    final response =
    await http.get(Uri.parse("https://urchin-app-hlgon.ondigitalocean.app/api/secured/search?content=$q"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
    );

    // print(response.body);


    if (response.statusCode == 200) {

      
      // print(response.body)

      print("ada hasil hasilhasilhasilhasilhasilhasilhasilhasilhasilhasil");

      return SearchModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('ada yang salah');
    }
  }

}