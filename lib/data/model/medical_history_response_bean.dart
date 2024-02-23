import 'dart:convert';

import 'pet_info_bean.dart';

MedicalHistoryResponseBean medicalHistoryResponseBeanFromJson(String str) =>
    MedicalHistoryResponseBean.fromJson(json.decode(str));

String medicalHistoryResponseBeanToJson(MedicalHistoryResponseBean data) =>
    json.encode(data.toJson());

class MedicalHistoryResponseBean {
  bool? success;
  String? message;
  HistoryDetails? data;

  MedicalHistoryResponseBean({
    this.success,
    this.message,
    this.data,
  });

  factory MedicalHistoryResponseBean.fromJson(Map<String, dynamic> json) =>
      MedicalHistoryResponseBean(
        success: json["success"],
        message: json["message"],
        data:
            json["data"] == null ? null : HistoryDetails.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class HistoryDetails {
  int? mhId;
  int? petId;
  TypeList? typeList;
  PetItemBean? pet;

  HistoryDetails({
    this.mhId,
    this.petId,
    this.typeList,
    this.pet,
  });

  factory HistoryDetails.fromJson(Map<String, dynamic> json) => HistoryDetails(
        mhId: json["mh_id"],
        petId: json["pet_id"],
        typeList: json["typeList"] == null
            ? null
            : TypeList.fromJson(json["typeList"]),
        pet: json["pet"] == null ? null : PetItemBean.fromJson(json["pet"]),
      );

  Map<String, dynamic> toJson() => {
        "mh_id": mhId,
        "pet_id": petId,
        "typeList": typeList?.toJson(),
        "pet": pet?.toJson(),
      };
}

class TypeList {
  List<HistoryDataItem>? medications;

  TypeList({
    this.medications,
  });

  factory TypeList.fromJson(Map<String, dynamic> json) => TypeList(
        medications: json["medications"] == null
            ? []
            : List<HistoryDataItem>.from(
                json["medications"]!.map((x) => HistoryDataItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "medications": medications == null
            ? []
            : List<dynamic>.from(medications!.map((x) => x.toJson())),
      };
}

class HistoryDataItem {
  int? mhtId;
  int? mhId;
  String? mhtTypeTitle;
  String? mhtLabel;
  String? mhtValue;

  HistoryDataItem({
    this.mhtId,
    this.mhId,
    this.mhtTypeTitle,
    this.mhtLabel,
    this.mhtValue,
  });

  factory HistoryDataItem.fromJson(Map<String, dynamic> json) =>
      HistoryDataItem(
        mhtId: json["mht_id"],
        mhId: json["mh_id"],
        mhtTypeTitle: json["mht_type_title"],
        mhtLabel: json["mht_label"],
        mhtValue: json["mht_value"],
      );

  Map<String, dynamic> toJson() => {
        "mht_id": mhtId,
        "mh_id": mhId,
        "mht_type_title": mhtTypeTitle,
        "mht_label": mhtLabel,
        "mht_value": mhtValue,
      };
}
