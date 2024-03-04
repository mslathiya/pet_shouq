// To parse this JSON data, do
//
//     final bookingHistoryResponseModel = bookingHistoryResponseModelFromJson(jsonString);

import 'dart:convert';

BookingHistoryResponseModel bookingHistoryResponseModelFromJson(String str) => BookingHistoryResponseModel.fromJson(json.decode(str));

String bookingHistoryResponseModelToJson(BookingHistoryResponseModel data) => json.encode(data.toJson());

class BookingHistoryResponseModel {
  bool? success;
  String? message;
  Data? data;

  BookingHistoryResponseModel({
    this.success,
    this.message,
    this.data,
  });

  factory BookingHistoryResponseModel.fromJson(Map<String, dynamic> json) => BookingHistoryResponseModel(
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
  List<BookingHistoryDatum>? data;
  Meta? meta;

  Data({
    this.data,
    this.meta,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: json["data"] == null ? [] : List<BookingHistoryDatum>.from(json["data"]!.map((x) => BookingHistoryDatum.fromJson(x))),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "meta": meta?.toJson(),
  };
}

class BookingHistoryDatum {
  int? id;
  int? vetId;
  int? petId;
  DateTime? bookingDate;
  String? timeSlot;
  String? status;
  String? bookingId;
  int? isReschedule;
  Vet? vet;
  Pet? pet;

  BookingHistoryDatum({
    this.id,
    this.vetId,
    this.petId,
    this.bookingDate,
    this.timeSlot,
    this.status,
    this.bookingId,
    this.isReschedule,
    this.vet,
    this.pet,
  });

  factory BookingHistoryDatum.fromJson(Map<String, dynamic> json) => BookingHistoryDatum(
    id: json["id"],
    vetId: json["vet_id"],
    petId: json["pet_id"],
    bookingDate: json["booking_date"] == null ? null : DateTime.parse(json["booking_date"]),
    timeSlot: json["time_slot"],
    status: json["status"],
    bookingId: json["booking_id"],
    isReschedule: json["is_reschedule"],
    vet: json["vet"] == null ? null : Vet.fromJson(json["vet"]),
    pet: json["pet"] == null ? null : Pet.fromJson(json["pet"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vet_id": vetId,
    "pet_id": petId,
    "booking_date": "${bookingDate!.year.toString().padLeft(4, '0')}-${bookingDate!.month.toString().padLeft(2, '0')}-${bookingDate!.day.toString().padLeft(2, '0')}",
    "time_slot": timeSlot,
    "status": status,
    "booking_id": bookingId,
    "is_reschedule": isReschedule,
    "vet": vet?.toJson(),
    "pet": pet?.toJson(),
  };
}

class Pet {
  int? petId;
  String? petName;
  String? fullProfileImageUrl;

  Pet({
    this.petId,
    this.petName,
    this.fullProfileImageUrl,
  });

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
    petId: json["pet_id"],
    petName: json["pet_name"],
    fullProfileImageUrl: json["full_profile_image_url"],
  );

  Map<String, dynamic> toJson() => {
    "pet_id": petId,
    "pet_name": petName,
    "full_profile_image_url": fullProfileImageUrl,
  };
}

class Vet {
  int? veterinarianId;
  String? vetFname;
  String? vetLname;
  String? fullVetDocumentUrl;
  String? fullClinicPhotoPath;

  Vet({
    this.veterinarianId,
    this.vetFname,
    this.vetLname,
    this.fullVetDocumentUrl,
    this.fullClinicPhotoPath,
  });

  factory Vet.fromJson(Map<String, dynamic> json) => Vet(
    veterinarianId: json["veterinarian_id"],
    vetFname: json["vet_fname"],
    vetLname: json["vet_lname"],
    fullVetDocumentUrl: json["full_vet_document_url"],
    fullClinicPhotoPath: json["full_clinic_photo_path"],
  );

  Map<String, dynamic> toJson() => {
    "veterinarian_id": veterinarianId,
    "vet_fname": vetFname,
    "vet_lname": vetLname,
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
