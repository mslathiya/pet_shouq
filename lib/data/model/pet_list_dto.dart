import 'dart:convert';

import 'meta_bean.dart';

PetListResponseBean petListResponseBeanFromJson(String str) =>
    PetListResponseBean.fromJson(json.decode(str));

String petListResponseBeanToJson(PetListResponseBean data) =>
    json.encode(data.toJson());

class PetListResponseBean {
  bool? success;
  String? message;
  PetData? data;

  PetListResponseBean({
    this.success,
    this.message,
    this.data,
  });

  factory PetListResponseBean.fromJson(Map<String, dynamic> json) =>
      PetListResponseBean(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : PetData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class PetData {
  List<PetItemBean>? data;
  Meta? meta;

  PetData({
    this.data,
    this.meta,
  });

  factory PetData.fromJson(Map<String, dynamic> json) => PetData(
        data: json["data"] == null
            ? []
            : List<PetItemBean>.from(json["data"]!.map((x) => PetItemBean.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class PetItemBean {
  int? petId;
  String? petName;
  String? petProfilePhoto;
  DateTime? petDob;
  String? petBreed;
  String? fullProfileImageUrl;

  PetItemBean({
    this.petId,
    this.petName,
    this.petProfilePhoto,
    this.petDob,
    this.petBreed,
    this.fullProfileImageUrl,
  });

  factory PetItemBean.fromJson(Map<String, dynamic> json) => PetItemBean(
        petId: json["pet_id"],
        petName: json["pet_name"],
        petProfilePhoto: json["pet_profile_photo"],
        petDob:
            json["pet_dob"] == null ? null : DateTime.parse(json["pet_dob"]),
        petBreed: json["pet_breed"],
        fullProfileImageUrl: json["full_profile_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "pet_id": petId,
        "pet_name": petName,
        "pet_profile_photo": petProfilePhoto,
        "pet_dob":
            "${petDob!.year.toString().padLeft(4, '0')}-${petDob!.month.toString().padLeft(2, '0')}-${petDob!.day.toString().padLeft(2, '0')}",
        "pet_breed": petBreed,
        "full_profile_image_url": fullProfileImageUrl,
      };
}
