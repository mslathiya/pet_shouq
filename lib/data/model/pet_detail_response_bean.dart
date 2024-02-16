// To parse this JSON data, do
//
//     final petDetailResponseBean = petDetailResponseBeanFromJson(jsonString);

import 'dart:convert';

PetDetailResponseBean petDetailResponseBeanFromJson(String str) =>
    PetDetailResponseBean.fromJson(json.decode(str));

String petDetailResponseBeanToJson(PetDetailResponseBean data) =>
    json.encode(data.toJson());

class PetDetailResponseBean {
  bool? success;
  String? message;
  PetInformation? data;

  PetDetailResponseBean({
    this.success,
    this.message,
    this.data,
  });

  factory PetDetailResponseBean.fromJson(Map<String, dynamic> json) =>
      PetDetailResponseBean(
        success: json["success"],
        message: json["message"],
        data:
            json["data"] == null ? null : PetInformation.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class PetInformation {
  int? petId;
  int? parentId;
  int? userId;
  String? petName;
  String? petBreed;
  String? petColor;
  String? petHeight;
  String? petWeight;
  DateTime? petDob;
  String? petProfilePhoto;
  String? petAllergies;
  String? petIsNeutered;
  String? petPedigreeInfoFrontside;
  String? petPedigreeInfoBackside;
  String? petMicrochipNumber;
  String? petTakecareAddress;
  String? petQrCodeNumber;
  String? petDescription;
  String? fullProfileImageUrl;
  String? petSpecialNeed;

  PetInformation({
    this.petId,
    this.parentId,
    this.userId,
    this.petName,
    this.petBreed,
    this.petColor,
    this.petHeight,
    this.petWeight,
    this.petDob,
    this.petProfilePhoto,
    this.petAllergies,
    this.petIsNeutered,
    this.petPedigreeInfoFrontside,
    this.petPedigreeInfoBackside,
    this.petMicrochipNumber,
    this.petTakecareAddress,
    this.petQrCodeNumber,
    this.petDescription,
    this.fullProfileImageUrl,
    this.petSpecialNeed,
  });

  factory PetInformation.fromJson(Map<String, dynamic> json) => PetInformation(
        petId: json["pet_id"],
        parentId: json["parent_id"],
        userId: json["user_id"],
        petName: json["pet_name"],
        petBreed: json["pet_breed"],
        petColor: json["pet_color"],
        petHeight: json["pet_height"],
        petWeight: json["pet_weight"],
        petDob:
            json["pet_dob"] == null ? null : DateTime.parse(json["pet_dob"]),
        petProfilePhoto: json["pet_profile_photo"],
        petAllergies: json["pet_allergies"],
        petIsNeutered: json["pet_is_neutered"],
        petPedigreeInfoFrontside: json["pet_pedigree_info_frontside"],
        petPedigreeInfoBackside: json["pet_pedigree_info_backside"],
        petMicrochipNumber: json["pet_microchip_number"],
        petTakecareAddress: json["pet_takecare_address"],
        petQrCodeNumber: json["pet_qr_code_number"],
        petDescription: json["pet_description"],
        fullProfileImageUrl: json["full_profile_image_url"],
        petSpecialNeed: json["pet_special_need"],
      );

  Map<String, dynamic> toJson() => {
        "pet_id": petId,
        "parent_id": parentId,
        "user_id": userId,
        "pet_name": petName,
        "pet_breed": petBreed,
        "pet_color": petColor,
        "pet_height": petHeight,
        "pet_weight": petWeight,
        "pet_dob":
            "${petDob!.year.toString().padLeft(4, '0')}-${petDob!.month.toString().padLeft(2, '0')}-${petDob!.day.toString().padLeft(2, '0')}",
        "pet_profile_photo": petProfilePhoto,
        "pet_allergies": petAllergies,
        "pet_is_neutered": petIsNeutered,
        "pet_pedigree_info_frontside": petPedigreeInfoFrontside,
        "pet_pedigree_info_backside": petPedigreeInfoBackside,
        "pet_microchip_number": petMicrochipNumber,
        "pet_takecare_address": petTakecareAddress,
        "pet_qr_code_number": petQrCodeNumber,
        "pet_description": petDescription,
        "full_profile_image_url": fullProfileImageUrl,
        "pet_special_need": petSpecialNeed,
      };
}
