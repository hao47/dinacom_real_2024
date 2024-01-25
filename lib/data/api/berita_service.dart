
import 'dart:convert';
import 'package:dinacom_2024/data/model/berita_model.dart';
import 'package:dinacom_2024/data/model/berita_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BeritaService {
  Future<BeritaModel> getberita() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');

    final response = await http.get(
        Uri.parse(
            "https://newsdata.io/api/1/news?country=id&apikey=pub_37048cadbdccb00464b8275e11aaf8102a131"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': '$token',
        });

    // print(response.body);

    if (response.statusCode == 200) {
      return BeritaModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('ada yang salah');
    }
  }


}