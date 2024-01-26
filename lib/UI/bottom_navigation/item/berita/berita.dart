import 'package:dinacom_2024/UI/bottom_navigation/item/berita/berita_controller.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/berita/widget/berita_card.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/berita/widget/carousel_widget.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/berita/widget/statistik.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/enums/status.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class Berita extends StatefulWidget {
  const Berita({super.key});

  @override
  State<Berita> createState() => _BeritaState();
}

class _BeritaState extends State<Berita> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
        print("SELECTED ITEM : $_selectedIndex");
        print("CONTROLLER INDEX : ${_controller.index}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put(BeritaController()).berita();
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) * .3;
    final double itemWidth = size.width / 2;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 40),
              decoration: BoxDecoration(
                  color: ColorValue.secondaryColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: StatistikChart(),
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            //   child: Text(
            //     'Berita Terkini',
            //     style: CommonAppTheme.textTheme(context)
            //         .headline1!
            //         .copyWith(fontSize: 24),
            //   ),
            //
            // ),

            TabBar(
              controller: _controller,
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              dividerColor: Colors.transparent,
              indicatorPadding: EdgeInsets.only(bottom: 5),
              indicator: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ColorValue.BaseBlue,
                    width: 3,
                  ),
                ),
              ),
              unselectedLabelStyle:
                  CommonAppTheme.textTheme(context).bodyText1!.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
              unselectedLabelColor: ColorValue.LightGrey,
              labelStyle: CommonAppTheme.textTheme(context).bodyText1!.copyWith(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
              labelColor: ColorValue.BaseBlack,
              tabs: const [
                Tab(
                  text: 'Berita',
                ),
                Tab(
                  text: 'Event',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: [
                  _selectedIndex == 0
                      ? GetX<BeritaController>(
                          builder: (controller) {
                            // print(state.categoryResult.response.length);
                            if (controller.state.value == ResultState.loading) {
                              return GridView.count(
                                shrinkWrap: true,
                                padding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 15),
                                physics: NeverScrollableScrollPhysics(),
                                childAspectRatio: (itemWidth / itemHeight),
                                crossAxisCount: 2,
                                children: List.generate(
                                    controller.beritaModel.value.results.length,
                                    (index) => Padding(
                                          padding: EdgeInsets.all(5),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                        )),
                              );
                            } else if (controller.state.value ==
                                ResultState.hasData) {
                              return GridView.count(
                                shrinkWrap: true,
                                padding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 15),
                                physics: NeverScrollableScrollPhysics(),
                                childAspectRatio: (itemWidth / itemHeight),
                                crossAxisCount: 2,
                                children: List.generate(
                                    controller.beritaModel.value.results.length,
                                    (index) => BeritaCard(
                                          result: controller
                                              .beritaModel.value.results[index],
                                        )),
                              );
                            } else if (controller.state.value ==
                                ResultState.noData) {
                              return Center(
                                child: Material(
                                  child: Text("Tidak ada Data"),
                                ),
                              );
                            } else if (controller.state.value ==
                                ResultState.error) {
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
                      : GridView.count(
                          shrinkWrap: true,
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                          physics: NeverScrollableScrollPhysics(),
                          childAspectRatio: (itemWidth / itemHeight),
                          crossAxisCount: 2,
                          children: List.generate(
                              6,
                              (index) => Padding(
                                    padding: EdgeInsets.all(5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
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
                                  )),
                        ),
                  Text("1"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
