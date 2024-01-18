import 'dart:io';
import 'package:dinacom_2024/UI/bottom_navigation/item/poran/poran_provider.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:math';
import 'package:permission_handler/permission_handler.dart';

import 'dart:convert';

// String generateRandomString(int length) {
//   final random = Random();
//   const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
//   return List.generate(length, (index) => chars[random.nextInt(chars.length)]).join();
// }
//
// class ImageUploadService{
//   String randomString = generateRandomString(10);
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
//           PoranProvider();
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
// }