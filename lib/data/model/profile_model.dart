import 'package:flutter/material.dart';

class ProfileModel{

  IconData iconData;
  String text;

  ProfileModel({required this.iconData,required this.text});
}


var bios = [

  ProfileModel(iconData: Icons.email, text: "kudus123@gmail.com"),
  ProfileModel(iconData: Icons.location_on_sharp, text: "Jawa Tengah, Kudus"),
  ProfileModel(iconData: Icons.calendar_month, text: "Senin - Jum’at"),
  ProfileModel(iconData: Icons.access_time_outlined, text: "09:00 - 16:00"),

];