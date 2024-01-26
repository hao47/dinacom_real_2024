import 'dart:convert';
import 'dart:math';
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile.dart';
import 'package:dinacom_2024/data/api/like_service.dart';
import 'package:dinacom_2024/data/api/poran_service.dart';
import 'package:dinacom_2024/data/api/profile_service.dart';
import 'package:dinacom_2024/data/model/check_like_model.dart';
import 'package:dinacom_2024/data/model/detail_model.dart';
import 'package:dinacom_2024/data/model/get_comment_model.dart';
import 'package:dinacom_2024/data/model/get_comment_model.dart';
import 'package:dinacom_2024/data/model/get_comment_model.dart';
import 'package:dinacom_2024/data/model/get_like_model.dart';
import 'package:dinacom_2024/data/model/poran_all_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:dinacom_2024/constants/url_routes.dart';
import 'package:dinacom_2024/data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import '../../../../common/enums/status.dart';


String generateRandomString(int length) {
  final random = Random();
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  return List.generate(length, (index) => chars[random.nextInt(chars.length)])
      .join();
}

class PoranController extends GetxController {
  final PoranService profileService = PoranService();

  Rx<ResultState> _state = ResultState.loading.obs;
  RxString _message = ''.obs;

  Rx<PoranAllModel> _profileModel =
      PoranAllModel(responseAllModel: [], status: 0).obs;

  Rx<PoranAllModel> get profileModel => _profileModel;

  RxString get message => _message;

  // final LikeService likeService = LikeService();
  // final ValueNotifier<bool> isLoad = ValueNotifier<bool>(false);

  // late ResultState _state;
  // String _message = '';
  // String instasi = 'Instasi Kudus';

  // setinstasi(String value){
  //   instasi = value;
  //   notifyListeners();
  // }


  @override
  void onInit() async {
    super.onInit();
    profile();
  }

  //
  //
  // PoranAllModel _profileModel = PoranAllModel(response: [], status: 200);
  // GetLikeModel _likeModel = GetLikeModel(status: 0);
  // DetailModel _detailModel = DetailModel(status: 0);
  // PoranAllModel get categoryResult => _profileModel;
  // GetLikeModel get likeModel => _likeModel;
  // DetailModel get detailModel => _detailModel;
  //
  // GetCommentModel _commentModel = GetCommentModel(status: 0);
  // GetCommentModel get commentModel => _commentModel;
  //
  Rx<ResultState> get state => _state;

  //
  // int count = 0;
  //
  // // PoranProvider(){
  // //   profile();
  // // }
  //
  //

  Future<dynamic> profile() async {
    try {
      _state.value = ResultState.loading;

      final profile = await profileService.getporan();

      print(profile.responseAllModel.length.toString());

      if (profile.responseAllModel.isEmpty) {
        _state.value = ResultState.noData;

        return _message.value = 'Empty Data';
      } else {
        _state.value = ResultState.hasData;

        update();

        return _profileModel.value = profile;
      }
    } catch (e) {
      print(e);
      _state.value = ResultState.error;

      return _message.value = "ada yang salah";
    }
  }

// Future<dynamic> detail(int id) async {
//   //
//
//   try {
//     _state = ResultState.loading;
//     notifyListeners();
//     final profile = await profileService.getdetail(id);
//     if (profile.responseDetail!.id == 0) {
//       _state = ResultState.noData;
//       notifyListeners();
//       return _message = 'Empty Data';
//     } else {
//       // print(profile.response.length);
//
//       _state = ResultState.hasData;
//       notifyListeners();
//       return _detailModel = profile;
//     }
//   } catch (e) {
//     print(e.runtimeType);
//     _state = ResultState.error;
//     notifyListeners();
//     return _message = "ada yang salah";
//   }
// }
// Future<dynamic> getComment(int id) async {
//   // notifyListeners();
//
//   try {
//     _state = ResultState.loading;
//     notifyListeners();
//     final profile = await profileService.getcomment(id);
//     if (profile.responseComment!.isEmpty) {
//       _state = ResultState.noData;
//       notifyListeners();
//       return _message = 'Empty Data';
//     } else {
//       // print(profile.response.length);
//
//       _state = ResultState.hasData;
//       notifyListeners();
//       return _commentModel = profile;
//     }
//   } catch (e) {
//     print(e.runtimeType);
//     _state = ResultState.error;
//     notifyListeners();
//     return _message = "ada yang salah";
//   }
// }
//
//
// addcounter(int counte) {
//   count = counte + 1;
//
//   notifyListeners();
// }
//
// resetcounter(int counte) {
//   count = counte--;
//   notifyListeners();
// }
//


