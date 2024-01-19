// To parse this JSON data, do
//
//     final checkLikeModel = checkLikeModelFromJson(jsonString);

import 'dart:convert';

CheckLikeModel checkLikeModelFromJson(String str) => CheckLikeModel.fromJson(json.decode(str));

String checkLikeModelToJson(CheckLikeModel data) => json.encode(data.toJson());

class CheckLikeModel {
  bool exist;
  List<ResponseLike> responseLike;
  int status;

  CheckLikeModel({
    required this.exist,
    required this.responseLike,
    required this.status,
  });

  factory CheckLikeModel.fromJson(Map<String, dynamic> json) => CheckLikeModel(
    exist: json["exist"],
    responseLike: List<ResponseLike>.from(json["response_like"].map((x) => ResponseLike.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "exist": exist,
    "response_like": List<dynamic>.from(responseLike.map((x) => x.toJson())),
    "status": status,
  };
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
