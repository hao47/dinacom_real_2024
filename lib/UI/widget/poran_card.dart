import 'package:dinacom_2024/UI/bottom_navigation/item/poran/poran_provider.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile_provider.dart';
import 'package:dinacom_2024/UI/detail/detail.dart';
import 'package:dinacom_2024/UI/widget/favorite_provider.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/navigate.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:dinacom_2024/data/model/poran_all_model.dart';
import 'package:dinacom_2024/validator/Validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

enum SampleItem { itemOne, itemTwo, itemThree }

class PoranCardItem extends StatelessWidget {
  ResponseAllModel response;
  BuildContext? newContext;

  PoranCardItem({super.key, required this.response,this.newContext});


  SampleItem? selectedMenu;

  String jwtToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImRhZmZhIiwiZW1haWwiOiJkYWZmYXJvYmFuaTU1MUBnbWFpbC5jb20iLCJpZCI6MSwiZXhwIjoxNzA1NjYxOTU0fQ.aamqFwyjMlqiTpl8OC72N0axTw07rh6RBmxsKukcHDs";


  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<PoranProvider>(context, listen: false)
  //         .checklike(widget.response.id);
  // }


  bool  waa= false;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? decodedToken = Validator.decodeJwtClaims(jwtToken);
    //
    // int id = Provider.of<ProfileProvider>(context, listen: false)
    //     .categoryResult
    //     .responseProfile
    //     .id;
    //
    //
    String tujukan = response.author.role == "Instansi"?"":" • ${response.ditujukan}";
    //
    // print(id == response.id);
    // print(response.author.id);
    // print(id);
    // timeago.setLocaleMessages('id', timeago.IdMessages());
    //
    DateTime now = DateTime.now().toLocal();
    //
    // final provider = Provider.of<FavoriteProvider>(context);
    DateTime inputDate = response.createdAt.toLocal();
    //
    Duration difference = now.difference(inputDate);
    //
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss.SSS').format(inputDate);

    String timeAgo = timeago.format(now.subtract(difference), locale: 'id');

    return InkWell(
      onTap: () {


        // print("ini all");
        // Navigator.push(
        //   newContext!,
        //   MaterialPageRoute(builder: (newContext) => DetailPage(id: response.id,)),
        // );

        Get.toNamed('/detail',arguments: [response.id]);

      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: ColorValue.VeryLightBlue,
          boxShadow: [
            BoxShadow(
              color: Color(0xFFd5d5d5),
              offset: Offset(10, 11),
              blurRadius: 14,
              spreadRadius: -2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      response.author.role == "Instansi"?Container(): Icon(
                        Icons.circle,
                        color: ColorValue.VeryLightGrey,
                        size: 10,
                      ),
                      SizedBox(width: 10),
                      Text(

                        response.author.role == "Instansi"?  '':'Dalam antrian',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: ColorValue.VeryLightGrey,
                            fontSize: 10),
                      ),
                    ],
                  ),
                  PopupMenuButton<SampleItem>(
                    initialValue: selectedMenu,
                    // Callback that sets the selected popup menu item.
                    onSelected: (SampleItem item) {
                      // setState(() {
                      //   selectedMenu = item;
                      // });
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<SampleItem>>[
                      Get.put(ProfileController()).profileModel.value.responseProfile!.id == response.author.id
                          ? PopupMenuItem<SampleItem>(
                              value: SampleItem.itemOne,
                              onTap: () async{
                                // if (decodedToken != null) {
                                //   // rint('User ID: ${decodedClaims['sub']}');
                                //   print('Username: ${decodedToken['id']}');
                                //   print(
                                //       'Signature: ${decodedToken['signature']}');
                                // } else {
                                //   print('Invalid JWT');
                                // }

                                print(response.id);

                                await Get.put(PoranController()).deleteporan(response.id);


                                Get.put(PoranController()).profile();


                              },
                              child: Text('Delete'),
                            )
                          : PopupMenuItem<SampleItem>(
                              // value: SampleItem.itemOne,
                              child: null,
                            )
                    ],
                  )
                ],
              ),
              SizedBox(height: 5),


