import 'dart:convert';

import 'meta_bean.dart';
import 'pet_info_bean.dart';

MedicalHistoryListResponseBean medicalHistoryListResponseBeanFromJson(
        String str) =>
    MedicalHistoryListResponseBean.fromJson(json.decode(str));

String medicalHistoryListResponseBeanToJson(
        MedicalHistoryListResponseBean data) =>
    json.encode(data.toJson());

class MedicalHistoryListResponseBean {
  bool? success;
  String? message;
  HistoryListData? data;

  MedicalHistoryListResponseBean({
    this.success,
    this.message,
    this.data,
  });

  factory MedicalHistoryListResponseBean.fromJson(Map<String, dynamic> json) =>
      MedicalHistoryListResponseBean(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : HistoryListData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class HistoryListData {
  List<HistoryListItemBean>? data;
  Meta? meta;

  HistoryListData({
    this.data,
    this.meta,
  });

  factory HistoryListData.fromJson(Map<String, dynamic> json) =>
      HistoryListData(
        data: json["data"] == null
            ? []
            : List<HistoryListItemBean>.from(
                json["data"]!.map((x) => HistoryListItemBean.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class HistoryListItemBean {
  int? mhId;
  int? petId;
  DateTime? createdAt;
  String? mhGenerateId;
  PetItemBean? pet;

  HistoryListItemBean({
    this.mhId,
    this.petId,
    this.createdAt,
    this.mhGenerateId,
    this.pet,
  });

  factory HistoryListItemBean.fromJson(Map<String, dynamic> json) =>
      HistoryListItemBean(
        mhId: json["mh_id"],
        petId: json["pet_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        mhGenerateId: json["mh_generate_id"],
        pet: json["pet"] == null ? null : PetItemBean.fromJson(json["pet"]),
      );

  Map<String, dynamic> toJson() => {
        "mh_id": mhId,
        "pet_id": petId,
        "created_at": createdAt?.toIso8601String(),
        "mh_generate_id": mhGenerateId,
        "pet": pet?.toJson(),
      };
}
