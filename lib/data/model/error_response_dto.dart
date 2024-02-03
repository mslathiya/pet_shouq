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
  List<String>? petId;
  List<String>? mediName;
  List<String>? mediStartDate;
  List<String>? mediEndDate;
  List<String>? oldPassword;
  List<String>? passwordConfirmation;
  List<String>? dietWater;
  List<String>? dietFoodName;
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
    this.petId,
    this.mediName,
    this.mediStartDate,
    this.mediEndDate,
    this.oldPassword,
    this.passwordConfirmation,
    this.dietWater,
    this.dietFoodName,
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
        petId: json["pet_id"] == null
            ? []
            : List<String>.from(json["pet_id"]!.map((x) => x)),
        mediName: json["medi_name"] == null
            ? []
            : List<String>.from(json["medi_name"]!.map((x) => x)),
        mediStartDate: json["medi_start_date"] == null
            ? []
            : List<String>.from(json["medi_start_date"]!.map((x) => x)),
        mediEndDate: json["medi_end_date"] == null
            ? []
            : List<String>.from(json["medi_end_date"]!.map((x) => x)),
        oldPassword: json["old_password"] == null
            ? []
            : List<String>.from(json["old_password"]!.map((x) => x)),
        passwordConfirmation: json["password_confirmation"] == null
            ? []
            : List<String>.from(json["password_confirmation"]!.map((x) => x)),
        dietWater: json["diet_water"] == null
            ? []
            : List<String>.from(json["diet_water"]!.map((x) => x)),
        dietFoodName: json["diet_food_name"] == null
            ? []
            : List<String>.from(json["diet_food_name"]!.map((x) => x)),
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
        "pet_id": petId == null ? [] : List<dynamic>.from(petId!.map((x) => x)),
        "medi_name":
            mediName == null ? [] : List<dynamic>.from(mediName!.map((x) => x)),
        "medi_start_date": mediStartDate == null
            ? []
            : List<dynamic>.from(mediStartDate!.map((x) => x)),
        "medi_end_date": mediEndDate == null
            ? []
            : List<dynamic>.from(mediEndDate!.map((x) => x)),
        "old_password": oldPassword == null
            ? []
            : List<dynamic>.from(oldPassword!.map((x) => x)),
        "password_confirmation": passwordConfirmation == null
            ? []
            : List<dynamic>.from(passwordConfirmation!.map((x) => x)),
        "diet_water": dietWater == null
            ? []
            : List<dynamic>.from(dietWater!.map((x) => x)),
        "diet_food_name": dietFoodName == null
            ? []
            : List<dynamic>.from(dietFoodName!.map((x) => x)),
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
