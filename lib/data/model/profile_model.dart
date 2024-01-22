import 'package:flutter/material.dart';

import 'dart:convert';
class ProfileModelTemporary{

  IconData iconData;
  String text;

  ProfileModelTemporary({required this.iconData,required this.text});
}


var bios = [

  ProfileModelTemporary(iconData: Icons.email, text: "kudus123@gmail.com"),
  ProfileModelTemporary(iconData: Icons.location_on_sharp, text: "Jawa Tengah, Kudus"),
  ProfileModelTemporary(iconData: Icons.calendar_month, text: "Senin - Jum’at"),
  ProfileModelTemporary(iconData: Icons.access_time_outlined, text: "09:00 - 16:00"),

];


// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);


ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));


class ProfileModel {
  ResponseProfile? responseProfile;
  int status;

  ProfileModel({
     this.responseProfile,
    required this.status,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    responseProfile: ResponseProfile.fromJson(json["response_profile"]),
    status: json["status"],
  );


}

class ResponseProfile {
  int id;
  DateTime updatedAt;
  dynamic deletedAt;
  String username;
  String email;
  String password;
  String photoProfile;
  DateTime tanggalLahir;
  String daerah;
  String role;
  String verHash;
  DateTime timeout;
  bool isActive;
  DateTime createdAt;
  String bio;

  ResponseProfile({
    required this.id,
    required this.updatedAt,
    required this.deletedAt,
    required this.username,
    required this.email,
    required this.password,
    required this.photoProfile,
    required this.tanggalLahir,
    required this.daerah,
    required this.role,
    required this.verHash,
    required this.timeout,
    required this.isActive,
    required this.createdAt,
    required this.bio,
  });

  factory ResponseProfile.fromJson(Map<String, dynamic> json) => ResponseProfile(
    id: json["ID"],
    updatedAt: DateTime.parse(json["UpdatedAt"]),
    deletedAt: json["DeletedAt"],
    username: json["username"],
    email: json["email"],
    password: json["password"],
    photoProfile: json["photo_profile"],
    tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
    daerah: json["daerah"],
    role: json["role"],
    verHash: json["VerHash"],
    timeout: DateTime.parse(json["Timeout"]),
    isActive: json["IsActive"],
    createdAt: DateTime.parse(json["CreatedAt"]),
    bio: json["bio"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "UpdatedAt": updatedAt.toIso8601String(),
    "DeletedAt": deletedAt,
    "username": username,
    "email": email,
    "password": password,
    "photo_profile": photoProfile,
    "tanggal_lahir": "${tanggalLahir.year.toString().padLeft(4, '0')}-${tanggalLahir.month.toString().padLeft(2, '0')}-${tanggalLahir.day.toString().padLeft(2, '0')}",
    "daerah": daerah,
    "role": role,
    "VerHash": verHash,
    "Timeout": timeout.toIso8601String(),
    "IsActive": isActive,
    "CreatedAt": createdAt.toIso8601String(),
    "bio": bio,
  };
}