  Rx<GetLikeModel> _likeModel =
      GetLikeModel( status: 0).obs;

  Rx<GetLikeModel> get likeModel => _likeModel;


  RxInt likenumber = 0.obs;


Future<bool> like(BuildContext context, int id, int uslike) async {
  // notifyListeners();

  print("adwawd");

  SharedPreferences pref = await SharedPreferences.getInstance();
  String? token = pref.getString('token');

  final response = await http.post(
      Uri.parse("https://urchin-app-hlgon.ondigitalocean.app/api/secured/likes/$id/$uslike"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': '$token',
      });

  if (response.statusCode == 200) {
    var responses = jsonDecode(response.body);
    _likeModel.value = GetLikeModel.fromJson(responses);

    return true;

    // Provider.of<PoranProvider>(context, listen: false).profile();
  } else {
    throw Exception('ada yang salah');

  }
}
//
  Future<bool> dislike(BuildContext context,int postid) async {
  // notifyListeners();

  // print(id);

  SharedPreferences pref = await SharedPreferences.getInstance();
  String? token = pref.getString('token');

  final response = await http.delete(
      Uri.parse("https://urchin-app-hlgon.ondigitalocean.app/api/secured/likes/$postid"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': '$token',
      });

  if (response.statusCode == 200) {
    print("halok dek");
    return true;

    // Provider.of<PoranProvider>(context, listen: false).profile();
  } else {
    throw Exception('ada yang salah');
  }
}
//
// CheckLikeModel a = CheckLikeModel(exist: false, responseLike: [], status: 0);
//
//
// bool check  = false;
//
// setlike(){
//   check = false;
//   notifyListeners();
// }
// unlike(){
//   check = true;
//   notifyListeners();
// }
  Rx<CheckLikeModel> _checkModel =
      CheckLikeModel(responseLike: [], status: 0,exist: false).obs;

  Rx<CheckLikeModel> get checkModel => _checkModel;

Future<CheckLikeModel>checklike(int post_id) async{
  try {

    final profile = await profileService.checklike(post_id);


    if (profile.responseLike.isEmpty) {

      return _checkModel.value =   CheckLikeModel(responseLike: [], status: 0,exist: false);
    } else {


      return _checkModel.value = profile;
    }
  } catch (e) {

    throw Exception('ada yang salah');
  }
}
// //
// String randomString = generateRandomString(10);
// //
// Future<void> uploadImage(XFile? pickedfile,String text) async {
//   try {
//
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     String? token = pref.getString('token');
//     Dio dio = Dio();
//
//     if (pickedfile != null) {
//       FormData formData = FormData.fromMap({
//         'userFile': await MultipartFile.fromFile(pickedfile.path,
//             filename: randomString + ".jpg"),
//         'content': text,
//         'ditujukan': "kepada $instasi"
//       });
//       //
//       dio.options.headers['content-Type'] = 'multipart/form-data';
//       dio.options.headers["authorization"] = token;
//       var response = await dio.post('http://10.0.2.2:8080/api/secured/posts',
//           data: formData);
//
//       // print(response.data);
//       if (response.statusCode == 201) {
//         profile();
//         print(response.data);
//         // notifyListeners();
//       } else {
//         print("gagal");
//       }
//     } else {}
//   } catch (error) {
//     print(error);
//   }
// }

  deleteporan(int id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');

    final response = await http.delete(
        Uri.parse("https://urchin-app-hlgon.ondigitalocean.app/api/secured/posts/$id"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': '$token',
        });

    // print(response.body);

    if (response.statusCode == 200) {
      print("berhasil hapus");
    } else {
      throw Exception('ada yang salah');
    }
  }
}
