import 'dart:io';
import 'package:dinacom_2024/UI/bottom_navigation/item/poran/poran_provider.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:math';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

String generateRandomString(int length) {
  final random = Random();
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  return List.generate(length, (index) => chars[random.nextInt(chars.length)]).join();
}

class ImageUploadService{


  String randomString = generateRandomString(10);
  Future<void> uploadImage(XFile? pickedfile,BuildContext context,String content,String judul,String alamat) async {


    try {

      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('token');



      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://urchin-app-hlgon.ondigitalocean.app/api/secured/posts'),
      );

      request.headers['Content-Type'] = 'multipart/form-data';
      request.headers['Authorization'] = token!;

      if( pickedfile != null){
        request.files.add(await http.MultipartFile.fromPath(
          'userFile',
          pickedfile.path,
          filename: randomString + ".jpg",
        ));
      }


      request.fields['content'] = content;
      request.fields['ditujukan'] = alamat;
      request.fields['title'] = judul;

      final response = await request.send();

      String responseBody = await response.stream.bytesToString();
      print("Response Body: $responseBody");

      if (response.statusCode == 201 || response.statusCode == 400) {

        showCustom(context);

        Get.put(PoranController()). profile();
      } else {


        throw Exception('ada yang salah');
      }

    } catch (error) {
      print(error);
    }



  }

  showCustom(BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: ColorValue.LightGrey,
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            Icons.check,
            color: Colors.white,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Berhasil diunggah',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
    fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 3),
      gravity: ToastGravity.BOTTOM,
    );
  }



//   Future<void> uploadImage(XFile? pickedfile) async{
//     try{
//       Dio dio = Dio();
//
//       if(pickedfile != null){
//         FormData formData = FormData.fromMap({
//           'userFile': await MultipartFile.fromFile(pickedfile.path,filename:randomString + ".jpg"),
//            'content':"hawdnawuidnawuidnawuidnawuidawndiuawnduawndianwuidanwudnaiwudnawidnaiwu",
//           'ditujukan':"kepada instasi kudus lol"
//         }
//         );
//         //
//         dio.options.headers['content-Type'] = 'multipart/form-data';
//         dio.options.headers["authorization"] = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImRhZmZhIiwiZW1haWwiOiJkYWZmYXJvYmFuaTU1MUBnbWFpbC5jb20iLCJpZCI6MSwiZXhwIjoxNzA1NjYxOTU0fQ.aamqFwyjMlqiTpl8OC72N0axTw07rh6RBmxsKukcHDs";
//
//         Response response = await dio.post(
//
//             'http://10.0.2.2:8080/api/secured/posts',
//           data: formData
//         );
//
//         // print(response.data);
//         if(response.statusCode == 201){
//
//           print(response.data);
//         }else{
//           print("gagal");
//         }
//       }else{
//
//       }
//
//     } catch (error){
//       print(error);
//     }
//   }
}