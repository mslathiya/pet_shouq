import 'dart:convert';

import 'meta_bean.dart';
import 'pet_info_bean.dart';

PetListResponseBean petListResponseBeanFromJson(String str) =>
    PetListResponseBean.fromJson(json.decode(str));

String petListResponseBeanToJson(PetListResponseBean data) =>
    json.encode(data.toJson());

class PetListResponseBean {
  bool? success;
  String? message;
  PetData? data;

  PetListResponseBean({
    this.success,
    this.message,
    this.data,
  });

  factory PetListResponseBean.fromJson(Map<String, dynamic> json) =>
      PetListResponseBean(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : PetData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class PetData {
  List<PetItemBean>? data;
  Meta? meta;

  PetData({
    this.data,
    this.meta,
  });

  factory PetData.fromJson(Map<String, dynamic> json) => PetData(
        data: json["data"] == null
            ? []
            : List<PetItemBean>.from(
                json["data"]!.map((x) => PetItemBean.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}
