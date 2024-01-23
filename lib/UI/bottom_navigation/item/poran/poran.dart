import 'package:dinacom_2024/UI/bottom_navigation/item/poran/widget/poran_list.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/poran/poran_provider.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile_provider.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/enums/status.dart';

class Poran extends StatelessWidget {
  BuildContext? newContext;

  Poran({super.key, this.newContext});

  final PoranController controller = Get.put(PoranController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 370,
          decoration: BoxDecoration(
              color: ColorValue.primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          width: double.infinity,
          child: SafeArea(
            child: Column(children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color(0xff764abc),
                  child: Image.network(
                      "https://www.shutterstock.com/image-vector/vector-flat-illustration-grayscale-avatar-600nw-2264922221.jpg"),
                ),
                title: Text('Selamat  datang kembali!',
                    style: CommonAppTheme.textTheme(context)
                        .headline1!
                        .copyWith(fontSize: 14, color: Colors.white)),
                subtitle: Text(Get.put(ProfileController()).profileModel.value.responseProfile!.username.toString(),
                    style: CommonAppTheme.textTheme(context)
                        .headline1!
                        .copyWith(fontSize: 16, color: Colors.white)),
                contentPadding: EdgeInsets.all(0),
                // isThreeLine: false,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 180,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("assets/images/event_pemilu.png"),
                        fit: BoxFit.fill)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Segera Hadir",
                            style: CommonAppTheme.textTheme(context)
                                .bodyText1!
                                .copyWith(
                                    fontSize: 16, color: Color(0xfff5e766))),
                        Container(
                          alignment: Alignment.topCenter,
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: ColorValue.secondaryColor,
                              borderRadius: BorderRadius.circular(200)),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.link),
                          ),
                        )
                      ],
                    ),
                    Text(
                        "Pemilu sudah dekat ayo pilih cawapres pilihan kamu lewat Go connect",
                        style: CommonAppTheme.textTheme(context)
                            .headline1!
                            .copyWith(color: Colors.white, fontSize: 18)),
                  ],
                ),
              )
            ]),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Berita Terkini",
                      style:
                          CommonAppTheme.textTheme(context).headline1!.copyWith(
                                fontSize: 20,
                              )),
                  Text("See All",
                      style: CommonAppTheme.textTheme(context)
                          .bodyText1!
                          .copyWith(fontSize: 18, color: Color(0xff666666))),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 180,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("assets/images/berita_pilpres.png"),
                        fit: BoxFit.fill)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(1000),
                          border: Border.all(
                              color: ColorValue.primaryColor, width: 2)),
                      child: Text("Politik",
                          style: CommonAppTheme.textTheme(context)
                              .bodyText1!
                              .copyWith(color: Colors.black)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                            "Debat cawapres seru ketiga \npaslon saling bersilat lidah \ndengan panas",
                            style: CommonAppTheme.textTheme(context)
                                .headline1!
                                .copyWith(color: Colors.white, fontSize: 18)),
                        Text("12-01-24",
                            style: CommonAppTheme.textTheme(context)
                                .bodyText1!
                                .copyWith(
                                  color: Colors.white,
                                ))
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Poran terbaru",
                  style: CommonAppTheme.textTheme(context).headline1!.copyWith(
                        fontSize: 20,
                      )),
              GetBuilder<PoranController>(
                builder: (controller) {
                  // print(state.categoryResult.response.length);
                  if (controller.state.value == ResultState.loading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (controller.state.value == ResultState.hasData) {


                    if(controller.profileModel.value.responseAllModel.length != 0){

                      print("masokkkkkkkkkkkkkkkkkkk");
                      return PoranList(
                          poranAllModel: controller.profileModel.value,
                          newContext: newContext);
                    }else {
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
        )
      ]),
    ));
  }
}
