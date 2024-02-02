// To parse this JSON data, do
//
//     final changePasswordResponseBean = changePasswordResponseBeanFromJson(jsonString);

import 'dart:convert';

import 'user_bean.dart';

ChangePasswordResponseBean changePasswordResponseBeanFromJson(String str) =>
    ChangePasswordResponseBean.fromJson(json.decode(str));

String changePasswordResponseBeanToJson(ChangePasswordResponseBean data) =>
    json.encode(data.toJson());

class ChangePasswordResponseBean {
  bool? success;
  String? message;
  UserBean? data;

  ChangePasswordResponseBean({
    this.success,
    this.message,
    this.data,
  });

  factory ChangePasswordResponseBean.fromJson(Map<String, dynamic> json) =>
      ChangePasswordResponseBean(
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
