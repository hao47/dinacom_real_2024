
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'UI/masyarakat_profile/profile.dart';
import 'common/routes/routes.dart';
import 'common/theme/color_value.dart';
import 'constants/url_routes.dart';
import 'package:get/get.dart';
void main() async {

  runApp(const MyApp());
  deviceOrientation();
  _determinePosition();
}

void deviceOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}


 _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    await Geolocator.openLocationSettings();
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {

      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }


}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return GetMaterialApp(
      title: 'Go Connect',
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
