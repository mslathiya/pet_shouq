// To parse this JSON data, do
//
//     final vaccinationDetailResponseBean = vaccinationDetailResponseBeanFromJson(jsonString);

import 'dart:convert';

import 'pet_info_bean.dart';

VaccinationDetailResponseBean vaccinationDetailResponseBeanFromJson(
        String str) =>
    VaccinationDetailResponseBean.fromJson(json.decode(str));

String vaccinationDetailResponseBeanToJson(
        VaccinationDetailResponseBean data) =>
    json.encode(data.toJson());

class VaccinationDetailResponseBean {
  bool? success;
  String? message;
  VaccinationDetail? data;

  VaccinationDetailResponseBean({
    this.success,
    this.message,
    this.data,
  });

  factory VaccinationDetailResponseBean.fromJson(Map<String, dynamic> json) =>
      VaccinationDetailResponseBean(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : VaccinationDetail.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class VaccinationDetail {
  int? vacId;
  int? petId;
  String? vacPetSpecies;
  String? vacName;
  String? vacType;
  DateTime? vacDate;
  DateTime? vacDueDate;
  String? vacProvider;
  String? vacLotNumber;
  String? vacCertificateId;
  PetItemBean? pet;

  VaccinationDetail({
    this.vacId,
    this.petId,
    this.vacPetSpecies,
    this.vacName,
    this.vacType,
    this.vacDate,
    this.vacDueDate,
    this.vacProvider,
    this.vacLotNumber,
    this.vacCertificateId,
    this.pet,
  });

  factory VaccinationDetail.fromJson(Map<String, dynamic> json) => VaccinationDetail(
        vacId: json["vac_id"],
        petId: json["pet_id"],
        vacPetSpecies: json["vac_pet_species"],
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
        pet: json["pet"] == null ? null : PetItemBean.fromJson(json["pet"]),
      );

  Map<String, dynamic> toJson() => {
        "vac_id": vacId,
        "pet_id": petId,
        "vac_pet_species": vacPetSpecies,
        "vac_name": vacName,
        "vac_type": vacType,
        "vac_date":
            "${vacDate!.year.toString().padLeft(4, '0')}-${vacDate!.month.toString().padLeft(2, '0')}-${vacDate!.day.toString().padLeft(2, '0')}",
        "vac_due_date":
            "${vacDueDate!.year.toString().padLeft(4, '0')}-${vacDueDate!.month.toString().padLeft(2, '0')}-${vacDueDate!.day.toString().padLeft(2, '0')}",
        "vac_provider": vacProvider,
        "vac_lot_number": vacLotNumber,
        "vac_certificate_id": vacCertificateId,
        "pet": pet?.toJson(),
      };
}
