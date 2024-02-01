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
