// To parse this JSON data, do
//
//     final userProfileBean = userProfileBeanFromJson(jsonString);

import 'dart:convert';

import 'user_bean.dart';

UserProfileBean userProfileBeanFromJson(String str) =>
    UserProfileBean.fromJson(json.decode(str));

String userProfileBeanToJson(UserProfileBean data) =>
    json.encode(data.toJson());

class UserProfileBean {
  bool? success;
  String? message;
  UserBean? data;

  UserProfileBean({
    this.success,
    this.message,
    this.data,
  });

  factory UserProfileBean.fromJson(Map<String, dynamic> json) =>
      UserProfileBean(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : UserBean.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}
