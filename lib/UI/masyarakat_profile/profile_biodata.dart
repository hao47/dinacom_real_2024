import 'package:dinacom_2024/UI/widget/role.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';

class ProfileBioData extends StatelessWidget {
  const ProfileBioData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
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
          Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                ),
              ),
            ),
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
                    'Nyoman Deka',
                    style: CommonAppTheme.textTheme(context)
                        .headline1!
                        .copyWith(fontSize: 20),
                  ),
                  const SizedBox(width: 10),
                  const Role(name: "Masyarakt"),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 3),
                width: 250,
                child: Text(
                  'halo gais ini aplikasi kapan jadinya ya...',
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
                        '12 Desember 1998',
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
                        'Bogor, Jawa Barat',
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
