// To parse this JSON data, do
//
//     final medicationDetailResponseBean = medicationDetailResponseBeanFromJson(jsonString);

import 'dart:convert';

import 'pet_info_bean.dart';

MedicationDetailResponseBean medicationDetailResponseBeanFromJson(String str) =>
    MedicationDetailResponseBean.fromJson(json.decode(str));

String medicationDetailResponseBeanToJson(MedicationDetailResponseBean data) =>
    json.encode(data.toJson());

class MedicationDetailResponseBean {
  bool? success;
  String? message;
  MedicationInfo? data;

  MedicationDetailResponseBean({
    this.success,
    this.message,
    this.data,
  });

  factory MedicationDetailResponseBean.fromJson(Map<String, dynamic> json) =>
      MedicationDetailResponseBean(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : MedicationInfo.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class MedicationInfo {
  int? mediId;
  int? petId;
  String? mediName;
  int? mediType;
  String? mediPreVeterinarian;
  String? mediPetSpecies;
  String? mediDosage;
  String? mediFrequency;
  String? mediDuration;
  String? mediReasonPrescription;
  String? mediAdminInstruction;
  DateTime? mediStartDate;
  DateTime? mediEndDate;
  String? mediRefills;
  String? mediSpecialNotes;
  PetItemBean? pet;

  MedicationInfo({
    this.mediId,
    this.petId,
    this.mediName,
    this.mediType,
    this.mediPreVeterinarian,
    this.mediPetSpecies,
    this.mediDosage,
    this.mediFrequency,
    this.mediDuration,
    this.mediReasonPrescription,
    this.mediAdminInstruction,
    this.mediStartDate,
    this.mediEndDate,
    this.mediRefills,
    this.mediSpecialNotes,
    this.pet,
  });

  factory MedicationInfo.fromJson(Map<String, dynamic> json) => MedicationInfo(
        mediId: json["medi_id"],
        petId: json["pet_id"],
        mediName: json["medi_name"],
        mediType: json["medi_type"],
        mediPreVeterinarian: json["medi_pre_veterinarian"],
        mediPetSpecies: json["medi_pet_species"],
        mediDosage: json["medi_dosage"],
        mediFrequency: json["medi_frequency"],
        mediDuration: json["medi_duration"],
        mediReasonPrescription: json["medi_reason_prescription"],
        mediAdminInstruction: json["medi_admin_instruction"],
        mediStartDate: json["medi_start_date"] == null
            ? null
            : DateTime.parse(json["medi_start_date"]),
        mediEndDate: json["medi_end_date"] == null
            ? null
            : DateTime.parse(json["medi_end_date"]),
        mediRefills: json["medi_refills"],
        mediSpecialNotes: json["medi_special_notes"],
        pet: json["pet"] == null ? null : PetItemBean.fromJson(json["pet"]),
      );

  Map<String, dynamic> toJson() => {
        "medi_id": mediId,
        "pet_id": petId,
        "medi_name": mediName,
        "medi_type": mediType,
        "medi_pre_veterinarian": mediPreVeterinarian,
        "medi_pet_species": mediPetSpecies,
        "medi_dosage": mediDosage,
        "medi_frequency": mediFrequency,
        "medi_duration": mediDuration,
        "medi_reason_prescription": mediReasonPrescription,
        "medi_admin_instruction": mediAdminInstruction,
        "medi_start_date":
            "${mediStartDate!.year.toString().padLeft(4, '0')}-${mediStartDate!.month.toString().padLeft(2, '0')}-${mediStartDate!.day.toString().padLeft(2, '0')}",
        "medi_end_date":
            "${mediEndDate!.year.toString().padLeft(4, '0')}-${mediEndDate!.month.toString().padLeft(2, '0')}-${mediEndDate!.day.toString().padLeft(2, '0')}",
        "medi_refills": mediRefills,
        "medi_special_notes": mediSpecialNotes,
        "pet": pet?.toJson(),
      };
}
