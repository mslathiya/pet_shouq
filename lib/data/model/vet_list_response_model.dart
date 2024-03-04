// To parse this JSON data, do
//
//     final vetListResponseModel = vetListResponseModelFromJson(jsonString);

import 'dart:convert';

VetListResponseModel vetListResponseModelFromJson(String str) =>
    VetListResponseModel.fromJson(json.decode(str));

String vetListResponseModelToJson(VetListResponseModel data) =>
    json.encode(data.toJson());

class VetListResponseModel {
  bool? success;
  String? message;
  Data? data;

  VetListResponseModel({
    this.success,
    this.message,
    this.data,
  });

  factory VetListResponseModel.fromJson(Map<String, dynamic> json) =>
      VetListResponseModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  List<VetDataDatum>? data;
  Meta? meta;

  Data({
    this.data,
    this.meta,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: json["data"] == null
            ? []
            : List<VetDataDatum>.from(json["data"]!.map((x) => VetDataDatum.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class VetDataDatum {
  int? veterinarianId;
  String? vetFname;
  String? vetLname;
  String? vetSpeciality;
  String? vetLatitude;
  String? vetLongitude;
  double? distance;
  String? fullVetDocumentUrl;
  String? fullClinicPhotoPath;

  VetDataDatum({
    this.veterinarianId,
    this.vetFname,
    this.vetLname,
    this.vetSpeciality,
    this.vetLatitude,
    this.vetLongitude,
    this.distance,
    this.fullVetDocumentUrl,
    this.fullClinicPhotoPath,
  });

  factory VetDataDatum.fromJson(Map<String, dynamic> json) => VetDataDatum(
        veterinarianId: json["veterinarian_id"],
        vetFname: json["vet_fname"],
        vetLname: json["vet_lname"],
        vetSpeciality: json["vet_speciality"],
        vetLatitude: json["vet_latitude"],
        vetLongitude: json["vet_longitude"],
        distance: json["distance"]?.toDouble(),
        fullVetDocumentUrl: json["full_vet_document_url"],
        fullClinicPhotoPath: json["full_clinic_photo_path"],
      );

  Map<String, dynamic> toJson() => {
        "veterinarian_id": veterinarianId,
        "vet_fname": vetFname,
        "vet_lname": vetLname,
        "vet_speciality": vetSpeciality,
        "vet_latitude": vetLatitude,
        "vet_longitude": vetLongitude,
        "distance": distance,
        "full_vet_document_url": fullVetDocumentUrl,
        "full_clinic_photo_path": fullClinicPhotoPath,
      };
}

class Meta {
  int? currentPage;
  int? perPage;
  dynamic nextPageUrl;
  bool? haveMoreRecords;

  Meta({
    this.currentPage,
    this.perPage,
    this.nextPageUrl,
    this.haveMoreRecords,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        perPage: json["per_page"],
        nextPageUrl: json["next_page_url"],
        haveMoreRecords: json["have_more_records"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "per_page": perPage,
        "next_page_url": nextPageUrl,
        "have_more_records": haveMoreRecords,
      };
}
