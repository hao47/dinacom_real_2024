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


ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
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
  List<Post> post;
  String jwtToken;
  String bio;

  ProfileModel({
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
    required this.post,
    required this.jwtToken,

    required this.bio,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
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

    post: List<Post>.from(json["Post"].map((x) => Post.fromJson(x))),
    jwtToken: json["jwt_token"],
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
    "Post": List<dynamic>.from(post.map((x) => x)),
    "jwt_token": jwtToken,
  };
}
class Post {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int userId;
  String content;
  String gambar;
  String ditujukan;

  Post({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.userId,
    required this.content,
    required this.gambar,
    required this.ditujukan,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["ID"],
    createdAt: DateTime.parse(json["CreatedAt"]),
    updatedAt: DateTime.parse(json["UpdatedAt"]),
    deletedAt: json["DeletedAt"],
    userId: json["UserID"],
    content: json["Content"],
    gambar: json["Gambar"],
    ditujukan: json["Ditujukan"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "CreatedAt": createdAt.toIso8601String(),
    "UpdatedAt": updatedAt.toIso8601String(),
    "DeletedAt": deletedAt,
    "UserID": userId,
    "Content": content,
    "Gambar": gambar,
    "Ditujukan": ditujukan,
  };
}