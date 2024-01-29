import 'dart:convert';

ErrorResponseDto errorResponseDtoFromJson(String str) =>
    ErrorResponseDto.fromJson(json.decode(str));

String errorResponseDtoToJson(ErrorResponseDto data) =>
    json.encode(data.toJson());

class ErrorResponseDto {
  List<String>? parentFname;
  List<String>? parentLname;
  List<String>? userEmail;
  List<String>? password;
  List<String>? parentContactNumber;
  List<String>? parentContactCountryCode;
  List<String>? petName;
  List<String>? petDob;
  List<String>? foodName;
  Errors? errors;

  ErrorResponseDto({
    this.parentFname,
    this.parentLname,
    this.userEmail,
    this.password,
    this.parentContactNumber,
    this.parentContactCountryCode,
    this.petName,
    this.petDob,
    this.foodName,
    this.errors,
  });

  factory ErrorResponseDto.fromJson(Map<String, dynamic> json) =>
      ErrorResponseDto(
        parentFname: json["parent_fname"] == null
            ? []
            : List<String>.from(json["parent_fname"]!.map((x) => x)),
        parentLname: json["parent_lname"] == null
            ? []
            : List<String>.from(json["parent_lname"]!.map((x) => x)),
        userEmail: json["user_email"] == null
            ? []
            : List<String>.from(json["user_email"]!.map((x) => x)),
        password: json["password"] == null
            ? []
            : List<String>.from(json["password"]!.map((x) => x)),
        parentContactNumber: json["parent_contact_number"] == null
            ? []
            : List<String>.from(json["parent_contact_number"]!.map((x) => x)),
        parentContactCountryCode: json["parent_contact_country_code"] == null
            ? []
            : List<String>.from(
                json["parent_contact_country_code"]!.map((x) => x)),
        petName: json["pet_name"] == null
            ? []
            : List<String>.from(json["pet_name"]!.map((x) => x)),
        petDob: json["pet_dob"] == null
            ? []
            : List<String>.from(json["pet_dob"]!.map((x) => x)),
        foodName: json["food_name"] == null
            ? []
            : List<String>.from(json["food_name"]!.map((x) => x)),
        errors: json["errors"] == null ? null : Errors.fromJson(json["errors"]),
      );

  Map<String, dynamic> toJson() => {
        "parent_fname": parentFname == null
            ? []
            : List<dynamic>.from(parentFname!.map((x) => x)),
        "parent_lname": parentLname == null
            ? []
            : List<dynamic>.from(parentLname!.map((x) => x)),
        "user_email": userEmail == null
            ? []
            : List<dynamic>.from(userEmail!.map((x) => x)),
        "password":
            password == null ? [] : List<dynamic>.from(password!.map((x) => x)),
        "parent_contact_number": parentContactNumber == null
            ? []
            : List<dynamic>.from(parentContactNumber!.map((x) => x)),
        "parent_contact_country_code": parentContactCountryCode == null
            ? []
            : List<dynamic>.from(parentContactCountryCode!.map((x) => x)),
        "pet_name":
            petName == null ? [] : List<dynamic>.from(petName!.map((x) => x)),
        "pet_dob":
            petDob == null ? [] : List<dynamic>.from(petDob!.map((x) => x)),
        "food_name":
            foodName == null ? [] : List<dynamic>.from(foodName!.map((x) => x)),
        "errors": errors?.toJson(),
      };
}

class Errors {
  String? title;

  Errors({
    this.title,
  });

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
      };
}
