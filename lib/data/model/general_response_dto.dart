// To parse this JSON data, do
//
//     final generalBean = generalBeanFromJson(jsonString);

import 'dart:convert';

GeneralBean generalBeanFromJson(String str) =>
    GeneralBean.fromJson(json.decode(str));

String generalBeanToJson(GeneralBean data) => json.encode(data.toJson());

class GeneralBean {
  bool? success;
  String? message;
  List<dynamic>? data;

  GeneralBean({
    this.success,
    this.message,
    this.data,
  });

  factory GeneralBean.fromJson(Map<String, dynamic> json) => GeneralBean(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<dynamic>.from(json["data"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
      };
}
