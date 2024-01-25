import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class ChangeLocation extends StatelessWidget {
  const ChangeLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color(0xFFDCEEFF), shape: BoxShape.circle),
            padding: EdgeInsets.all(8),
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: Color(0xffaad5ff), shape: BoxShape.circle),
              child: Icon(
                Icons.location_on_outlined,
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(height: 14),
          Text(
            'Pilih Lokasi',
            style: textTheme.bodyText1!.copyWith(
              fontSize: 16,
              height: 1.5,
              fontWeight: FontWeight.w900,
              color: ColorValue.BaseBlack,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Silahkan pilih opsi untuk menentukan lokasi dari laporan.',
            style: textTheme.bodyText1!.copyWith(
              fontSize: 12,
              height: 1.5,
              color: ColorValue.LightGrey,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async{
              // print("oto");

              Position position = await _determinePosition();


              List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);


              Get.back(result: [placemark[0].street]);
            },
            child: Text(
              'Otomatis',
              style: textTheme.bodyText1!.copyWith(
                fontSize: 16,
                height: 1.5,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorValue.secondaryColor,
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              //Batal
              // Navigator.of(context).pop();
            },
            child: Text(
              'Manual',
              style: textTheme.bodyText1!.copyWith(
                fontSize: 16,
                height: 1.5,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              side: BorderSide(color: Colors.black, width: 1),
            ),
          ),
        ],
      ),
    );
  }


  Future<Position> _determinePosition() async {
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

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}