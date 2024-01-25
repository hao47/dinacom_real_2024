import 'package:dinacom_2024/UI/bottom_navigation/item/search/search_controller.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/search/widget/poran_list.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/search/widget/short_showmodal.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/enums/status.dart';

class SearchPage extends GetView<SearchPageController> {
  BuildContext? newContext;

  SearchPage({super.key, this.newContext});


  @override
  Widget build(BuildContext context) {
    Get.put(SearchPageController());
    // Get.put(ProfileController());
    return Scaffold(

        appBar: AppBar(
          backgroundColor: ColorValue.LightBlue,
          toolbarHeight: 75,
          automaticallyImplyLeading: false,
          actions: [
            SizedBox(width: 25),
            Expanded(
              child: Container(
                height: 36,
                child: TextFormField(
                  controller: controller.controllersearch,
                  cursorColor: ColorValue.BaseBlue,
                  style: CommonAppTheme.textTheme(context).bodyText1!.copyWith(
                    fontSize: 10,
                    color: ColorValue.BaseBlack,
                  ),
                  onChanged: (value) {
                    print("aaaa");
                    controller.getPoranSearch(value);

                  },
                  decoration: InputDecoration(
                    hintText: 'Cari Laporan ..',
                    hintStyle:
                    CommonAppTheme.textTheme(context).bodyText1!.copyWith(
                      fontSize: 10,
                      color: ColorValue.LightGrey,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Color(0xff666666),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Color(0xff666666),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        width: 2,
                        color: ColorValue.secondaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 15),
            InkWell(
              onTap: (){

                // _controller.isSelectionWithinTextBounds()

                FocusScope.of(context).unfocus();
                // _controller.clear();
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return SortShowmodal();
                  },
                );
              },
              child: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(Icons.settings_input_composite,
                    color: ColorValue.LightBlue, size: 20),
              ),
            ),
            SizedBox(width: 25),
          ],
        ),

        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: GetX<SearchPageController>(
              builder: (controller) {

                print(controller.statep.value);
                if (controller.statep.value == ResultState.loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (controller.statep.value == ResultState.hasData) {


                  return PoranListSearch(searchModel: controller.searchmodel.value);
                } else if (controller.statep.value == ResultState.noData) {
                  return Center(
                    child: Material(
                      child: Text("Tidak ada Data"),
                    ),
                  );
                } else if (controller.statep.value == ResultState.error) {
                  return Center(
                    child: Material(
                      child: Text("Ada yang salah"),
                    ),
                  );
                } else {
                  return const Center(
                    child: Material(
                      child: Text(''),
                    ),
                  );
                }


              },
            ),
          ),
        ));
  }
}
