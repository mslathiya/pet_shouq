// To parse this JSON data, do
//
//     final bookingHistoryDetailsResponseModel = bookingHistoryDetailsResponseModelFromJson(jsonString);

import 'dart:convert';

BookingHistoryDetailsResponseModel bookingHistoryDetailsResponseModelFromJson(String str) => BookingHistoryDetailsResponseModel.fromJson(json.decode(str));

String bookingHistoryDetailsResponseModelToJson(BookingHistoryDetailsResponseModel data) => json.encode(data.toJson());

class BookingHistoryDetailsResponseModel {
  bool? success;
  String? message;
  BookingHistoryDetailsData? data;

  BookingHistoryDetailsResponseModel({
    this.success,
    this.message,
    this.data,
  });

  factory BookingHistoryDetailsResponseModel.fromJson(Map<String, dynamic> json) => BookingHistoryDetailsResponseModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : BookingHistoryDetailsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class BookingHistoryDetailsData {
  int? id;
  int? vetId;
  int? vaId;
  int? petId;
  DateTime? bookingDate;
  String? timeSlot;
  String? status;
  String? disease;
  String? specialNotes;
  String? bookingId;
  int? isReschedule;
  Vet? vet;
  Pet? pet;

  BookingHistoryDetailsData({
    this.id,
    this.vetId,
    this.vaId,
    this.petId,
    this.bookingDate,
    this.timeSlot,
    this.status,
    this.disease,
    this.specialNotes,
    this.bookingId,
    this.isReschedule,
    this.vet,
    this.pet,
  });

  factory BookingHistoryDetailsData.fromJson(Map<String, dynamic> json) => BookingHistoryDetailsData(
    id: json["id"],
    vetId: json["vet_id"],
    vaId: json["va_id"],
    petId: json["pet_id"],
    bookingDate: json["booking_date"] == null ? null : DateTime.parse(json["booking_date"]),
    timeSlot: json["time_slot"],
    status: json["status"],
    disease: json["disease"],
    specialNotes: json["special_notes"],
    bookingId: json["booking_id"],
    isReschedule: json["is_reschedule"],
    vet: json["vet"] == null ? null : Vet.fromJson(json["vet"]),
    pet: json["pet"] == null ? null : Pet.fromJson(json["pet"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vet_id": vetId,
    "va_id": vaId,
    "pet_id": petId,
    "booking_date": "${bookingDate!.year.toString().padLeft(4, '0')}-${bookingDate!.month.toString().padLeft(2, '0')}-${bookingDate!.day.toString().padLeft(2, '0')}",
    "time_slot": timeSlot,
    "status": status,
    "disease": disease,
    "special_notes": specialNotes,
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
  dynamic vetClinicPhoto;
  String? fullVetDocumentUrl;
  String? fullClinicPhotoPath;

  Vet({
    this.veterinarianId,
    this.vetFname,
    this.vetLname,
    this.vetClinicPhoto,
    this.fullVetDocumentUrl,
    this.fullClinicPhotoPath,
  });

  factory Vet.fromJson(Map<String, dynamic> json) => Vet(
    veterinarianId: json["veterinarian_id"],
    vetFname: json["vet_fname"],
    vetLname: json["vet_lname"],
    vetClinicPhoto: json["vet_clinic_photo"],
    fullVetDocumentUrl: json["full_vet_document_url"],
    fullClinicPhotoPath: json["full_clinic_photo_path"],
  );

  Map<String, dynamic> toJson() => {
    "veterinarian_id": veterinarianId,
    "vet_fname": vetFname,
    "vet_lname": vetLname,
    "vet_clinic_photo": vetClinicPhoto,
    "full_vet_document_url": fullVetDocumentUrl,
    "full_clinic_photo_path": fullClinicPhotoPath,
  };
}
