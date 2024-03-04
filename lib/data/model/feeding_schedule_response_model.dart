// To parse this JSON data, do
//
//     final feedingScheduleResponseModel = feedingScheduleResponseModelFromJson(jsonString);

import 'dart:convert';

FeedingScheduleResponseModel feedingScheduleResponseModelFromJson(String str) => FeedingScheduleResponseModel.fromJson(json.decode(str));

String feedingScheduleResponseModelToJson(FeedingScheduleResponseModel data) => json.encode(data.toJson());

class FeedingScheduleResponseModel {
  bool? success;
  String? message;
  Data? data;

  FeedingScheduleResponseModel({
    this.success,
    this.message,
    this.data,
  });

  factory FeedingScheduleResponseModel.fromJson(Map<String, dynamic> json) => FeedingScheduleResponseModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  List<FeedingScheduleList>? data;
  Meta? meta;

  Data({
    this.data,
    this.meta,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: json["data"] == null ? [] : List<FeedingScheduleList>.from(json["data"]!.map((x) => FeedingScheduleList.fromJson(x))),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "meta": meta?.toJson(),
  };
}

class FeedingScheduleList {
  int? fsId;
  String? fsTitle;
  String? fsTime;
  String? fsFrequency;
  int? petId;
  DateTime? createdAt;

  FeedingScheduleList({
    this.fsId,
    this.fsTitle,
    this.fsTime,
    this.fsFrequency,
    this.petId,
    this.createdAt,
  });

  factory FeedingScheduleList.fromJson(Map<String, dynamic> json) => FeedingScheduleList(
    fsId: json["fs_id"],
    fsTitle: json["fs_title"],
    fsTime: json["fs_time"],
    fsFrequency: json["fs_frequency"],
    petId: json["pet_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "fs_id": fsId,
    "fs_title": fsTitle,
    "fs_time": fsTime,
    "fs_frequency": fsFrequency,
    "pet_id": petId,
    "created_at": createdAt?.toIso8601String(),
  };
}

class Meta {
  int? currentPage;
  int? perPage;
  dynamic nextPageUrl;
  bool? haveMoreRecords;

  Meta({
    this.currentPage,
    this.perPage,
    this.nextPageUrl,
    this.haveMoreRecords,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"],
    perPage: json["per_page"],
    nextPageUrl: json["next_page_url"],
    haveMoreRecords: json["have_more_records"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "per_page": perPage,
    "next_page_url": nextPageUrl,
    "have_more_records": haveMoreRecords,
  };
}
