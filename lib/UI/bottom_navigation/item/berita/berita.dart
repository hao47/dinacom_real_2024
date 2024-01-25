import 'package:dinacom_2024/UI/bottom_navigation/item/berita/berita_controller.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/berita/widget/berita_card.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/berita/widget/carousel_widget.dart';
import 'package:dinacom_2024/common/enums/status.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class Berita extends StatelessWidget {
  const Berita({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(BeritaController());
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) * .3;
    final double itemWidth = size.width / 2;

    return
      Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [

              Container(

                padding: EdgeInsets.symmetric(vertical: 40),
                decoration: BoxDecoration(

                    color: ColorValue.secondaryColor,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
                ),
                child: CarouselWidget(),
              ),




              GetX<BeritaController>(
                builder: (controller) {
                  // print(state.categoryResult.response.length);
                  if (controller.state.value == ResultState.loading) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.275,
                      width: double.maxFinite,
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Card(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Center(
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: double.maxFinite,
                                width: double.maxFinite,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    );
                  } else if (controller.state.value == ResultState.hasData) {


                    return        GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      childAspectRatio: (itemWidth / itemHeight),
                      crossAxisCount: 2,
                      children: List.generate(
                          controller.beritaModel.value.results.length,
                              (index) => BeritaCard(result: controller.beritaModel.value.results[index],)
                      ),
                    );


                  } else if (controller.state.value == ResultState.noData) {
                    return Center(
                      child: Material(
                        child: Text("Tidak ada Data"),
                      ),
                    );
                  } else if (controller.state.value == ResultState.error) {
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
              )











            ],
          ),
        ),
      );
  }
}
