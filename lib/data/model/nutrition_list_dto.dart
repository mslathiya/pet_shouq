import 'dart:convert';

import 'meta_bean.dart';

NutritionListResponseBean nutritionListResponseBeanFromJson(String str) =>
    NutritionListResponseBean.fromJson(json.decode(str));

String nutritionListResponseBeanToJson(NutritionListResponseBean data) =>
    json.encode(data.toJson());

class NutritionListResponseBean {
  bool? success;
  String? message;
  Data? data;

  NutritionListResponseBean({
    this.success,
    this.message,
    this.data,
  });

  factory NutritionListResponseBean.fromJson(Map<String, dynamic> json) =>
      NutritionListResponseBean(
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
  List<NutritionBean>? data;
  Meta? meta;

  Data({
    this.data,
    this.meta,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: json["data"] == null
            ? []
            : List<NutritionBean>.from(
                json["data"]!.map((x) => NutritionBean.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class NutritionBean {
  int? nutId;
  String? nutFoodName;
  String? nutFoodType;
  String? nutLifeStage;
  String? nutBrand;
  String? nutSpecies;
  String? nutPrice;

  NutritionBean({
    this.nutId,
    this.nutFoodName,
    this.nutFoodType,
    this.nutLifeStage,
    this.nutBrand,
    this.nutSpecies,
    this.nutPrice,
  });

  factory NutritionBean.fromJson(Map<String, dynamic> json) => NutritionBean(
        nutId: json["nut_id"],
        nutFoodName: json["nut_food_name"],
        nutFoodType: json["nut_food_type"],
        nutLifeStage: json["nut_life_stage"],
        nutBrand: json["nut_brand"],
        nutSpecies: json["nut_species"],
        nutPrice: json["nut_price"],
      );

  Map<String, dynamic> toJson() => {
        "nut_id": nutId,
        "nut_food_name": nutFoodName,
        "nut_food_type": nutFoodType,
        "nut_life_stage": nutLifeStage,
        "nut_brand": nutBrand,
        "nut_species": nutSpecies,
        "nut_price": nutPrice,
      };
}
