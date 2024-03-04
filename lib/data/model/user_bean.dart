// To parse this JSON data, do
//
//     final userBean = userBeanFromJson(jsonString);

import 'dart:convert';

UserBean userBeanFromJson(String str) => UserBean.fromJson(json.decode(str));

String userBeanToJson(UserBean data) => json.encode(data.toJson());

class UserBean {
  int? userId;
  String? userName;
  String? userEmail;
  String? profilePicture;
  int? verified;
  String? rejectionReason;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? deletedAt;
  String? token;
  List<String>? roleNames;
  String? fullProfileImageUrl;
  Parent? parent;
  Vet? vet;

  UserBean({
    this.userId,
    this.userName,
    this.userEmail,
    this.profilePicture,
    this.verified,
    this.rejectionReason,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.token,
    this.roleNames,
    this.fullProfileImageUrl,
    this.parent,
    this.vet,
  });

  factory UserBean.fromJson(Map<String, dynamic> json) => UserBean(
        userId: json["user_id"],
        userName: json["user_name"],
        userEmail: json["user_email"],
        profilePicture: json["profile_picture"],
        verified: json["verified"],
        rejectionReason: json["rejection_reason"],
        token: json["token"],
        roleNames: json["role_names"] == null
            ? []
            : List<String>.from(json["role_names"]!.map((x) => x)),
        fullProfileImageUrl: json["full_profile_image_url"],
        parent: json["parent"] == null ? null : Parent.fromJson(json["parent"]),
        vet: json["veterinarian"] == null
            ? null
            : Vet.fromJson(json["veterinarian"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_name": userName,
        "user_email": userEmail,
        "profile_picture": profilePicture,
        "verified": verified,
        "rejection_reason": rejectionReason,
        "token": token,
        "role_names": roleNames == null
            ? []
            : List<dynamic>.from(roleNames!.map((x) => x)),
        "full_profile_image_url": fullProfileImageUrl,
        "parent": parent?.toJson(),
      };
}

class Parent {
  int? parentId;
  int? userId;
  String? parentFname;
  String? parentLname;
  String? parentSex;
  String? parentAddress;
  String? parentCity;
  String? parentState;
  String? parentContactNumber;
  String? parentEmergencyContactNumber;
  String? parentLocation;
  String? parentType;
  String? parentCommunicationPreferences;
  String? parentMailingAddress;
  String? parentDisplayName;
  String? parentAddressSecondLine;
  String? parentContactCountryCode;
  String? parentSecondaryContactNumber;
  String? parentSecondaryContactCountryCode;
  DateTime? parentDob;

  Parent({
    this.parentId,
    this.userId,
    this.parentFname,
    this.parentLname,
    this.parentSex,
    this.parentAddress,
    this.parentCity,
    this.parentState,
    this.parentContactNumber,
    this.parentEmergencyContactNumber,
    this.parentLocation,
    this.parentType,
    this.parentCommunicationPreferences,
    this.parentMailingAddress,
    this.parentDisplayName,
    this.parentAddressSecondLine,
    this.parentContactCountryCode,
    this.parentSecondaryContactNumber,
    this.parentSecondaryContactCountryCode,
    this.parentDob,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        parentId: json["parent_id"],
        userId: json["user_id"],
        parentFname: json["parent_fname"],
        parentLname: json["parent_lname"],
        parentSex: json["parent_sex"],
        parentAddress: json["parent_address"],
        parentCity: json["parent_city"],
        parentState: json["parent_state"],
        parentContactNumber: json["parent_contact_number"],
        parentEmergencyContactNumber: json["parent_emergency_contact_number"],
        parentLocation: json["parent_location"],
        parentType: json["parent_type"],
        parentCommunicationPreferences:
            json["parent_communication_preferences"],
        parentMailingAddress: json["parent_mailing_address"],
        parentDisplayName: json["parent_display_name"],
        parentAddressSecondLine: json["parent_address_second_line"],
        parentContactCountryCode: json["parent_contact_country_code"],
        parentSecondaryContactNumber: json["parent_secondary_contact_number"],
        parentSecondaryContactCountryCode:
            json["parent_secondary_contact_country_code"],
        parentDob: json["parent_dob"] == null
            ? null
            : DateTime.parse(json["parent_dob"]),
      );

  Map<String, dynamic> toJson() => {
        "parent_id": parentId,
        "user_id": userId,
        "parent_fname": parentFname,
        "parent_lname": parentLname,
        "parent_sex": parentSex,
        "parent_address": parentAddress,
        "parent_city": parentCity,
        "parent_state": parentState,
        "parent_contact_number": parentContactNumber,
        "parent_emergency_contact_number": parentEmergencyContactNumber,
        "parent_location": parentLocation,
        "parent_type": parentType,
        "parent_communication_preferences": parentCommunicationPreferences,
        "parent_mailing_address": parentMailingAddress,
        "parent_display_name": parentDisplayName,
        "parent_address_second_line": parentAddressSecondLine,
        "parent_contact_country_code": parentContactCountryCode,
        "parent_secondary_contact_number": parentSecondaryContactNumber,
        "parent_secondary_contact_country_code":
            parentSecondaryContactCountryCode,
        "parent_dob":
            "${parentDob?.year.toString().padLeft(4, '0')}-${parentDob?.month.toString().padLeft(2, '0')}-${parentDob?.day.toString().padLeft(2, '0')}",
      };
}

class Vet {
  int? veterinarianId;
  int? userId;
  String? vetFname;
  String? vetLname;
  String? vetContactNumber;
  dynamic vetContactNumberCountryCode;
  String? vetAddress;
  String? vetCity;
  String? vetState;
  String? vetCountry;
  int? vetPincode;
  String? vetLocation;
  String? vetSpeciality;
  int? vetLicenseNumber;
  dynamic vetLicenseStartDate;
  DateTime? vetLicenseExpirationDate;
  int? vetYearsOfExperiance;
  String? vetQualification;
  String? vetProfileSummary;
  String? vetLanguagesSpoken;
  String? vetConsentAndRelease;
  String? vetDisplayName;
  String? vetDocument;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? vetCountryCode;
  String? vetLatitude;
  String? vetLongitude;
  dynamic vetClinicPhoto;
  String? fullVetDocumentUrl;
  String? fullClinicPhotoPath;

  Vet({
    this.veterinarianId,
    this.userId,
    this.vetFname,
    this.vetLname,
    this.vetContactNumber,
    this.vetContactNumberCountryCode,
    this.vetAddress,
    this.vetCity,
    this.vetState,
    this.vetCountry,
    this.vetPincode,
    this.vetLocation,
    this.vetSpeciality,
    this.vetLicenseNumber,
    this.vetLicenseStartDate,
    this.vetLicenseExpirationDate,
    this.vetYearsOfExperiance,
    this.vetQualification,
    this.vetProfileSummary,
    this.vetLanguagesSpoken,
    this.vetConsentAndRelease,
    this.vetDisplayName,
    this.vetDocument,
    this.createdAt,
    this.updatedAt,
    this.vetCountryCode,
    this.vetLatitude,
    this.vetLongitude,
    this.vetClinicPhoto,
    this.fullVetDocumentUrl,
    this.fullClinicPhotoPath,
  });

  factory Vet.fromJson(Map<String, dynamic> json) => Vet(
        veterinarianId: json["veterinarian_id"],
        userId: json["user_id"],
        vetFname: json["vet_fname"],
        vetLname: json["vet_lname"],
        vetContactNumber: json["vet_contact_number"],
        vetContactNumberCountryCode: json["vet_contact_number_country_code"],
        vetAddress: json["vet_address"],
        vetCity: json["vet_city"],
        vetState: json["vet_state"],
        vetCountry: json["vet_country"],
        vetPincode: json["vet_pincode"],
        vetLocation: json["vet_location"],
        vetSpeciality: json["vet_speciality"],
        vetLicenseNumber: json["vet_license_number"],
        vetLicenseStartDate: json["vet_license_start_date"],
        vetLicenseExpirationDate: json["vet_license_expiration_date"] == null
            ? null
            : DateTime.parse(json["vet_license_expiration_date"]),
        vetYearsOfExperiance: json["vet_years_of_experiance"],
        vetQualification: json["vet_qualification"],
        vetProfileSummary: json["vet_profile_summary"],
        vetLanguagesSpoken: json["vet_languages_spoken"],
        vetConsentAndRelease: json["vet_consent_and_release"],
        vetDisplayName: json["vet_display_name"],
        vetDocument: json["vet_document"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        vetCountryCode: json["vet_country_code"],
        vetLatitude: json["vet_latitude"],
        vetLongitude: json["vet_longitude"],
        vetClinicPhoto: json["vet_clinic_photo"],
        fullVetDocumentUrl: json["full_vet_document_url"],
        fullClinicPhotoPath: json["full_clinic_photo_path"],
      );

  Map<String, dynamic> toJson() => {
        "veterinarian_id": veterinarianId,
        "user_id": userId,
        "vet_fname": vetFname,
        "vet_lname": vetLname,
        "vet_contact_number": vetContactNumber,
        "vet_contact_number_country_code": vetContactNumberCountryCode,
        "vet_address": vetAddress,
        "vet_city": vetCity,
        "vet_state": vetState,
        "vet_country": vetCountry,
        "vet_pincode": vetPincode,
        "vet_location": vetLocation,
        "vet_speciality": vetSpeciality,
        "vet_license_number": vetLicenseNumber,
        "vet_license_start_date": vetLicenseStartDate,
        "vet_license_expiration_date":
            "${vetLicenseExpirationDate!.year.toString().padLeft(4, '0')}-${vetLicenseExpirationDate!.month.toString().padLeft(2, '0')}-${vetLicenseExpirationDate!.day.toString().padLeft(2, '0')}",
        "vet_years_of_experiance": vetYearsOfExperiance,
        "vet_qualification": vetQualification,
        "vet_profile_summary": vetProfileSummary,
        "vet_languages_spoken": vetLanguagesSpoken,
        "vet_consent_and_release": vetConsentAndRelease,
        "vet_display_name": vetDisplayName,
        "vet_document": vetDocument,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "vet_country_code": vetCountryCode,
        "vet_latitude": vetLatitude,
        "vet_longitude": vetLongitude,
        "vet_clinic_photo": vetClinicPhoto,
        "full_vet_document_url": fullVetDocumentUrl,
        "full_clinic_photo_path": fullClinicPhotoPath,
      };
}
