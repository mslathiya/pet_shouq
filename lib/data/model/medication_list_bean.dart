// To parse this JSON data, do
//
//     final medicationListResponseBean = medicationListResponseBeanFromJson(jsonString);

import 'dart:convert';

import 'meta_bean.dart';

MedicationListResponseBean medicationListResponseBeanFromJson(String str) =>
    MedicationListResponseBean.fromJson(json.decode(str));

String medicationListResponseBeanToJson(MedicationListResponseBean data) =>
    json.encode(data.toJson());

class MedicationListResponseBean {
  bool? success;
  String? message;
  MedicationData? data;

  MedicationListResponseBean({
    this.success,
    this.message,
    this.data,
  });

  factory MedicationListResponseBean.fromJson(Map<String, dynamic> json) =>
      MedicationListResponseBean(
        success: json["success"],
        message: json["message"],
        data:
            json["data"] == null ? null : MedicationData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class MedicationData {
  List<MedicationBean>? data;
  Meta? meta;

  MedicationData({
    this.data,
    this.meta,
  });

  factory MedicationData.fromJson(Map<String, dynamic> json) => MedicationData(
        data: json["data"] == null
            ? []
            : List<MedicationBean>.from(
                json["data"]!.map((x) => MedicationBean.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class MedicationBean {
  int? mediId;
  String? mediPreVeterinarian;
  DateTime? mediStartDate;
  DateTime? mediEndDate;
  String? mediPetSpecies;

  MedicationBean({
    this.mediId,
    this.mediPreVeterinarian,
    this.mediStartDate,
    this.mediEndDate,
    this.mediPetSpecies,
  });

  factory MedicationBean.fromJson(Map<String, dynamic> json) => MedicationBean(
        mediId: json["medi_id"],
        mediPreVeterinarian: json["medi_pre_veterinarian"],
        mediStartDate: json["medi_start_date"] == null
            ? null
            : DateTime.parse(json["medi_start_date"]),
        mediEndDate: json["medi_end_date"] == null
            ? null
            : DateTime.parse(json["medi_end_date"]),
        mediPetSpecies: json["medi_pet_species"],
      );

  Map<String, dynamic> toJson() => {
        "medi_id": mediId,
        "medi_pre_veterinarian": mediPreVeterinarian,
        "medi_start_date":
            "${mediStartDate!.year.toString().padLeft(4, '0')}-${mediStartDate!.month.toString().padLeft(2, '0')}-${mediStartDate!.day.toString().padLeft(2, '0')}",
        "medi_end_date":
            "${mediEndDate!.year.toString().padLeft(4, '0')}-${mediEndDate!.month.toString().padLeft(2, '0')}-${mediEndDate!.day.toString().padLeft(2, '0')}",
        "medi_pet_species": mediPetSpecies,
      };
}
