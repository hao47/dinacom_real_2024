import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile_provider.dart';
import 'package:dinacom_2024/UI/masyarakat_profile/profile_masyarakat_controller.dart';
import 'package:dinacom_2024/UI/masyarakat_profile/widget/profile_biodata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/enums/status.dart';


class ProfileMasyarakat extends StatelessWidget {
  // void didChangeDependencies() {

  final ProfileMasyarakatController controller = Get.put(ProfileMasyarakatController());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 35,
            automaticallyImplyLeading: false,
          ),
          body: Column(
            children: [
              GetBuilder<ProfileMasyarakatController>(
                builder: (controller) {
                  // print(state.categoryResult.response.length);
                  if (controller.state.value == ResultState.loading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (controller.state.value == ResultState.hasData) {
                    // print("ada data");

                    // return Container();
                    // return Text("halo");
                    return ProfileBioDataMasyarakat(
                        profileModel: controller.profileModel.value);
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
              //

              // GetBuilder<ProfileController>(
              //   builder: (controller) {
              //     // print(state.categoryResult.response.length);
              //     if (controller.statep.value == ResultState.loading) {
              //       return Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     } else if (controller.statep.value == ResultState.hasData) {
              //       // print("ada data");
              //
              //       // print(controller.poranModel.value.response[0].gambar);
              //
              //       // return Container();
              //       // return Text("halo");
              //       return Expanded(
              //                 child: DefaultTabController(
              //                   length: 2,
              //                   child: Column(
              //                     children: [
              //                       TabBar(
              //                         padding: const EdgeInsets.only(
              //                             top: 10, bottom: 5),
              //                         dividerColor: Colors.transparent,
              //                         indicator: const BoxDecoration(
              //                           border: Border(
              //                             bottom: BorderSide(
              //                               color: ColorValue.BaseBlue,
              //                               width: 3,
              //                             ),
              //                           ),
              //                         ),
              //                         unselectedLabelStyle: CommonAppTheme
              //                             .textTheme(context)
              //                             .bodyText1!
              //                             .copyWith(
              //                           fontWeight: FontWeight.w900,
              //                           fontSize: 16,
              //                         ),
              //                         unselectedLabelColor: ColorValue.LightGrey,
              //                         labelStyle: CommonAppTheme
              //                             .textTheme(context)
              //                             .bodyText1!
              //                             .copyWith(
              //                           fontWeight: FontWeight.w900,
              //                           fontSize: 16,
              //                         ),
              //                         labelColor: ColorValue.BaseBlack,
              //                         tabs: const [
              //                           Tab(
              //                             text: 'Poran',
              //                           ),
              //                           Tab(
              //                             text: 'Repost',
              //                           ),
              //                         ],
              //                       ),
              //                       Expanded(
              //                         child: SizedBox(
              //                           height: MediaQuery
              //                               .of(context)
              //                               .size
              //                               .height,
              //                           child:  TabBarView(
              //                             children: [
              //
              //                               ProfilePoranList(poranAllModel: controller.poranModel.value,),
              //                               // Text("haLO"),
              //                               Text("haLO"),
              //
              //                               // ProfilePoranList(poranAllModel: controller.poranModel.value,)
              //
              //                             ],
              //                           ),
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               );
              //     } else if (controller.statep.value == ResultState.noData) {
              //       return Center(
              //         child: Material(
              //           child: Text("Tidak ada Data"),
              //         ),
              //       );
              //     } else if (controller.statep.value == ResultState.error) {
              //       return Center(
              //         child: Material(
              //           child: Text("Ada yang salah"),
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
              // )

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
          )),
    );
  }
}
