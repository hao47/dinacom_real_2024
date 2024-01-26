import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class KelolaPage extends StatefulWidget {
  const KelolaPage({super.key});

  @override
  State<KelolaPage> createState() => _KelolaPageState();
}

class _KelolaPageState extends State<KelolaPage> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);

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
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: ColorValue.LightBlue,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Kelola",
          style: textTheme.headline1!
              .copyWith(fontSize: 20, height: 1.5, color: Colors.white),
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              controller: _controller,
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              indicatorPadding: const EdgeInsets.only(bottom: 10),
              dividerColor: Colors.transparent,
              indicator: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ColorValue.BaseBlue,
                    width: 3,
                  ),
                ),
              ),
              unselectedLabelStyle: CommonAppTheme.textTheme(context)
                  .bodyText1!
                  .copyWith(
                fontWeight: FontWeight.w900,
                fontSize: 16,
              ),
              unselectedLabelColor: ColorValue.LightGrey,
              labelStyle: CommonAppTheme.textTheme(context)
                  .bodyText1!
                  .copyWith(
                fontWeight: FontWeight.w900,
                fontSize: 16,
              ),
              labelColor: ColorValue.BaseBlack,
              tabs: const [
                Tab(
                  child: Text('Antrian', style: TextStyle(fontSize: 14)),
                ),
                Tab(
                  child: Text('Tindak Lanjut', style: TextStyle(fontSize: 14)),
                ),
                Tab(
                  child: Text('Selesai', style: TextStyle(fontSize: 14)),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  controller: _controller,
                  children: [
                    _selectedIndex == 0
                        ? SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        // child: RefreshIndicator(
                        //   onRefresh: () async {
                        //     Get.put(PoranController()).profile();
                        //   },
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       GetX<PoranController>(
                        //         builder: (controller) {
                        //           // print(state.categoryResult.response.length);
                        //           if (controller.state.value ==
                        //               ResultState.loading) {
                        //             return Container(
                        //               height: MediaQuery.of(context)
                        //                   .size
                        //                   .height *
                        //                   0.225,
                        //               width: double.maxFinite,
                        //               margin: EdgeInsets.symmetric(
                        //                   vertical: 20),
                        //               child: Card(
                        //                 child: ClipRRect(
                        //                   borderRadius:
                        //                   BorderRadius.circular(10.0),
                        //                   child: Center(
                        //                     child: Shimmer.fromColors(
                        //                       baseColor: Colors.grey[300]!,
                        //                       highlightColor:
                        //                       Colors.grey[100]!,
                        //                       child: Container(
                        //                         height: double.maxFinite,
                        //                         width: double.maxFinite,
                        //                         color: Colors.blue,
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ),
                        //                 shape: RoundedRectangleBorder(
                        //                   borderRadius:
                        //                   BorderRadius.circular(10.0),
                        //                 ),
                        //               ),
                        //             );
                        //           } else if (controller.state.value ==
                        //               ResultState.hasData) {
                        //             if (controller.profileModel.value
                        //                 .responseAllModel.length !=
                        //                 0) {
                        //               print("masokkkkkkkkkkkkkkkkkkk");
                        //               return PoranList(
                        //                   poranAllModel:
                        //                   controller.profileModel.value,
                        //                   newContext: widget.newContext);
                        //
                        //               // return Container();
                        //             } else {
                        //               return Container();
                        //             }
                        //
                        //             // print(controller.profileModel.value.responseAllModel.length);
                        //             //
                        //             // return Container();
                        //           } else if (controller.state.value ==
                        //               ResultState.noData) {
                        //             return Center(
                        //               child: Material(
                        //                 child: Text("Tidak ada Data"),
                        //               ),
                        //             );
                        //           } else if (controller.state.value ==
                        //               ResultState.error) {
                        //             return Center(
                        //               child: Material(
                        //                 child: Text("Ada yang salah"),
                        //               ),
                        //             );
                        //           } else {
                        //             return const Center(
                        //               child: Material(
                        //                 child: Text(''),
                        //               ),
                        //             );
                        //           }
                        //         },
                        //       )
                        //     ],
                        //   ),
                        // ),
                      ),
                    )
                        : SingleChildScrollView(
                      child: Container(
                        height:
                        MediaQuery.of(context).size.height *
                            .225,
                        width: double.maxFinite,
                        margin:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        child: Card(
                          child: ClipRRect(
                            borderRadius:
                            BorderRadius.circular(10.0),
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
                            borderRadius:
                            BorderRadius.circular(10.0),
                          ),
                        ),
                      ),

                    ),
                    _selectedIndex == 1
                        ? SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        // child: RefreshIndicator(
                        //   onRefresh: () async {
                        //     Get.put(PoranController()).profile();
                        //   },
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       GetX<PoranController>(
                        //         builder: (controller) {
                        //           // print(state.categoryResult.response.length);
                        //           if (controller.state.value ==
                        //               ResultState.loading) {
                        //             return Container(
                        //               height: MediaQuery.of(context)
                        //                   .size
                        //                   .height *
                        //                   0.225,
                        //               width: double.maxFinite,
                        //               margin: EdgeInsets.symmetric(
                        //                   vertical: 20),
                        //               child: Card(
                        //                 child: ClipRRect(
                        //                   borderRadius:
                        //                   BorderRadius.circular(10.0),
                        //                   child: Center(
                        //                     child: Shimmer.fromColors(
                        //                       baseColor: Colors.grey[300]!,
                        //                       highlightColor:
                        //                       Colors.grey[100]!,
                        //                       child: Container(
                        //                         height: double.maxFinite,
                        //                         width: double.maxFinite,
                        //                         color: Colors.blue,
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ),
                        //                 shape: RoundedRectangleBorder(
                        //                   borderRadius:
                        //                   BorderRadius.circular(10.0),
                        //                 ),
                        //               ),
                        //             );
                        //           } else if (controller.state.value ==
                        //               ResultState.hasData) {
                        //             if (controller.profileModel.value
                        //                 .responseAllModel.length !=
                        //                 0) {
                        //               print("masokkkkkkkkkkkkkkkkkkk");
                        //               return PoranList(
                        //                   poranAllModel:
                        //                   controller.profileModel.value,
                        //                   newContext: widget.newContext);
                        //
                        //               // return Container();
                        //             } else {
                        //               return Container();
                        //             }
                        //
                        //             // print(controller.profileModel.value.responseAllModel.length);
                        //             //
                        //             // return Container();
                        //           } else if (controller.state.value ==
                        //               ResultState.noData) {
                        //             return Center(
                        //               child: Material(
                        //                 child: Text("Tidak ada Data"),
                        //               ),
                        //             );
                        //           } else if (controller.state.value ==
                        //               ResultState.error) {
                        //             return Center(
                        //               child: Material(
                        //                 child: Text("Ada yang salah"),
                        //               ),
                        //             );
                        //           } else {
                        //             return const Center(
                        //               child: Material(
                        //                 child: Text(''),
                        //               ),
                        //             );
                        //           }
                        //         },
                        //       )
                        //     ],
                        //   ),
                        // ),
                      ),
                    )
                        : SingleChildScrollView(
                      child: Container(
                        height:
                        MediaQuery.of(context).size.height *
                            .225,
                        width: double.maxFinite,
                        margin:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        child: Card(
                          child: ClipRRect(
                            borderRadius:
                            BorderRadius.circular(10.0),
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
                            borderRadius:
                            BorderRadius.circular(10.0),
                          ),
                        ),
                      ),

                    ),
                    _selectedIndex == 2
                        ? SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        // child: RefreshIndicator(
                        //   onRefresh: () async {
                        //     Get.put(PoranController()).profile();
                        //   },
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       GetX<PoranController>(
                        //         builder: (controller) {
                        //           // print(state.categoryResult.response.length);
                        //           if (controller.state.value ==
                        //               ResultState.loading) {
                        //             return Container(
                        //               height: MediaQuery.of(context)
                        //                   .size
                        //                   .height *
                        //                   0.225,
                        //               width: double.maxFinite,
                        //               margin: EdgeInsets.symmetric(
                        //                   vertical: 20),
                        //               child: Card(
                        //                 child: ClipRRect(
                        //                   borderRadius:
                        //                   BorderRadius.circular(10.0),
                        //                   child: Center(
                        //                     child: Shimmer.fromColors(
                        //                       baseColor: Colors.grey[300]!,
                        //                       highlightColor:
                        //                       Colors.grey[100]!,
                        //                       child: Container(
                        //                         height: double.maxFinite,
                        //                         width: double.maxFinite,
                        //                         color: Colors.blue,
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ),
                        //                 shape: RoundedRectangleBorder(
                        //                   borderRadius:
                        //                   BorderRadius.circular(10.0),
                        //                 ),
                        //               ),
                        //             );
                        //           } else if (controller.state.value ==
                        //               ResultState.hasData) {
                        //             if (controller.profileModel.value
                        //                 .responseAllModel.length !=
                        //                 0) {
                        //               print("masokkkkkkkkkkkkkkkkkkk");
                        //               return PoranList(
                        //                   poranAllModel:
                        //                   controller.profileModel.value,
                        //                   newContext: widget.newContext);
                        //
                        //               // return Container();
                        //             } else {
                        //               return Container();
                        //             }
                        //
                        //             // print(controller.profileModel.value.responseAllModel.length);
                        //             //
                        //             // return Container();
                        //           } else if (controller.state.value ==
                        //               ResultState.noData) {
                        //             return Center(
                        //               child: Material(
                        //                 child: Text("Tidak ada Data"),
                        //               ),
                        //             );
                        //           } else if (controller.state.value ==
                        //               ResultState.error) {
                        //             return Center(
                        //               child: Material(
                        //                 child: Text("Ada yang salah"),
                        //               ),
                        //             );
                        //           } else {
                        //             return const Center(
                        //               child: Material(
                        //                 child: Text(''),
                        //               ),
                        //             );
                        //           }
                        //         },
                        //       )
                        //     ],
                        //   ),
                        // ),
                      ),
                    )
                        : SingleChildScrollView(
                      child: Container(
                        height:
                        MediaQuery.of(context).size.height *
                            .225,
                        width: double.maxFinite,
                        margin:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        child: Card(
                          child: ClipRRect(
                            borderRadius:
                            BorderRadius.circular(10.0),
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
                            borderRadius:
                            BorderRadius.circular(10.0),
                          ),
                        ),
                      ),

                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
