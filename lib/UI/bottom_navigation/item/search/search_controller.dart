



import 'package:dinacom_2024/UI/detail/detail_controller.dart';
import 'package:dinacom_2024/data/api/profile_service.dart';
import 'package:dinacom_2024/data/model/search_model.dart';
import 'package:dinacom_2024/data/model/search_model.dart';
import 'package:dinacom_2024/data/model/search_model.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController {

  final ProfileService profileService = ProfileService();

  Rx<ResultState> _state = ResultState.loading.obs;
  RxString _message = ''.obs;

  Rx<SearchModel> _searchModel =
      SearchModel( posts: []).obs;

  Rx<SearchModel> get searchModel => _searchModel;

  RxString get message => _message;


  Rx<ResultState> get state => _state;



  @override
  void onInit() async {
    super.onInit();
    getporansearch("mirza");
  }








  Future<dynamic> getporansearch(String q) async {
    try {
      _state.value = ResultState.loading;


      final profile = await profileService.getporansearch("mirza");

      // print(profile.response.length.toString());

      if (profile.posts.isEmpty) {
        _state.value = ResultState.noData;

        return _message.value = 'Empty Data';
      } else {
        _state.value = ResultState.hasData;

        // update();

        return _searchModel.value = profile;
      }
    } catch (e) {
      print(e.runtimeType);
      _state.value = ResultState.error;

      return _message.value = "ada yang salah";
    }
  }

}
