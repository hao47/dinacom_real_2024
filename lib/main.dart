
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'UI/masyarakat_profile/profile.dart';
import 'common/routes/routes.dart';
import 'common/theme/color_value.dart';
import 'constants/url_routes.dart';
import 'package:get/get.dart';
void main() async {

  runApp(const MyApp());
  deviceOrientation();
}

void deviceOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends GetView<ProfileController> {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return GetMaterialApp(
      title: 'Lofy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: ColorValue.secondaryColor,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            textStyle: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 17.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        textTheme: TextTheme(
          headline1: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          headline2: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 20,
          ),
          headline3: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 16,
          ),
          headline4: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 14,
          ),
          headline6: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 16,
          ),
          bodyText1: GoogleFonts.poppins(
            color: ColorValue.greyColor,
            fontSize: 12,
          ),
          bodyText2: GoogleFonts.poppins(
            color: ColorValue.greyColor,
            fontSize: 10,
          ),
        ),
      ),

      debugShowCheckedModeBanner: false,
      initialRoute: UrlRoutes.initial,
      getPages: routes,

      // home: ProfileMasyarakat(),


    );
  }
}