              Row(
                children: [
                  Get.put(ProfileController()).profileModel.value.responseProfile!.id != response.author.id
                      ?
                  InkWell(
                    onTap: () {
                      // print("ini profile");

                      if(Get.put(ProfileController()).profileModel.value.responseProfile!.role == "Masyarakat"){

                        // Get.toNamed('/detail',arguments: [response.id]);
                        Get.toNamed('/profilemasyarakat',arguments: [response.author.id]);
                      }else {

                        Get.toNamed('/profileinstansi');
                      }

                    },
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 10))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(

                          response.author.photoProfile
                          ),
                        ),
                      ),
                    ),
                  ):
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10))
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(

                            response.author.photoProfile
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            response.author.username,
                            style: CommonAppTheme.textTheme(context)
                                .headline1!
                                .copyWith(fontSize: 20),
                          ),
                          SizedBox(width: 10),
                          Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorValue.secondaryColor),
                            child: Text(
                              response.author.role,
                              style: CommonAppTheme.textTheme(context)
                                  .bodyText1!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 7),
                            ),
                          ),
                          SizedBox(width: 3),

                          response.author.role != "Instansi"?Container():
                          Image.asset(
                            "assets/images/verified.png",
                            fit: BoxFit.fill,
                            width: 16,
                          ),
                        ],
                      ),
                      Text(timeAgo == "kurang dari semenit yang lalu"?"kurang dari 1 menit":timeAgo +  tujukan),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                response.content,
                maxLines: 5,
                style: CommonAppTheme.textTheme(context).bodyText1!.copyWith(
                      color: Colors.black,
                      overflow: TextOverflow.ellipsis,
                    ),
              ),
              SizedBox(
                height: 10,
              ),
              response.gambar == ""
                  ? Container()
                  : Container(
                      width: 300,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 10))
                        ],
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(response.gambar),
                        ),
                      ),
                    ),
              SizedBox(
                height: 10,
              ),







              Row(
                children: [


                  Icon(Icons.mode_comment_outlined),
                  SizedBox(
                    width: 10,
                  ),
                  Text(response.commentJumlah.toString(),style: CommonAppTheme.textTheme(context).bodyText1!,)


                  // FutureBuilder(
                  //   future: Provider.of<PoranProvider>(context, listen: false)
                  //       .checklike(response.id),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       // Menampilkan widget ketika future masih dalam proses
                  //       return Text('');
                  //     } else if (snapshot.hasError) {
                  //       // Menangani kesalahan jika terjadi
                  //       return Text('Error: ${snapshot.error}');
                  //     } else {
                  //       // Menampilkan widget berdasarkan hasil future
                  //       // Provider.of<FavoriteProvider>(context,listen: false).setlike(snapshot.data!);
                  //       //
                  //       // bool hasLiked = Provider.of<FavoriteProvider>(context,listen: false).hasLiked;
                  //       return Row(
                  //           children: [
                  //
                  //             // waa?
                  //
                  //
                  //             // snapshot.data!
                  //             //     ? IconButton(
                  //             //     onPressed: () {
                  //             //       // Provider.of<PoranProvider>(context, listen: false)
                  //             //       //     .dislike(
                  //             //       //     context,
                  //             //       //     Provider.of<PoranProvider>(context,
                  //             //       //         listen: false)
                  //             //       //         .likeModel
                  //             //       //         .responseLike!
                  //             //       //         .id,response.id);
                  //             //       //
                  //             //       // Provider.of<PoranProvider>(context, listen: false)
                  //             //       //     .resetcounter(response.likeJumlah);
                  //             //       //
                  //             //       // provider.toggleFavorite(response.content);
                  //             //
                  //             //       setState(() {
                  //             //         waa = true;
                  //             //       });
                  //             //     },
                  //             //     icon: Icon(
                  //             //       Icons.favorite,
                  //             //       color: Colors.red,
                  //             //     ))
                  //             //     : IconButton(
                  //             //     onPressed: () {
                  //             //
                  //             //       setState(() {
                  //             //         waa = true;
                  //             //       });
                  //             //     },
                  //             //     icon: Icon(
                  //             //       Icons.favorite_border,
                  //             //       color: ColorValue.LightGrey,
                  //             //     )),
                  //
                  //
                  //             Text(
                  //                 Provider.of<PoranProvider>(context, listen: true)
                  //                     .count
                  //                     .toString() ==
                  //                     "0"
                  //                     ? response.likeJumlah.toString()
                  //                     : Provider.of<PoranProvider>(context, listen: true)
                  //                     .count
                  //                     .toString(),
                  //                 style: TextStyle(
                  //                     fontSize: 12,
                  //                     fontWeight: FontWeight.w700,
                  //                     color: ColorValue.LightGrey))
                  //           ],
                  //         );
                  //     }
                  //   },
                  // ),


                ],
              ),



              Row(
                children: [
                  Row(
                    children: [
                        // provider.isExist(widget.response.id)
                        //     ? IconButton(
                        //     onPressed: () async{
                        //       Provider.of<PoranProvider>(context, listen: false)
                        //           .dislike(
                        //           context,
                        //           Provider.of<PoranProvider>(context,
                        //               listen: false)
                        //               .likeModel
                        //               .responseLike!
                        //               .id,widget.response.id);
                        //
                        //       Provider.of<PoranProvider>(context, listen: false)
                        //           .resetcounter(widget.response.likeJumlah);
                        //
                        //       provider.toggleFavorite(widget.response.id);
                        //     },
                        //     icon: Icon(
                        //       Icons.favorite,
                        //       color: Colors.red,
                        //     ))
                        //     : IconButton(
                        //     onPressed: () async{
                        //       Provider.of<PoranProvider>(context, listen: false)
                        //           .like(context, widget.response.id,
                        //           widget.response.author.id);
                        //
                        //       Provider.of<PoranProvider>(context, listen: false)
                        //           .addcounter(widget.response.likeJumlah);
                        //
                        //       provider.toggleFavorite(widget.response.id);
                        //     },
                        //     icon: Icon(
                        //       Icons.favorite_border,
                        //       color: ColorValue.LightGrey,
                        //     )),


                      // Text(
                      //     Provider.of<PoranProvider>(context, listen: true)
                      //         .count
                      //         .toString() ==
                      //         "0"
                      //         ? widget.response.likeJumlah.toString()
                      //         : Provider.of<PoranProvider>(context, listen: true)
                      //         .count
                      //         .toString(),
                      //     style: TextStyle(
                      //         fontSize: 12,
                      //         fontWeight: FontWeight.w700,
                      //         color: ColorValue.LightGrey))
                    ],
                  ),

                  ])
            ],
          ),
        ),
      ),
    );
  }
}
