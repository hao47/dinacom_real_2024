import 'package:dinacom_2024/UI/bottom_navigation/item/profile/wdiget/profile_biodata.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/wdiget/profile_biodata_instansi.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/wdiget/profile_poran_list.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/wdiget/profileporan.dart';

import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';

import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile_provider.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/enums/status.dart';

class Profile extends GetView<ProfileController> {
  // void didChangeDependencies() {

  // final ProfileController controller =);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController()).profilee();
    Get.put(ProfileController()).getporanprofile();
    final textTheme = Theme.of(context).textTheme;
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(

          body: RefreshIndicator(
            onRefresh: () async {
              Get.put(ProfileController()).profilee();
              Get.put(ProfileController()).getporanprofile();
            },
            child: SafeArea(
              child: Column(
                children: [
                  GetX<ProfileController>(
                    builder: (controller) {
                      // print(state.categoryResult.response.length);
                      if (controller.state.value == ResultState.loading) {

                        if(controller.profileModel.value.responseProfile!.role == "Masyarakat"){

                          return Container(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
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
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 20,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
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
                                    const SizedBox(height: 3),
                                    Container(
                                      width: 120,
                                      height: 10,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(3),
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
                                    const SizedBox(height: 10),
                                    Container(
                                      width: 220,
                                      height: 10,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(3),
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
                                  ],
                                )
                              ],
                            ),
                          );

                        } else{

                          return ProfileBioDataAsInstansi(profileModel: controller.profileModel.value,);

                        }
                      } else if (controller.state.value == ResultState.hasData) {
                        // print("ada data");

                        // return Container();
                        // return Text("halo");


                        if(controller.profileModel.value.responseProfile!.role == "Masyarakat"){

                          return ProfileBioData(
                              profileModel: controller.profileModel.value);

                        } else{

                          return ProfileBioDataAsInstansi(profileModel: controller.profileModel.value,);

                        }
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

                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          TabBar(
                            padding: const EdgeInsets.only(top: 10, bottom: 5),
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
                                text: 'Poran',
                              ),
                              Tab(
                                text: 'Like',
                              ),
                            ],
                          ),
                          Expanded(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: GetBuilder<ProfileController>(
                                builder: (controller) {
                                  // print(state.categoryResult.response.length);
                                  if (controller.statep.value ==
                                      ResultState.loading) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (controller.statep.value ==
                                      ResultState.hasData) {
                                    // print("ada data");

                                    // print(controller.poranModel.value.response[0].gambar);

                                    // return Container();
                                    // return Text("halo");
                                    return TabBarView(
                                      children: [
                                        // ProfilePoranList(poranAllModel: controller.poranModel.value,),
                                        // ProfilePoranList(poranAllModel: controller.poranModel.value,),
                                        // Text(controller.poranModel.value.responseAllModel[0].gambar),
                                        // Text(controller.poranModel.value.response.length.toString()),
                                        // // Text("haLO"),

                                        Container(
                                          margin: EdgeInsets.symmetric(horizontal: 20),
                                          child: ProfilePoranList(
                                            poranAllModel:
                                                controller.poranModel.value,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(horizontal: 20),
                                          child: ProfilePoranList(
                                            poranAllModel:
                                            controller.poranModel.value,
                                          ),
                                        ),

                                      ],
                                    );
                                  } else if (controller.statep.value ==
                                      ResultState.noData) {
                                    return Center(
                                      child: Material(
                                        child: Text("Tidak ada Data"),
                                      ),
                                    );
                                  } else if (controller.statep.value ==
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
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )

                  //

                  // Consumer<ProfileProvider>(
                  //   builder: (context, state, _) {
                  //     if (controller.state.value == ResultState.loading) {
                  //       return Text("");
                  //     } else if (state.state == ResultState.hasData) {
                  //       return Expanded(
                  //         child: DefaultTabController(
                  //           length: 2,
                  //           child: Column(
                  //             children: [
                  //               TabBar(
                  //                 padding: const EdgeInsets.only(
                  //                     top: 10, bottom: 5),
                  //                 dividerColor: Colors.transparent,
                  //                 indicator: const BoxDecoration(
                  //                   border: Border(
                  //                     bottom: BorderSide(
                  //                       color: ColorValue.BaseBlue,
                  //                       width: 3,
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 unselectedLabelStyle: CommonAppTheme
                  //                     .textTheme(context)
                  //                     .bodyText1!
                  //                     .copyWith(
                  //                   fontWeight: FontWeight.w900,
                  //                   fontSize: 16,
                  //                 ),
                  //                 unselectedLabelColor: ColorValue.LightGrey,
                  //                 labelStyle: CommonAppTheme
                  //                     .textTheme(context)
                  //                     .bodyText1!
                  //                     .copyWith(
                  //                   fontWeight: FontWeight.w900,
                  //                   fontSize: 16,
                  //                 ),
                  //                 labelColor: ColorValue.BaseBlack,
                  //                 tabs: const [
                  //                   Tab(
                  //                     text: 'Poran',
                  //                   ),
                  //                   Tab(
                  //                     text: 'Repost',
                  //                   ),
                  //                 ],
                  //               ),
                  //               Expanded(
                  //                 child: SizedBox(
                  //                   height: MediaQuery
                  //                       .of(context)
                  //                       .size
                  //                       .height,
                  //                   child:  TabBarView(
                  //                     children: [
                  //
                  //                       // ProfilePoranList(poranAllModel: state.poranModel,),
                  //                       // ProfilePoranList(poranAllModel: state.poranModel,)
                  //
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       );
                  //     } else if (state.state == ResultState.noData) {
                  //       return Center(
                  //         child: Material(
                  //           child: Text(state.message),
                  //         ),
                  //       );
                  //     } else if (state.state == ResultState.error) {
                  //       return Center(
                  //         child: Material(
                  //           child: Text(state.message),
                  //         ),
                  //       );
                  //     } else {
                  //       return const Center(
                  //         child: Material(
                  //           child: Text(''),
                  //         ),
                  //       );
                  //     }
                  //   },
                  // ),
                ],
              ),
            ),
          )),
    );
  }
}
