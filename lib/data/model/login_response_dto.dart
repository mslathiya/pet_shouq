// To parse this JSON data, do
//
//     final loginBean = loginBeanFromJson(jsonString);

import 'dart:convert';

LoginBean loginBeanFromJson(String str) => LoginBean.fromJson(json.decode(str));

String loginBeanToJson(LoginBean data) => json.encode(data.toJson());

class LoginBean {
  bool? success;
  String? message;
  LoginData? data;

  LoginBean({
    this.success,
    this.message,
    this.data,
  });

  factory LoginBean.fromJson(Map<String, dynamic> json) => LoginBean(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : LoginData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class LoginData {
  int? userId;
  String? userName;
  String? userEmail;
  dynamic profilePicture;
  int? verified;
  dynamic rejectionReason;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? token;
  List<String>? roleNames;
  String? fullProfileImageUrl;

  LoginData({
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
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        userId: json["user_id"],
        userName: json["user_name"],
        userEmail: json["user_email"],
        profilePicture: json["profile_picture"],
        verified: json["verified"],
        rejectionReason: json["rejection_reason"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        token: json["token"],
        roleNames: json["role_names"] == null
            ? []
            : List<String>.from(json["role_names"]!.map((x) => x)),
        fullProfileImageUrl: json["full_profile_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_name": userName,
        "user_email": userEmail,
        "profile_picture": profilePicture,
        "verified": verified,
        "rejection_reason": rejectionReason,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "token": token,
        "role_names": roleNames == null
            ? []
            : List<dynamic>.from(roleNames!.map((x) => x)),
        "full_profile_image_url": fullProfileImageUrl,
      };
}
