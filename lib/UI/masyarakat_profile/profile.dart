import 'package:dinacom_2024/UI/masyarakat_profile/profile_biodata.dart';
import 'package:dinacom_2024/UI/masyarakat_profile/profile_post.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';

class ProfileMasyarakat extends StatelessWidget {
  const ProfileMasyarakat({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
          leading: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          title: Text(
            "Profile",
            style: textTheme.headline1!.copyWith(fontSize: 20, height: 1.5),
          ),
        ),
        body: Column(
          children: [
            ProfileBioData(),
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
                          text: 'Repost',
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: const TabBarView(
                            children: [
                              ProfilePost(),
                              ProfilePost(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
