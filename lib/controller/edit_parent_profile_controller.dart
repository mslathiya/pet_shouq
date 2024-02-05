import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:image_cropper/image_cropper.dart';
import 'package:intl/intl.dart';

import '../data/model/models.dart';
import '../service/repository/repository.dart';
import '../theme/theme.dart';
import "../helper/helpers.dart";
import 'controllers.dart';

class EditParentProfileController extends GetxController
    implements GetxService {
  final AuthRepositoryImpl repository;

  bool isLoading = false;

  final GlobalKey<FormState> _editParentProfileFormKey = GlobalKey<FormState>();

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

  String? _imagePath = '';
  String _gender = '';
  String? _pickedCode;
  String? _pickedCodeSecondary;
  String _birthDate = '';
  String _age = '';

  List<String> genders = ["Male", "Female", "LGBTQIA+"];

  String? get imagePath => _imagePath;
  String get gender => _gender;
  String? get pickedCode => _pickedCode;
  String? get pickedCodeSecondary => _pickedCodeSecondary;
  String get birthDate => _birthDate;
  String get age => _age;

  TextEditingController get city => _city;
  TextEditingController get province => _province;

  GlobalKey<FormState> get editParentProfileFormKey =>
      _editParentProfileFormKey;
  TextEditingController get firstName => _firstName;
  TextEditingController get lastName => _lastName;
  TextEditingController get email => _email;
  TextEditingController get phoneNumber => _phoneNumber;
  TextEditingController get addressOne => _addressOne;
  TextEditingController get addressTwo => _addressTwo;
  TextEditingController get alternatePhone => _alternatePhone;
  TextEditingController get displayName => _displayName;
  TextEditingController get mailingAddress => _mailingAddress;

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

  void openDatePicker() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: DateTime.now(),
      firstDate: DateTime(
        DateTime.now().year - 60,
        DateTime.now().month,
        DateTime.now().day,
      ),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      _birthDate = DateFormat('yyyy-MM-dd').format(picked);
      _age = (DateTime.now().year - picked.year).toString();
      update();
    }
  }

  void updateParentProfile() async {
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
        Get.snackbar(
          "error_in_request".tr,
          failure.message,
          backgroundColor: AppColors.redColor,
          colorText: AppColors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
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
}
