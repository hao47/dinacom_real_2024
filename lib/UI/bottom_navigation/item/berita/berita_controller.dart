import 'package:dinacom_2024/common/enums/status.dart';
import 'package:dinacom_2024/data/api/berita_service.dart';
import 'package:dinacom_2024/data/api/berita_service.dart';
import 'package:dinacom_2024/data/model/berita_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BeritaController extends GetxController{

  final BeritaService beritaService = BeritaService();

  Rx<ResultState> _state = ResultState.loading.obs;

  RxString _message = ''.obs;
  RxString get message => _message;

  Rx<BeritaModel> _beritaModel = BeritaModel(status: "", totalResults: 0, results: [], nextPage: "").obs;

  Rx<BeritaModel> get beritaModel => _beritaModel;


   Rx<ResultState> get state => _state;


  @override
  void onInit() async {
    super.onInit();
    berita();
  }


  Future<dynamic> berita() async {
    try {
      _state.value = ResultState.loading;

      final profile = await beritaService.getberita();

      print(profile.results.length.toString());

      if (profile.results.isEmpty) {
        _state.value = ResultState.noData;

        return _message.value = 'Empty Data';
      } else {
        _state.value = ResultState.hasData;

        // update();

        return _beritaModel.value = profile;
      }
    } catch (e) {
      print(e.runtimeType);
      _state.value = ResultState.error;

      return _message.value = "ada yang salah";
    }
  }

  // Future<dynamic> berita() async {
  //
  //
  //   // try {
  //     _state.value = ResultState.loading;
  //
  //     final berita = await beritaService.getberita();
  //
  //
  //
  //     if (berita.results.isEmpty) {
  //       _state.value = ResultState.noData;
  //
  //       return _message.value = 'Empty Data';
  //     } else {
  //       _state.value = ResultState.hasData;
  //
  //       // update();
  //
  //       return _beritaModel.value = berita;
  //     }
  //   // } catch (e) {
  //   //   print(e);
  //   //
  //   //   _state.value = ResultState.error;
  //   //
  //   //   return _message.value = "ada yang salah";
  //   // }
  // }




}