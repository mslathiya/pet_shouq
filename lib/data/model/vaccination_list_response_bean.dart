import 'dart:convert';

import 'meta_bean.dart';

VaccinationListResponseBean vaccinationListResponseBeanFromJson(String str) =>
    VaccinationListResponseBean.fromJson(json.decode(str));

String vaccinationListResponseBeanToJson(VaccinationListResponseBean data) =>
    json.encode(data.toJson());

class VaccinationListResponseBean {
  bool? success;
  String? message;
  VaccinationData? data;

  VaccinationListResponseBean({
    this.success,
    this.message,
    this.data,
  });

  factory VaccinationListResponseBean.fromJson(Map<String, dynamic> json) =>
      VaccinationListResponseBean(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : VaccinationData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class VaccinationData {
  List<VaccinationBean>? data;
  Meta? meta;

  VaccinationData({
    this.data,
    this.meta,
  });

  factory VaccinationData.fromJson(Map<String, dynamic> json) =>
      VaccinationData(
        data: json["data"] == null
            ? []
            : List<VaccinationBean>.from(
                json["data"]!.map((x) => VaccinationBean.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class VaccinationBean {
  int? vacId;
  String? vacName;
  String? vacType;
  DateTime? vacDate;
  DateTime? vacDueDate;
  String? vacProvider;
  String? vacLotNumber;
  String? vacCertificateId;

  VaccinationBean({
    this.vacId,
    this.vacName,
    this.vacType,
    this.vacDate,
    this.vacDueDate,
    this.vacProvider,
    this.vacLotNumber,
    this.vacCertificateId,
  });

  factory VaccinationBean.fromJson(Map<String, dynamic> json) =>
      VaccinationBean(
        vacId: json["vac_id"],
        vacName: json["vac_name"],
        vacType: json["vac_type"],
        vacDate:
            json["vac_date"] == null ? null : DateTime.parse(json["vac_date"]),
        vacDueDate: json["vac_due_date"] == null
            ? null
            : DateTime.parse(json["vac_due_date"]),
        vacProvider: json["vac_provider"],
        vacLotNumber: json["vac_lot_number"],
        vacCertificateId: json["vac_certificate_id"],
      );

  Map<String, dynamic> toJson() => {
        "vac_id": vacId,
        "vac_name": vacName,
        "vac_type": vacType,
        "vac_date":
            "${vacDate!.year.toString().padLeft(4, '0')}-${vacDate!.month.toString().padLeft(2, '0')}-${vacDate!.day.toString().padLeft(2, '0')}",
        "vac_due_date":
            "${vacDueDate!.year.toString().padLeft(4, '0')}-${vacDueDate!.month.toString().padLeft(2, '0')}-${vacDueDate!.day.toString().padLeft(2, '0')}",
        "vac_provider": vacProvider,
        "vac_lot_number": vacLotNumber,
        "vac_certificate_id": vacCertificateId,
      };
}
