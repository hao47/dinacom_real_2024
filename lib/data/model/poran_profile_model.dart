// To parse this JSON data, do
//
//     final poranProfileModel = poranProfileModelFromJson(jsonString);

import 'dart:convert';

PoranProfileModel poranProfileModelFromJson(String str) => PoranProfileModel.fromJson(json.decode(str));

String poranProfileModelToJson(PoranProfileModel data) => json.encode(data.toJson());

class PoranProfileModel {
  List<ResponseProfileModel> responseProfileModel;
  int status;

  PoranProfileModel({
    required this.responseProfileModel,
    required this.status,
  });

  factory PoranProfileModel.fromJson(Map<String, dynamic> json) => PoranProfileModel(
    responseProfileModel: List<ResponseProfileModel>.from(json["response_profile_model"].map((x) => ResponseProfileModel.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "response_profile_model": List<dynamic>.from(responseProfileModel.map((x) => x.toJson())),
    "status": status,
  };
}

class ResponseProfileModel {
  int id;
  String title;
  String content;
  String gambar;
  String ditujukan;
  Author author;
  int authorId;
  int likeJumlah;
  int commentJumlah;
  DateTime createdAt;
  DateTime updatedAt;
  bool liked;

  ResponseProfileModel({
    required this.id,
    required this.title,
    required this.content,
    required this.gambar,
    required this.ditujukan,
    required this.author,
    required this.authorId,
    required this.likeJumlah,
    required this.commentJumlah,
    required this.createdAt,
    required this.updatedAt,
    required this.liked,
  });

  factory ResponseProfileModel.fromJson(Map<String, dynamic> json) => ResponseProfileModel(
    id: json["id"],
    title: json["title"],
    content: json["content"],
    gambar: json["gambar"],
    ditujukan: json["ditujukan"],
    author: Author.fromJson(json["author"]),
    authorId: json["author_id"],
    likeJumlah: json["like_jumlah"],
    commentJumlah: json["comment_jumlah"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    liked: json["liked"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "content": content,
    "gambar": gambar,
    "ditujukan": ditujukan,
    "author": author.toJson(),
    "author_id": authorId,
    "like_jumlah": likeJumlah,
    "comment_jumlah": commentJumlah,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "liked": liked,
  };
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
