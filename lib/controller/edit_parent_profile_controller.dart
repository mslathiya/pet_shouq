import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:image_cropper/image_cropper.dart';
import 'package:pet_shouq/helper/string_extensions.dart';

import '../data/model/models.dart';
import '../service/repository/repository.dart';
import '../theme/theme.dart';
import 'controllers.dart';

class EditParentProfileController extends GetxController {
  final AuthRepositoryImpl repository;

  bool isLoading = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _city = TextEditingController();
  final TextEditingController _province = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _addressOne = TextEditingController();
  final TextEditingController _addressTwo = TextEditingController();
  final TextEditingController _alternatePhone = TextEditingController();
  final TextEditingController _displayName = TextEditingController();
  final TextEditingController _mailingAddress = TextEditingController();

  String? _imagePath = '';
  String _gender = '';
  String? _pickedCode;
  String? _pickedCodeSecondary;

  List<String> genders = ["Male", "Female", "LGBTQIA+"];

  String? get imagePath => _imagePath;
  String get gender => _gender;
  String? get pickedCode => _pickedCode;
  String? get pickedCodeSecondary => _pickedCodeSecondary;

  TextEditingController get city => _city;
  TextEditingController get province => _province;

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get firstName => _firstName;
  TextEditingController get lastName => _lastName;
  TextEditingController get email => _email;
  TextEditingController get phoneNumber => _phoneNumber;
  TextEditingController get age => _age;
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
    UserBean data = Get.find<AuthController>().userData.value;
    Parent? uParent = data.parent;
    _firstName.text = uParent?.parentFname ?? "";
    _lastName.text = uParent?.parentLname ?? "";
    _email.text = data.userEmail ?? "";
    _phoneNumber.text = uParent?.parentContactNumber ?? "";
    _age.text = uParent?.parentAge.toString() ?? "";
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
      if (codeSecondary != null && codeSecondary != '') {
        _pickedCodeSecondary =
            codeSecondary.startsWith("+") ? codeSecondary : "+$code";
      }
      _gender = uParent.parentSex ?? "";
    }
    if (data.profilePicture != null && data.profilePicture != '') {
      _imagePath = data.fullProfileImageUrl ?? "";
    }
    super.onInit();
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

  void updateParentProfile() async {
    isLoading = true;
    update();

    FormData fData = FormData.fromMap({
      "parent_fname": firstName.text,
      "parent_lname": lastName.text,
      "user_email": email.text,
      "parent_contact_number": phoneNumber.text,
      "parent_contact_country_code": pickedCode,
      "parent_sex": gender,
      "parent_age": age.text,
      "parent_address": addressOne.text,
      "parent_address_second_line": addressTwo.text,
      "parent_city": city.text,
      "parent_state": province.text,
      "parent_secondary_contact_code": alternatePhone.text,
      "parent_secondary_contact_country_number": pickedCodeSecondary,
      "parent_display_name": displayName.text,
      "parent_mailing_address": mailingAddress.text,
      "profile_picture": imagePath != null &&
          imagePath != '' &&
          !imagePath.toString().hasValidUrl() &&
          await MultipartFile.fromFileSync(
            imagePath!,
          )
    });

    final result = await repository.updateParentProfile(fData);

    result.fold<void>((failure) {
      isLoading = false;
      update();
      Get.snackbar(
        "error_in_request".tr,
        failure.message,
        backgroundColor: AppColors.redColor,
        colorText: AppColors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }, (success) {
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
      if (success.data != null) {
        Get.find<AuthController>().updateProfileData(success.data!);
      }
      Future.delayed(
        const Duration(seconds: 3),
        () {},
      );
    });
  }
}
