// To parse this JSON data, do
//
//     final loginBean = loginBeanFromJson(jsonString);

import 'dart:convert';

import 'user_bean.dart';

LoginBean loginBeanFromJson(String str) => LoginBean.fromJson(json.decode(str));

String loginBeanToJson(LoginBean data) => json.encode(data.toJson());

class LoginBean {
  bool? success;
  String? message;
  UserBean? data;

  LoginBean({
    this.success,
    this.message,
    this.data,
  });

  factory LoginBean.fromJson(Map<String, dynamic> json) => LoginBean(
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
