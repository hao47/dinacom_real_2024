import 'package:dinacom_2024/UI/widget/role.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';
import 'package:dinacom_2024/data/model/profile_model.dart';
class ProfileBioData extends StatelessWidget {

  ProfileModel profileModel;


   ProfileBioData({super.key,required this.profileModel});

  @override
  Widget build(BuildContext context) {
    var tahun =  profileModel.responseProfile.tanggalLahir.year.toString();
    var bulan =  profileModel.responseProfile.tanggalLahir.month.toString();
    var hari =  profileModel.responseProfile.tanggalLahir.day.toString();
    return Container(padding: const EdgeInsets.only(top: 10, bottom: 20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorValue.VeryLightGrey,
            width: 1.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration:  BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      profileModel.responseProfile.photoProfile
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ColorValue.secondaryColor),
                  child: Text(
                    "Setelan",
                    style: CommonAppTheme.textTheme(context)
                        .bodyText1!
                        .copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 10),
                  ),
                ),

              ),
            ],
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 3),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    profileModel.responseProfile.username,
                    style: CommonAppTheme.textTheme(context)
                        .headline1!
                        .copyWith(fontSize: 20),
                  ),
                  const SizedBox(width: 10),
                   Role(name: profileModel.responseProfile.role),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 3),
                width: 250,
                child: Text(
                  profileModel.responseProfile.bio == ""?"belum di sertakan":profileModel.responseProfile.bio,
                  maxLines: 2,
                  style: CommonAppTheme.textTheme(context)
                      .bodyText1!
                      .copyWith(fontSize: 12, color: ColorValue.LightGrey),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                        color: ColorValue.LightGrey,
                        size: 16,
                      ),
                      const SizedBox(width: 3),
                      Text(
                          '$tahun - $bulan - $hari',
                        style: CommonAppTheme.textTheme(context)
                            .bodyText1!
                            .copyWith(fontSize: 10),
                      ),
                    ],
                  ),

                  const SizedBox(width: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: ColorValue.LightGrey,
                        size: 16,
                      ),
                      const SizedBox(width: 3),
                      Text(

                        profileModel.responseProfile.daerah == ", , " ?"belum di sertakan": profileModel.responseProfile.daerah,
                        // profileModel.responseProfile.daerah,
                        style: CommonAppTheme.textTheme(context)
                            .bodyText1!
                            .copyWith(fontSize: 10),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
