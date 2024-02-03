// To parse this JSON data, do
//
//     final dietDetailResponseBean = dietDetailResponseBeanFromJson(jsonString);

import 'dart:convert';

import 'pet_info_bean.dart';

DietDetailResponseBean dietDetailResponseBeanFromJson(String str) =>
    DietDetailResponseBean.fromJson(json.decode(str));

String dietDetailResponseBeanToJson(DietDetailResponseBean data) =>
    json.encode(data.toJson());

class DietDetailResponseBean {
  bool? success;
  String? message;
  DietDetailBean? data;

  DietDetailResponseBean({
    this.success,
    this.message,
    this.data,
  });

  factory DietDetailResponseBean.fromJson(Map<String, dynamic> json) =>
      DietDetailResponseBean(
        success: json["success"],
        message: json["message"],
        data:
            json["data"] == null ? null : DietDetailBean.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class DietDetailBean {
  int? dietId;
  int? petId;
  String? dietFoodName;
  DateTime? dietDate;
  String? dietTime;
  String? dietPortionSize;
  String? dietSpecialInstructions;
  String? dietWater;
  String? dietWeight;
  PetItemBean? pet;

  DietDetailBean({
    this.dietId,
    this.petId,
    this.dietFoodName,
    this.dietDate,
    this.dietTime,
    this.dietPortionSize,
    this.dietSpecialInstructions,
    this.dietWater,
    this.dietWeight,
    this.pet,
  });

  factory DietDetailBean.fromJson(Map<String, dynamic> json) => DietDetailBean(
        dietId: json["diet_id"],
        petId: json["pet_id"],
        dietFoodName: json["diet_food_name"],
        dietDate: json["diet_date"] == null
            ? null
            : DateTime.parse(json["diet_date"]),
        dietTime: json["diet_time"],
        dietPortionSize: json["diet_portion_size"],
        dietSpecialInstructions: json["diet_special_instructions"],
        dietWater: json["diet_water"],
        dietWeight: json["diet_weight"],
        pet: json["pet"] == null ? null : PetItemBean.fromJson(json["pet"]),
      );

  Map<String, dynamic> toJson() => {
        "diet_id": dietId,
        "pet_id": petId,
        "diet_food_name": dietFoodName,
        "diet_date":
            "${dietDate!.year.toString().padLeft(4, '0')}-${dietDate!.month.toString().padLeft(2, '0')}-${dietDate!.day.toString().padLeft(2, '0')}",
        "diet_time": dietTime,
        "diet_portion_size": dietPortionSize,
        "diet_special_instructions": dietSpecialInstructions,
        "diet_water": dietWater,
        "diet_weight": dietWeight,
        "pet": pet?.toJson(),
      };
}
