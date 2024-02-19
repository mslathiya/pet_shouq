import 'dart:convert';

import 'medication_type_bean.dart';

MedicationTypeListResponseBean medicationTypeListResponseBeanFromJson(
        String str) =>
    MedicationTypeListResponseBean.fromJson(json.decode(str));

String medicationTypeListResponseBeanToJson(
        MedicationTypeListResponseBean data) =>
    json.encode(data.toJson());

class MedicationTypeListResponseBean {
  bool? success;
  String? message;
  List<MedicationType>? data;

  MedicationTypeListResponseBean({
    this.success,
    this.message,
    this.data,
  });

  factory MedicationTypeListResponseBean.fromJson(Map<String, dynamic> json) =>
      MedicationTypeListResponseBean(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<MedicationType>.from(
                json["data"]!.map((x) => MedicationType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
