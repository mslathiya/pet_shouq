// To parse this JSON data, do
//
//     final vetDetailsResponseModel = vetDetailsResponseModelFromJson(jsonString);

import 'dart:convert';

VetDetailsResponseModel vetDetailsResponseModelFromJson(String str) => VetDetailsResponseModel.fromJson(json.decode(str));

String vetDetailsResponseModelToJson(VetDetailsResponseModel data) => json.encode(data.toJson());

class VetDetailsResponseModel {
  bool? success;
  String? message;
  VetDetailsData? data;

  VetDetailsResponseModel({
    this.success,
    this.message,
    this.data,
  });

  factory VetDetailsResponseModel.fromJson(Map<String, dynamic> json) => VetDetailsResponseModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : VetDetailsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class VetDetailsData {
  int? veterinarianId;
  String? vetFname;
  String? vetLname;
  String? vetSpeciality;
  dynamic vetAddress;
  dynamic vetClinicPhoto;
  String? fullVetDocumentUrl;
  String? fullClinicPhotoPath;

  VetDetailsData({
    this.veterinarianId,
    this.vetFname,
    this.vetLname,
    this.vetSpeciality,
    this.vetAddress,
    this.vetClinicPhoto,
    this.fullVetDocumentUrl,
    this.fullClinicPhotoPath,
  });

  factory VetDetailsData.fromJson(Map<String, dynamic> json) => VetDetailsData(
    veterinarianId: json["veterinarian_id"],
    vetFname: json["vet_fname"],
    vetLname: json["vet_lname"],
    vetSpeciality: json["vet_speciality"],
    vetAddress: json["vet_address"],
    vetClinicPhoto: json["vet_clinic_photo"],
    fullVetDocumentUrl: json["full_vet_document_url"],
    fullClinicPhotoPath: json["full_clinic_photo_path"],
  );

  Map<String, dynamic> toJson() => {
    "veterinarian_id": veterinarianId,
    "vet_fname": vetFname,
    "vet_lname": vetLname,
    "vet_speciality": vetSpeciality,
    "vet_address": vetAddress,
    "vet_clinic_photo": vetClinicPhoto,
    "full_vet_document_url": fullVetDocumentUrl,
    "full_clinic_photo_path": fullClinicPhotoPath,
  };
}
