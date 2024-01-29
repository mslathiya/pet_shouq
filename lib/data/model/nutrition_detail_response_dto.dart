// To parse this JSON data, do
//
//     final nutritionDetailResponseBean = nutritionDetailResponseBeanFromJson(jsonString);

import 'dart:convert';

import 'pet_info_bean.dart';

NutritionDetailResponseBean nutritionDetailResponseBeanFromJson(String str) =>
    NutritionDetailResponseBean.fromJson(json.decode(str));

String nutritionDetailResponseBeanToJson(NutritionDetailResponseBean data) =>
    json.encode(data.toJson());

class NutritionDetailResponseBean {
  bool? success;
  String? message;
  NutritionData? data;

  NutritionDetailResponseBean({
    this.success,
    this.message,
    this.data,
  });

  factory NutritionDetailResponseBean.fromJson(Map<String, dynamic> json) =>
      NutritionDetailResponseBean(
        success: json["success"],
        message: json["message"],
        data:
            json["data"] == null ? null : NutritionData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class NutritionData {
  int? nutId;
  int? petId;
  String? nutFoodName;
  String? nutBrand;
  String? nutFoodType;
  String? nutLifeStage;
  String? nutSpecies;
  String? nutIngredients;
  String? nutNutritionalContent;
  String? nutProtein;
  String? nutFat;
  String? nutCarbohydrate;
  String? nutFiber;
  String? nutCalories;
  String? nutVitamins;
  String? nutMinerals;
  String? nutOmega3Fatty;
  String? nutOmega6Fatty;
  String? nutFeedingGuidelines;
  String? nutSmallBreedPuppy;
  String? nutLargeBreedPuppy;
  String? nutSpecialFeatures;
  double? nutPrice;
  PetItemBean? pet;

  NutritionData({
    this.nutId,
    this.petId,
    this.nutFoodName,
    this.nutBrand,
    this.nutFoodType,
    this.nutLifeStage,
    this.nutSpecies,
    this.nutIngredients,
    this.nutNutritionalContent,
    this.nutProtein,
    this.nutFat,
    this.nutCarbohydrate,
    this.nutFiber,
    this.nutCalories,
    this.nutVitamins,
    this.nutMinerals,
    this.nutOmega3Fatty,
    this.nutOmega6Fatty,
    this.nutFeedingGuidelines,
    this.nutSmallBreedPuppy,
    this.nutLargeBreedPuppy,
    this.nutSpecialFeatures,
    this.nutPrice,
    this.pet,
  });

  factory NutritionData.fromJson(Map<String, dynamic> json) => NutritionData(
        nutId: json["nut_id"],
        petId: json["pet_id"],
        nutFoodName: json["nut_food_name"],
        nutBrand: json["nut_brand"],
        nutFoodType: json["nut_food_type"],
        nutLifeStage: json["nut_life_stage"],
        nutSpecies: json["nut_species"],
        nutIngredients: json["nut_ingredients"],
        nutNutritionalContent: json["nut_nutritional_content"],
        nutProtein: json["nut_protein"],
        nutFat: json["nut_fat"],
        nutCarbohydrate: json["nut_carbohydrate"],
        nutFiber: json["nut_fiber"],
        nutCalories: json["nut_calories"],
        nutVitamins: json["nut_vitamins"],
        nutMinerals: json["nut_minerals"],
        nutOmega3Fatty: json["nut_omega_3_fatty"],
        nutOmega6Fatty: json["nut_omega_6_fatty"],
        nutFeedingGuidelines: json["nut_feeding_guidelines"],
        nutSmallBreedPuppy: json["nut_small_breed_puppy"],
        nutLargeBreedPuppy: json["nut_large_breed_puppy"],
        nutSpecialFeatures: json["nut_special_features"],
        nutPrice: json["nut_price"]?.toDouble(),
        pet: json["pet"] == null ? null : PetItemBean.fromJson(json["pet"]),
      );

  Map<String, dynamic> toJson() => {
        "nut_id": nutId,
        "pet_id": petId,
        "nut_food_name": nutFoodName,
        "nut_brand": nutBrand,
        "nut_food_type": nutFoodType,
        "nut_life_stage": nutLifeStage,
        "nut_species": nutSpecies,
        "nut_ingredients": nutIngredients,
        "nut_nutritional_content": nutNutritionalContent,
        "nut_protein": nutProtein,
        "nut_fat": nutFat,
        "nut_carbohydrate": nutCarbohydrate,
        "nut_fiber": nutFiber,
        "nut_calories": nutCalories,
        "nut_vitamins": nutVitamins,
        "nut_minerals": nutMinerals,
        "nut_omega_3_fatty": nutOmega3Fatty,
        "nut_omega_6_fatty": nutOmega6Fatty,
        "nut_feeding_guidelines": nutFeedingGuidelines,
        "nut_small_breed_puppy": nutSmallBreedPuppy,
        "nut_large_breed_puppy": nutLargeBreedPuppy,
        "nut_special_features": nutSpecialFeatures,
        "nut_price": nutPrice,
        "pet": pet?.toJson(),
      };
}
