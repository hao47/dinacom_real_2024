// To parse this JSON data, do
//
//     final getCommentModel = getCommentModelFromJson(jsonString);

import 'dart:convert';

GetCommentModel getCommentModelFromJson(String str) => GetCommentModel.fromJson(json.decode(str));


class GetCommentModel {
  List<ResponseComment>? responseComment;
  int status;

  GetCommentModel({
     this.responseComment,
    required this.status,
  });

  factory GetCommentModel.fromJson(Map<String, dynamic> json) => GetCommentModel(
    responseComment: List<ResponseComment>.from(json["response_comment"].map((x) => ResponseComment.fromJson(x))),
    status: json["status"],
  );


}

class ResponseComment {
  int id;
  int userId;
  int postId;
  String body;
  User user;
  DateTime createdAt;
  DateTime updatedAt;

  ResponseComment({
    required this.id,
    required this.userId,
    required this.postId,
    required this.body,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ResponseComment.fromJson(Map<String, dynamic> json) => ResponseComment(
    id: json["id"],
    userId: json["user_id"],
    postId: json["post_id"],
    body: json["body"],
    user: User.fromJson(json["user"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "post_id": postId,
    "body": body,
    "user": user.toJson(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class User {
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

  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
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
