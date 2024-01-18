// To parse this JSON data, do
//
//     final poranAllModel = poranAllModelFromJson(jsonString);

import 'dart:convert';

PoranAllModel poranAllModelFromJson(String str) => PoranAllModel.fromJson(json.decode(str));


class PoranAllModel {
  List<Response> response;
  int status;

  PoranAllModel({
    required this.response,
    required this.status,
  });

  factory PoranAllModel.fromJson(Map<String, dynamic> json) => PoranAllModel(
    response: List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
    status: json["status"],
  );


}

class Response {
  int id;
  String content;
  String gambar;
  String ditujukan;
  Author author;
  int authorId;
  DateTime createdAt;
  DateTime updatedAt;

  Response({
    required this.id,
    required this.content,
    required this.gambar,
    required this.ditujukan,
    required this.author,
    required this.authorId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    id: json["id"],
    content: json["content"],
    gambar: json["gambar"],
    ditujukan: json["ditujukan"],
    author: Author.fromJson(json["author"]),
    authorId: json["author_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

}

class Author {
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

  Author({
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

  factory Author.fromJson(Map<String, dynamic> json) => Author(
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


}
