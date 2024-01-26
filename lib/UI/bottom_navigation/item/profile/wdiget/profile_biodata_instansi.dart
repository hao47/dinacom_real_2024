import 'package:dinacom_2024/UI/instansi_profile/widget/buildIBioInstansi.dart';
import 'package:dinacom_2024/UI/widget/role.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:dinacom_2024/data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileBioDataAsInstansi extends StatelessWidget {

  ProfileModel profileModel;
   ProfileBioDataAsInstansi({super.key,required this.profileModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 5),
        Center(
          child: Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 10))
                    ],
                    shape: BoxShape.circle,
                    image:  DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            profileModel.responseProfile!.photoProfile
                        ))),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorValue.BaseBlue,
                    ),
                    child: IconButton(
                      onPressed: (){
                        Get.toNamed('/kelola');
                      },
                      icon: Icon(
                        Icons.build,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  )),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10,
          children: [
            Text(
              profileModel.responseProfile!.username,
              style: CommonAppTheme.textTheme(context)
                  .headline1!
                  .copyWith(fontSize: 23),
            ),

          ],
        ),
        Text(

          profileModel.responseProfile!.bio,
          style: CommonAppTheme.textTheme(context)
              .bodyText1!
              .copyWith(color: Colors.black, fontSize: 14.5),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        const Role(name: "Instansi"),
        const SizedBox(height: 5),

        // ProfileModelTemporary(iconData: Icons.location_on_sharp, text: "Jawa Tengah, Kudus"),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon( Icons.location_on_sharp),
            SizedBox(
              width: 5,
            ),
            Text(profileModel.responseProfile!.daerah,
                style: CommonAppTheme.textTheme(context)
                    .bodyText1!
                    .copyWith(color: Colors.black, fontSize: 12.5)
            )

          ],
        ),

        Container(
          height: 150,
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child:
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [


                      BoxShadow(
                        color: Color(0xFF959595).withOpacity(1),
                        offset: Offset(-8, 6),
                        blurRadius: 9,
                        spreadRadius: -4,
                      ),


                    ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("250",

                        style: CommonAppTheme.textTheme(context)
                            .headline1!
                            .copyWith(color: ColorValue.secondaryColor)
                    ),
                    SizedBox(height: 3,),
                    Text("Laporan Selesai",
                        style: CommonAppTheme.textTheme(context)
                            .bodyText1!
                            .copyWith(color: ColorValue.secondaryColor
                        )),
                  ],
                ),
              )),




        SizedBox(width: 10,),
              Expanded(child:
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                    color: ColorValue.secondaryColor,
                    boxShadow: [

            

                    ]
                ),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("250",

                        style: CommonAppTheme.textTheme(context)
                            .headline1!
                            .copyWith(color:Colors.white)
                    ),
                    SizedBox(height: 3,),
                    Text("Laporan Selesai",
                        style: CommonAppTheme.textTheme(context)
                            .bodyText1!
                            .copyWith(color:Colors.white
                        )),
                  ],
                ),
              ))
            ],
          ),
        ),

      ],
    );
  }
}