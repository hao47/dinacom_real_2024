import 'package:dinacom_2024/UI/bottom_navigation/item/poran/widget/poran_list.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/poran/poran_provider.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile_provider.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/enums/status.dart';

class Poran extends StatefulWidget {
  BuildContext? newContext;

  Poran({super.key, this.newContext});

  @override
  State<Poran> createState() => _PoranState();
}

class _PoranState extends State<Poran> with SingleTickerProviderStateMixin {
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
    Get.put(PoranController()).profile();
    Get.put(ProfileController()).profilee();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            toolbarHeight: 100,
            automaticallyImplyLeading: false,
            actions: [
              SizedBox(width: 25),
              Expanded(
                child: GetX<ProfileController>(
                  builder: (controller) {
                    // print(state.categoryResult.response.length);
                    if (controller.state.value == ResultState.loading) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 26,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
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
                          ),
                          SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
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
                                width: 200,
                                height: 12,
                              ),
                              SizedBox(height: 2),
                              Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
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
                                width: 120,
                                height: 18,
                              )
                            ],
                          ),
                        ],
                      );
                    } else if (controller.state.value == ResultState.hasData) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 26,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 24,
                              backgroundImage: NetworkImage(controller
                                  .profileModel
                                  .value
                                  .responseProfile!
                                  .photoProfile),
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Selamat datang kembali!',
                                  style: CommonAppTheme.textTheme(context)
                                      .bodyText1!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 12,
                                          height: 1.2)),
                              Text(
                                  controller.profileModel.value.responseProfile!
                                      .username,
                                  style: CommonAppTheme.textTheme(context)
                                      .headline1!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w100,
                                          fontSize: 18)),
                            ],
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: IconButton(
                                onPressed: () {
                                  Get.toNamed('/notif');
                                },
                                icon: Icon(Icons.notifications_none_rounded,
                                    color: Colors.white, size: 35)),
                          )
                        ],
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
                ),
              )
            ],
          ),
          body: Column(
            children: [
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
                labelStyle:
                    CommonAppTheme.textTheme(context).bodyText1!.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                labelColor: ColorValue.BaseBlack,
                tabs: const [
                  Tab(
                    text: 'Poran Sekitar',
                  ),
                  Tab(
                    text: 'Poran Populer',
                  ),
                ],
              ),
              Expanded(
                  child: TabBarView(
                controller: _controller,
                children: [
                  _selectedIndex == 0
                      ? SingleChildScrollView(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: RefreshIndicator(
                              onRefresh: () async {
                                Get.put(PoranController()).profile();
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GetX<PoranController>(
                                    builder: (controller) {
                                      // print(state.categoryResult.response.length);
                                      if (controller.state.value ==
                                          ResultState.loading) {
                                        return Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.225,
                                          width: double.maxFinite,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: Card(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Center(
                                                child: Shimmer.fromColors(
                                                  baseColor: Colors.grey[300]!,
                                                  highlightColor:
                                                      Colors.grey[100]!,
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
                                        );
                                      } else if (controller.state.value ==
                                          ResultState.hasData) {
                                        if (controller.profileModel.value
                                                .responseAllModel.length !=
                                            0) {
                                          print("masokkkkkkkkkkkkkkkkkkk");
                                          return PoranList(
                                              poranAllModel:
                                                  controller.profileModel.value,
                                              newContext: widget.newContext);

                                          // return Container();
                                        } else {
                                          return Container();
                                        }

                                        // print(controller.profileModel.value.responseAllModel.length);
                                        //
                                        // return Container();
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
                                ],
                              ),
                            ),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GetX<PoranController>(
                                  builder: (controller) {
                                    // print(state.categoryResult.response.length);
                                    if (controller.state.value ==
                                        ResultState.loading) {
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .225,
                                        width: double.maxFinite,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 20),
                                        child: Card(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Center(
                                              child: Shimmer.fromColors(
                                                baseColor: Colors.grey[300]!,
                                                highlightColor:
                                                    Colors.grey[100]!,
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
                                      );
                                    } else if (controller.state.value ==
                                        ResultState.hasData) {
                                      if (controller.profileModel.value
                                              .responseAllModel.length !=
                                          0) {
                                        print("masokkkkkkkkkkkkkkkkkkk");
                                        return PoranList(
                                            poranAllModel:
                                                controller.profileModel.value,
                                            newContext: widget.newContext);

                                        // return Container();
                                      } else {
                                        return Container();
                                      }

                                      // print(controller.profileModel.value.responseAllModel.length);
                                      //
                                      // return Container();
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
                              ],
                            ),
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
                        )
                ],
              )),

            ],
          )),
    );
  }
}
