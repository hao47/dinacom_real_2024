import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:math';
import 'dart:convert';

String generateRandomString(int length) {
  final random = Random();
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  return List.generate(length, (index) => chars[random.nextInt(chars.length)]).join();
}

class ImageUploadService{
  String randomString = generateRandomString(10);
  Future<void> uploadImage(XFile? pickedfile) async{
    try{
      Dio dio = Dio();

      if(pickedfile != null){
        FormData formData = FormData.fromMap({
          'userFile': await MultipartFile.fromFile(pickedfile.path,filename:randomString + ".jpg"),
          'jwt_token':"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImRhZmZhIiwiZW1haWwiOiJkYWZmYXJvYmFuaTU1MUBnbWFpbC5jb20iLCJleHAiOjE3MDU2MTQ0Nzh9.OjGkU2OwenmqVaf0qVm6dIOSoZc-_gOt7w_ToqY2ROo",
          'content':"hawdnawuidnawuidnawuidnawuidawndiuawnduawndianwuidanwudnaiwudnawidnaiwu",
          'ditujukan':"kepada instasi kudus lol"
        }
        );
        //
        dio.options.headers['content-Type'] = 'multipart/form-data';
        dio.options.headers["authorization"] = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImRhZmZhIiwiZW1haWwiOiJkYWZmYXJvYmFuaTU1MUBnbWFpbC5jb20iLCJleHAiOjE3MDU2MTQ0Nzh9.OjGkU2OwenmqVaf0qVm6dIOSoZc-_gOt7w_ToqY2ROo";

        Response response = await dio.post(

            'http://10.0.2.2:8080/api/secured/post',
          data: formData
        );

        print(response.data);
        if(response.statusCode == 200){
          print('succes');
          print(response.data);
        }else{
          print("gagal");
        }
      }else{

      }

    } catch (error){
      print(error);
    }
  }
}