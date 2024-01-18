// To parse this JSON data, do
//
//     final getLikeModel = getLikeModelFromJson(jsonString);

import 'dart:convert';

GetLikeModel getLikeModelFromJson(String str) => GetLikeModel.fromJson(json.decode(str));

// String getLikeModelToJson(GetLikeModel data) => json.encode(data.toJson());

class GetLikeModel {
  ResponseLike? responseLike;
  int status;

  GetLikeModel({
     this.responseLike,
    required this.status,
  });

  factory GetLikeModel.fromJson(Map<String, dynamic> json) => GetLikeModel(
    responseLike: ResponseLike.fromJson(json["response_like"]),
    status: json["status"],
  );

  // Map<String, dynamic> toJson() => {
  //   "response_like": responseLike.toJson(),
  //   "status": status,
  // };
}

class ResponseLike {
  int id;
  int userId;
  int postId;
  int userIdLike;
  DateTime createdAt;
  DateTime updatedAt;

  ResponseLike({
    required this.id,
    required this.userId,
    required this.postId,
    required this.userIdLike,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ResponseLike.fromJson(Map<String, dynamic> json) => ResponseLike(
    id: json["id"],
    userId: json["user_id"],
    postId: json["post_id"],
    userIdLike: json["user_id_like"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "post_id": postId,
    "user_id_like": userIdLike,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
