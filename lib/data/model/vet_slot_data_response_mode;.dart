// To parse this JSON data, do
//
//     final slotListResponseModel = slotListResponseModelFromJson(jsonString);

import 'dart:convert';

SlotListResponseModel slotListResponseModelFromJson(String str) => SlotListResponseModel.fromJson(json.decode(str));

String slotListResponseModelToJson(SlotListResponseModel data) => json.encode(data.toJson());

class SlotListResponseModel {
  bool? success;
  String? message;
  List<VetSlotDataList>? data;

  SlotListResponseModel({
    this.success,
    this.message,
    this.data,
  });

  factory SlotListResponseModel.fromJson(Map<String, dynamic> json) => SlotListResponseModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<VetSlotDataList>.from(json["data"]!.map((x) => VetSlotDataList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class VetSlotDataList {
  int? vaId;
  int? vetId;
  String? vaDayOfWeek;
  String? vaStartTime;
  String? vaEndTime;
  bool? isAvailable;

  VetSlotDataList({
    this.vaId,
    this.vetId,
    this.vaDayOfWeek,
    this.vaStartTime,
    this.vaEndTime,
    this.isAvailable,
  });

  factory VetSlotDataList.fromJson(Map<String, dynamic> json) => VetSlotDataList(
    vaId: json["va_id"],
    vetId: json["vet_id"],
    vaDayOfWeek: json["va_day_of_week"],
    vaStartTime: json["va_start_time"],
    vaEndTime: json["va_end_time"],
    isAvailable: json["is_available"],
  );

  Map<String, dynamic> toJson() => {
    "va_id": vaId,
    "vet_id": vetId,
    "va_day_of_week": vaDayOfWeek,
    "va_start_time": vaStartTime,
    "va_end_time": vaEndTime,
    "is_available": isAvailable,
  };
}
