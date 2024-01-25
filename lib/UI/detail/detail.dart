
import 'package:dinacom_2024/UI/bottom_navigation/item/poran/poran_provider.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile_provider.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/search/search_controller.dart';
import 'package:dinacom_2024/UI/detail/detail_controller.dart';
import 'package:dinacom_2024/UI/detail/detail_controller.dart';
import 'package:dinacom_2024/UI/detail/widget/comment.dart';
import 'package:dinacom_2024/UI/detail/widget/info_rich_text.dart';
import 'package:dinacom_2024/UI/masyarakat_profile/widget/profile_biodata.dart';
// import 'package:dinacom_2024/UI/masyarakat_profile/profile_post.dart';
import 'package:dinacom_2024/UI/widget/role.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;


class DetailPage extends GetView<DetailController> {

  // int id;
  //
  //  DetailPage({super.key,required this.id});

  // final PoranController controller = Get.put(PoranController());
  //
  @override
  Widget build(BuildContext context) {
    Get.put(DetailController());
    final textTheme = Theme
        .of(context)
        .textTheme;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
          leading:  IconButton(
         onPressed: () {
           Get.put(PoranController()).profile();
           Get.put(ProfileController()).profilee();

           Get.put(SearchPageController()).getPoranSearch("");
           // Get.put(SearchPageController()).searchModel.value.posts[ Get.put(DetailController()).one[1]].commentJumlah++;

           Navigator.pop(context);
         },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Poran",
            style: textTheme.headline1!.copyWith(fontSize: 20, height: 1.5),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
                children: [

                  GetBuilder<DetailController>(
                    builder: (controller) {
                      // print(state.categoryResult.response.length);
                      if (controller.state.value == ResultState.loading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (controller.state.value == ResultState.hasData) {
                        print("ada data");



                        timeago.setLocaleMessages('id', timeago.IdMessages());

                        DateTime now = DateTime.now().toLocal();

                        DateTime inputDate = controller.detailModel.value.responseDetail!.createdAt;

                        Duration difference = now.difference(inputDate);

                        String formattedDate = DateFormat('d MMMM y').format(inputDate);
                        String clock = DateFormat('h:mm a').format(inputDate);

                        String timeAgo = timeago.format(now.subtract(difference), locale: 'id');


                        return Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              color: ColorValue.VeryLightBlue,
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10, bottom: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration:  BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      controller.detailModel.value.responseDetail!.author.photoProfile
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              controller.detailModel.value.responseDetail!.author.username,
                                              style: CommonAppTheme.textTheme(context)
                                                  .headline1!
                                                  .copyWith(fontSize: 18),
                                            ),
                                            const SizedBox(width: 10),
                                            Role(name: controller.detailModel.value.responseDetail!.author.role, ),
                                          ],
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.report_problem_outlined)),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 180,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          shape: BoxShape.rectangle,
                                          image:  DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(

                                                controller.detailModel.value.responseDetail!.gambar
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text(


                                        controller.detailModel.value.responseDetail!.title,
                                        style: CommonAppTheme.textTheme(context)
                                            .headline1!
                                            .copyWith(
                                            fontSize: 14,
                                            color: ColorValue.BaseBlack),
                                      ),
                                      SizedBox(height: 5),
                                      Text(


                                        controller.detailModel.value.responseDetail!.content,
                                        style: CommonAppTheme.textTheme(context)
                                            .bodyText1!
                                            .copyWith(
                                            fontSize: 14,
                                            color: ColorValue.BaseBlack),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 15),
                                    child:  Row(
                                      children: [
                                        Text(clock),
                                        Padding(
                                          padding:
                                          const EdgeInsets.symmetric(horizontal: 5),
                                          child: Icon(Icons.circle,
                                              size: 3, color: ColorValue.LightGrey),
                                        ),
                                        Text(formattedDate.toString())
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: ColorValue.VeryLightGrey,
                                    width: 2,
                                  ),
                                  bottom: BorderSide(
                                    color: ColorValue.VeryLightGrey,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      InfoRichText(total: controller.detailModel.value.responseDetail!.commentJumlah, title: "Tanggapan"),
                                      SizedBox(width: 10),
                                      InfoRichText(total: controller.detailModel.value.responseDetail!.likeJumlah, title: "Like"),
                                      SizedBox(width: 10),
                                      // InfoRichText(total: 78, title: "Dibagikan"),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () async{

                                        // FlutterShare
                                        await FlutterShare.share(
                                            title: controller.detailModel.value.responseDetail!.content,
                                            text: controller.detailModel.value.responseDetail!.content,
                                            linkUrl: controller.detailModel.value.responseDetail!.content,
                                            chooserTitle: 'News Share');
                                      },
                                      icon: const Icon(Icons.share),
                                      iconSize: 16),
                                ],
                              ),
                            ),

                          ],
                        );

                        // return Container();
                        // return PoranList(poranAllModel: controller.profileModel.value,newContext: newContext);
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



                  GetBuilder<DetailController>(
                    builder: (controller) {
                      // print(state.categoryResult.response.length);
                      if (controller.states.value == ResultState.loading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (controller.states.value == ResultState.hasData) {

                        // print(controller.getcommentModel.value.responseComment!.length);

                        // return Container();
                              return Column(
                                children: [
                                  CommentPoran(commentModel:controller.getcommentModel.value,text:controller.detailModel.value.responseDetail!.author.username,),
                                ],
                              );

                        // return Container();
                        // return PoranList(poranAllModel: controller.profileModel.value,newContext: newContext);
                      } else if (controller.states.value == ResultState.noData) {
                        return Center(
                          child: Material(
                            child: Text("Tidak ada Data"),
                          ),
                        );
                      } else if (controller.states.value == ResultState.error) {
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





    ],
    ),
    ),
      bottomNavigationBar:  Padding(
        padding:
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          height: 50,
          child: TextFormField(
controller: controller.bodycontroller,
            style: textTheme.bodyText1!.copyWith(
              fontSize: 14,
              color: ColorValue.BaseBlack,
            ),
            maxLines: null,
            cursorColor: ColorValue.BaseBlue,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () async{
                  FocusScope.of(context).unfocus();
                  controller.bodycontroller.clear();

                  final a = await controller.createporan(controller.one[0],controller.bodycontroller.text);


                  if( a == true){

                    Get.put(DetailController()).detail();
                    Get.put(DetailController()).getComment();
                  }


                },
                icon: Icon(Icons.send,color: ColorValue.secondaryColor),
              ),
              fillColor: Colors.white,
              filled: true,
              contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
              focusColor: ColorValue.BaseBlue,
              labelText: null,
              hintText: 'Tambahkan komentar ...',
              hintStyle: textTheme.bodyText1!.copyWith(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}