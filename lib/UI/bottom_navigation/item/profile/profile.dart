import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile_biodata.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile_post.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile_provider.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<ProfileProvider>(
            builder: (context, state, _) {
              if (state.state == ResultState.loading) {
               return Text("");
              } else if (state.state == ResultState.hasData) {
                return Column(
                  children: [
                    ProfileBioData(profileModel: state.categoryResult),
                    ProfilePost()
                  ],
                );
              } else if (state.state == ResultState.noData) {
                return Center(
                  child: Material(
                    child: Text(state.message),
                  ),
                );
              } else if (state.state == ResultState.error) {
                return Center(
                  child: Material(
                    child: Text(state.message),
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




        ),
      ),
    );
  }
}
