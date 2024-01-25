import 'package:dinacom_2024/UI/bottom_navigation/item/poran/widget/poran_list.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/poran/poran_provider.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile_provider.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/enums/status.dart';

class Poran extends StatelessWidget {
  BuildContext? newContext;

  Poran({super.key, this.newContext});



  @override
  Widget build(BuildContext context) {
    Get.put(PoranController()).profile();
    Get.put(ProfileController()).profilee();
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.blue,
          toolbarHeight: 75,
          automaticallyImplyLeading: false,
          actions: [
            SizedBox(width: 25),
            Expanded(
              child:
              GetX<ProfileController>(
                builder: (controller) {
                  // print(state.categoryResult.response.length);
                  if (controller.state.value == ResultState.loading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (controller.state.value == ResultState.hasData) {

                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [



                     CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                                controller.profileModel.value.responseProfile!.photoProfile

                            ),
                          ),
                        SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Selamat  datang kembali!',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12)),
                            Text( controller.profileModel.value.responseProfile!.username,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                )),
                          ],
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: IconButton(
                              onPressed: () {

                                Get.toNamed('/notif');

                              },
                              icon: Icon(Icons.notifications_none_rounded, color: Colors.white, size: 35)),
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
        body: RefreshIndicator(
          onRefresh: () async {
            Get.put(PoranController()).profile();
          },
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  GetX<PoranController>(
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
                      } else if (controller.state.value ==
                          ResultState.hasData) {
                        if (controller
                                .profileModel.value.responseAllModel.length !=
                            0) {
                          print("masokkkkkkkkkkkkkkkkkkk");
                          return PoranList(
                              poranAllModel: controller.profileModel.value,
                              newContext: newContext);

                          // return Container();
                        } else {
                          return Container();
                        }

                        // print(controller.profileModel.value.responseAllModel.length);
                        //
                        // return Container();
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
          ),
        ));
  }
}
