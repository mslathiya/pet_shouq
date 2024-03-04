import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:image_cropper/image_cropper.dart';
import 'package:intl/intl.dart';
import 'package:pet_shouq/data/enum/enum_user_type.dart';

import '../data/model/models.dart';
import "../helper/helpers.dart";
import '../service/repository/repository.dart';
import '../theme/theme.dart';
import 'controllers.dart';

class EditParentProfileController extends GetxController
    implements GetxService {
  final AuthRepositoryImpl repository;

  bool isLoading = false;

  final GlobalKey<FormState> _editParentProfileFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _editVetProfileFormKey = GlobalKey<FormState>();

  final TextEditingController _city = TextEditingController();
  final TextEditingController _province = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _addressOne = TextEditingController();
  final TextEditingController _addressTwo = TextEditingController();
  final TextEditingController _alternatePhone = TextEditingController();
  final TextEditingController _displayName = TextEditingController();
  final TextEditingController _mailingAddress = TextEditingController();
  final TextEditingController _vetSpeciality = TextEditingController();
  final TextEditingController _vetQualification = TextEditingController();
  final TextEditingController _profileSummary = TextEditingController();
  final TextEditingController _licenseNumber = TextEditingController();
  final TextEditingController _veExperience = TextEditingController();
  final TextEditingController _languages = TextEditingController();
  final TextEditingController _consent = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _state = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _zipCode = TextEditingController();
  String _expirationDate = '';

  String? _imagePath = '';
  String? _pickedDocumentPath = '';
  String _gender = '';
  String? _pickedCode;
  String? _pickedCodeSecondary;
  String _birthDate = '';
  String _age = '';

  List<String> genders = ["Male", "Female", "LGBTQIA+"];

  String? get imagePath => _imagePath;
  String? get pickedDocumentPath => _pickedDocumentPath;
  String? get expirationDate => _expirationDate;
  String get gender => _gender;
  String? get pickedCode => _pickedCode;
  String? get pickedCodeSecondary => _pickedCodeSecondary;
  String get birthDate => _birthDate;
  String get age => _age;

  TextEditingController get city => _city;
  TextEditingController get province => _province;

  GlobalKey<FormState> get editParentProfileFormKey =>
      _editParentProfileFormKey;
  GlobalKey<FormState> get editVetProfileFormKey => _editVetProfileFormKey;
  TextEditingController get firstName => _firstName;
  TextEditingController get lastName => _lastName;
  TextEditingController get email => _email;
  TextEditingController get phoneNumber => _phoneNumber;
  TextEditingController get addressOne => _addressOne;
  TextEditingController get addressTwo => _addressTwo;
  TextEditingController get alternatePhone => _alternatePhone;
  TextEditingController get displayName => _displayName;
  TextEditingController get mailingAddress => _mailingAddress;
  TextEditingController get vetSpeciality => _vetSpeciality;
  TextEditingController get vetQualification => _vetQualification;
  TextEditingController get profileSummary => _profileSummary;
  TextEditingController get licenseNumber => _licenseNumber;
  TextEditingController get veExperience => _veExperience;
  TextEditingController get languages => _languages;
  TextEditingController get consent => _consent;
  TextEditingController get location => _location;
  TextEditingController get state => _state;
  TextEditingController get country => _country;
  TextEditingController get zipCode => _zipCode;

  EditParentProfileController({
    required this.repository,
  });

  @override
  void onInit() {
    updateInfo();
    super.onInit();
  }

  void updateInfo() {
    UserBean data = Get.find<AuthController>().userData.value;
    Parent? uParent = data.parent;

    DateTime bDate = uParent?.parentDob ?? DateTime.now();

    _firstName.text = uParent?.parentFname ?? "";
    _lastName.text = uParent?.parentLname ?? "";
    _email.text = data.userEmail ?? "";
    _phoneNumber.text = uParent?.parentContactNumber ?? "";
    _birthDate = DateFormat('yyyy-MM-dd').format(
      bDate,
    );
    _age = (DateTime.now().year - bDate.year).toString();
    _addressOne.text = uParent?.parentAddress ?? "";
    _addressTwo.text = uParent?.parentAddressSecondLine ?? "";
    _displayName.text = uParent?.parentDisplayName ?? "";
    _mailingAddress.text = uParent?.parentMailingAddress ?? "";
    _alternatePhone.text = uParent?.parentSecondaryContactNumber ?? "";
    _city.text = uParent?.parentCity ?? "";
    _province.text = uParent?.parentState ?? "";

    if (uParent != null) {
      String? code = uParent.parentContactCountryCode;
      if (code != null && code != '') {
        _pickedCode = code.startsWith("+") ? code : "+$code";
      }
      String? codeSecondary = uParent.parentSecondaryContactCountryCode ?? "";
      if (codeSecondary != '') {
        _pickedCodeSecondary =
            codeSecondary.startsWith("+") ? codeSecondary : "+$code";
      }
      _gender = uParent.parentSex ?? "";
    }
    if (data.profilePicture != null && data.profilePicture != '') {
      _imagePath = data.fullProfileImageUrl ?? "";
    }
    update();
  }

  void onPickImage(CroppedFile file) {
    _imagePath = file.path;
    update();
  }

  void onChangeCountry(CountryCode code, int type) {
    if (type == 1) {
      _pickedCode = code.dialCode;
    } else {
      _pickedCodeSecondary = code.dialCode;
    }
    update();
  }

  void onChangeGender(String gender) {
    _gender = gender;
    update();
  }

  void openGenderPicker() {
    Get.bottomSheet(
      Container(
        height: 145.h,
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 15.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: genders
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    Get.back();
                    onChangeGender(e);
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Text(
                      e,
                      style: Theme.of(Get.context!)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                            color: AppColors.gray,
                            fontWeight: FontWeight.w600,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  void openDatePicker({UserType userType = UserType.typeParent}) async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: DateTime.now(),
      firstDate: DateTime(
        DateTime.now().year - 60,
        DateTime.now().month,
        DateTime.now().day,
      ),
      lastDate: userType == UserType.typeVet
          ? DateTime(
              DateTime.now().year + 100,
              DateTime.now().month,
              DateTime.now().day,
            )
          : DateTime.now(),
    );
    if (picked != null) {
      _birthDate = DateFormat('yyyy-MM-dd').format(picked);
      _expirationDate = DateFormat('yyyy-MM-dd').format(picked);
      _age = (DateTime.now().year - picked.year).toString();
      update();
    }
  }

  void updateParentProfile() async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    update();

    Map<String, dynamic> bodyMap = {
      "parent_fname": firstName.text,
      "parent_lname": lastName.text,
      "user_email": email.text,
      "parent_contact_number": phoneNumber.text,
      "parent_contact_country_code": pickedCode?.replaceAll("+", ""),
      "parent_sex": gender,
      "parent_dob": birthDate,
      "parent_address": addressOne.text,
      "parent_address_second_line": addressTwo.text,
      "parent_city": city.text,
      "parent_state": province.text,
      "parent_secondary_contact_code": pickedCodeSecondary?.replaceAll("+", ""),
      "parent_secondary_contact_country_number": alternatePhone.text,
      "parent_display_name": displayName.text,
      "parent_mailing_address": mailingAddress.text,
    };

    FormData fData = FormData.fromMap(bodyMap);

    if (imagePath != null &&
        imagePath != '' &&
        !imagePath.toString().hasValidUrl()) {
      fData.files.add(
        MapEntry(
          "profile_picture",
          await MultipartFile.fromFile(
            imagePath!,
          ),
        ),
      );
    }

    final result = await repository.updateParentProfile(fData);

    result.fold<void>(
      (failure) {
        isLoading = false;
        update();
        if (!Get.find<AuthController>().handleUnAuthorized(failure)) {
          Get.snackbar(
            "error_in_request".tr,
            failure.message,
            backgroundColor: AppColors.redColor,
            colorText: AppColors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      },
      (success) {
        isLoading = false;
        update();

        Get.snackbar(
          "congratulations".tr,
          success.message ?? "",
          backgroundColor: AppColors.greenColor,
          colorText: AppColors.white,
          snackPosition: SnackPosition.BOTTOM,
          padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 12.sp),
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              MaterialIcons.done_all,
              size: 24.sp,
              color: AppColors.white,
            ),
          ),
          borderRadius: 5.sp,
        );

        Future.delayed(const Duration(seconds: 2), () {
          if (success.data != null) {
            Get.find<AuthController>().updateProfileData(success.data!);
          }
          Get.back(closeOverlays: true);
        });
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                                    VET                                     */
/* -------------------------------------------------------------------------- */

  void updateVetInfo(Vet vetData) {
    UserBean data = Get.find<AuthController>().userData.value;

    Vet? uVet = vetData;

    _firstName.text = uVet.vetFname ?? "";
    _lastName.text = uVet.vetLname ?? "";
    _vetSpeciality.text = uVet.vetSpeciality ?? "";
    _email.text = data.userEmail ?? "";
    _displayName.text = uVet.vetDisplayName ?? "";
    _phoneNumber.text = uVet.vetContactNumber ?? "";
    _addressOne.text = uVet.vetAddress ?? "";

    _vetQualification.text = uVet.vetQualification ?? "";
    _profileSummary.text = uVet.vetProfileSummary ?? "";
    _licenseNumber.text = uVet.vetLicenseNumber == null
        ? ''
        : uVet.vetLicenseNumber.toString() ?? "";
    _veExperience.text = uVet.vetYearsOfExperiance == null
        ? ''
        : uVet.vetYearsOfExperiance.toString() ?? "";
    _languages.text = uVet.vetLanguagesSpoken ?? "";
    _consent.text = uVet.vetConsentAndRelease ?? "";
    _location.text = uVet.vetLocation ?? "";
    _city.text = uVet.vetCity ?? "";
    _state.text = uVet.vetState ?? "";
    _country.text = uVet.vetCountry ?? "";
    _zipCode.text =
        uVet.vetPincode == null ? '' : uVet.vetPincode.toString() ?? "";
    _expirationDate =
        uVet.vetLicenseExpirationDate?.toString().split(" ").first ?? "";

    String? code = uVet.vetCountryCode.toString() == 'Null'
        ? ''
        : uVet.vetCountryCode.toString() ?? '';
    if (code != '') {
      _pickedCode = code.startsWith("+") ? code : "+$code";
    }

    if (data.profilePicture != null && data.profilePicture != '') {
      _imagePath = data.fullProfileImageUrl ?? "";
    }
    if (uVet.fullVetDocumentUrl != null && uVet.fullVetDocumentUrl != '') {
      _pickedDocumentPath = uVet.fullVetDocumentUrl ?? "";
    }
    update();
  }

  void openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      _pickedDocumentPath = File(result.files.single.path!).path;
      update();
    }
  }

  void updateVetProfile() async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    update();

    Map<String, dynamic> bodyMap = {
      "vet_fname": firstName.text,
      "vet_lname": lastName.text,
      "vet_display_name": displayName.text,
      "vet_speciality": vetSpeciality.text,
      "user_email": email.text,
      "vet_contact_number": phoneNumber.text,
      "vet_country_code": pickedCode?.replaceAll("+", ""),
      "vet_qualification": vetQualification.text,
      "parent_address": addressOne.text,
      "vet_profile_summary": profileSummary.text,
      "vet_license_number": licenseNumber.text,
      "vet_license_expiration_date": expirationDate?.split(" ").first,
      "vet_years_of_experiance": veExperience.text,
      "vet_languages_spoken": languages.text,
      "vet_consent_and_release": consent.text,
      "vet_address": addressOne.text,
      "vet_location": location.text,
      "vet_latitude": '33.45457544',
      "vet_longitude": '72.45678978',
      "vet_city": city.text,
      "vet_state": state.text,
      "vet_country": country.text,
      "vet_pincode": zipCode.text,
    };

    FormData fData = FormData.fromMap(bodyMap);

    if (imagePath != null &&
        imagePath != '' &&
        !imagePath.toString().hasValidUrl()) {
      fData.files.add(
        MapEntry(
          "profile_picture",
          await MultipartFile.fromFile(
            imagePath!,
          ),
        ),
      );
    }
    if (pickedDocumentPath != null &&
        pickedDocumentPath != '' &&
        !pickedDocumentPath.toString().hasValidUrl()) {
      fData.files.add(
        MapEntry(
          "vet_document",
          await MultipartFile.fromFile(
            pickedDocumentPath!,
          ),
        ),
      );
    }

    final result = await repository.updateVetProfile(fData);

    result.fold<void>(
      (failure) {
        isLoading = false;
        update();
        if (!Get.find<AuthController>().handleUnAuthorized(failure)) {
          Get.snackbar(
            "error_in_request".tr,
            failure.message,
            backgroundColor: AppColors.redColor,
            colorText: AppColors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      },
      (success) async {
        Get.snackbar(
          "congratulations".tr,
          success.message ?? "",
          backgroundColor: AppColors.greenColor,
          colorText: AppColors.white,
          snackPosition: SnackPosition.BOTTOM,
          padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 12.sp),
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              MaterialIcons.done_all,
              size: 24.sp,
              color: AppColors.white,
            ),
          ),
          borderRadius: 5.sp,
        );

        await Future.delayed(const Duration(seconds: 2), () {
          if (success.data != null) {
            Get.find<AuthController>().updateProfileData(success.data!);
          }
          Get.back(closeOverlays: true);
        });
        isLoading = false;
        update();
      },
    );
  }
}
