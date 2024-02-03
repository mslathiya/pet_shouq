// To parse this JSON data, do
//
//     final dietLogListResponseBean = dietLogListResponseBeanFromJson(jsonString);

import 'dart:convert';

import 'meta_bean.dart';

DietLogListResponseBean dietLogListResponseBeanFromJson(String str) =>
    DietLogListResponseBean.fromJson(json.decode(str));

String dietLogListResponseBeanToJson(DietLogListResponseBean data) =>
    json.encode(data.toJson());

class DietLogListResponseBean {
  bool? success;
  String? message;
  DietInfo? data;

  DietLogListResponseBean({
    this.success,
    this.message,
    this.data,
  });

  factory DietLogListResponseBean.fromJson(Map<String, dynamic> json) =>
      DietLogListResponseBean(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : DietInfo.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class DietInfo {
  List<DietLogInfo>? data;
  Meta? meta;

  DietInfo({
    this.data,
    this.meta,
  });

  factory DietInfo.fromJson(Map<String, dynamic> json) => DietInfo(
        data: json["data"] == null
            ? []
            : List<DietLogInfo>.from(
                json["data"]!.map((x) => DietLogInfo.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class DietLogInfo {
  int? dietId;
  String? dietFoodName;
  DateTime? dietDate;
  String? dietWater;

  DietLogInfo({
    this.dietId,
    this.dietFoodName,
    this.dietDate,
    this.dietWater,
  });

  factory DietLogInfo.fromJson(Map<String, dynamic> json) => DietLogInfo(
        dietId: json["diet_id"],
        dietFoodName: json["diet_food_name"],
        dietDate: json["diet_date"] == null
            ? null
            : DateTime.parse(json["diet_date"]),
        dietWater: json["diet_water"],
      );

  Map<String, dynamic> toJson() => {
        "diet_id": dietId,
        "diet_food_name": dietFoodName,
        "diet_date":
            "${dietDate!.year.toString().padLeft(4, '0')}-${dietDate!.month.toString().padLeft(2, '0')}-${dietDate!.day.toString().padLeft(2, '0')}",
        "diet_water": dietWater,
      };
}
