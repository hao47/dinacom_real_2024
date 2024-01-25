// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  List<Post> posts;

  SearchModel({
    required this.posts,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
  };
}

class Post {
  int id;
  String content;
  String gambar;
  String ditujukan;
  String title;
  Author author;
  int authorId;
  int likeJumlah;
  int commentJumlah;
  DateTime createdAt;
  DateTime updatedAt;
  bool liked;

  Post({
    required this.id,
    required this.content,
    required this.gambar,
    required this.ditujukan,
    required this.author,
    required this.title,
    required this.authorId,
    required this.likeJumlah,
    required this.commentJumlah,
    required this.createdAt,
    required this.updatedAt,
    required this.liked,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    content: json["content"],
    gambar: json["gambar"],
    ditujukan: json["ditujukan"],
    author: Author.fromJson(json["author"]),
    authorId: json["author_id"],
    title: json["title"],
    likeJumlah: json["like_jumlah"],
    commentJumlah: json["comment_jumlah"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    liked: json["liked"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
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
  String tanggalLahir;
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
    tanggalLahir: json["tanggal_lahir"],
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
    "tanggal_lahir": tanggalLahir,
    "daerah": daerah,
    "role": role,
    "VerHash": verHash,
    "Timeout": timeout.toIso8601String(),
    "IsActive": isActive,
    "CreatedAt": createdAt.toIso8601String(),
    "bio": bio,
  };
}
