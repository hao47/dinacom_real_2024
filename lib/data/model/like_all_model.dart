// To parse this JSON data, do
//
//     final getLikeModel = getLikeModelFromJson(jsonString);

import 'dart:convert';

GetLikeModel getLikeModelFromJson(String str) => GetLikeModel.fromJson(json.decode(str));


class GetLikeModel {
  List<ResponseLike> responseLike;
  int status;

  GetLikeModel({
    required this.responseLike,
    required this.status,
  });

  factory GetLikeModel.fromJson(Map<String, dynamic> json) => GetLikeModel(
    responseLike: List<ResponseLike>.from(json["response_like"].map((x) => ResponseLike.fromJson(x))),
    status: json["status"],
  );


}

class ResponseLike {
  int id;
  int userId;
  int postId;
  DateTime createdAt;
  DateTime updatedAt;

  ResponseLike({
    required this.id,
    required this.userId,
    required this.postId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ResponseLike.fromJson(Map<String, dynamic> json) => ResponseLike(
    id: json["id"],
    userId: json["user_id"],
    postId: json["post_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );


}
