import 'dart:convert';

import 'medication_type_bean.dart';
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
  String? mediName;
  String? mediPreVeterinarian;
  int? mediType;
  DateTime? mediStartDate;
  DateTime? mediEndDate;
  String? mediPetSpecies;
  MedicationType? typeDetail;

  MedicationBean({
    this.mediId,
    this.mediName,
    this.mediPreVeterinarian,
    this.mediType,
    this.mediStartDate,
    this.mediEndDate,
    this.mediPetSpecies,
    this.typeDetail,
  });

  factory MedicationBean.fromJson(Map<String, dynamic> json) => MedicationBean(
        mediId: json["medi_id"],
        mediName: json["medi_name"],
        mediPreVeterinarian: json["medi_pre_veterinarian"],
        mediType: json["medi_type"],
        mediStartDate: json["medi_start_date"] == null
            ? null
            : DateTime.parse(json["medi_start_date"]),
        mediEndDate: json["medi_end_date"] == null
            ? null
            : DateTime.parse(json["medi_end_date"]),
        mediPetSpecies: json["medi_pet_species"],
        typeDetail: json["type_detail"] == null
            ? null
            : MedicationType.fromJson(json["type_detail"]),
      );

  Map<String, dynamic> toJson() => {
        "medi_id": mediId,
        "medi_name": mediName,
        "medi_pre_veterinarian": mediPreVeterinarian,
        "medi_type": mediType,
        "medi_start_date":
            "${mediStartDate!.year.toString().padLeft(4, '0')}-${mediStartDate!.month.toString().padLeft(2, '0')}-${mediStartDate!.day.toString().padLeft(2, '0')}",
        "medi_end_date":
            "${mediEndDate!.year.toString().padLeft(4, '0')}-${mediEndDate!.month.toString().padLeft(2, '0')}-${mediEndDate!.day.toString().padLeft(2, '0')}",
        "medi_pet_species": mediPetSpecies,
        "type_detail": typeDetail?.toJson(),
      };
}
