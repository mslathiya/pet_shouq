import 'dart:async';
import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:image_cropper/image_cropper.dart';
import 'package:intl/intl.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../config/config.dart';
import '../data/model/models.dart';
import '../helper/helpers.dart';
import '../service/repository/repository.dart';
import '../theme/theme.dart';

class RegisterController extends GetxController implements GetxService {
  final AuthRepositoryImpl repository;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GlobalKey<FormState> _registerKey = GlobalKey<FormState>();
  List<String> genders = [
    "Male",
    "Female",
  ];

  bool isLoading = false;
  bool _resendingAuth = false;

  final TextEditingController _city = TextEditingController();
  final TextEditingController _province = TextEditingController();

  //use for parent
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _addressOne = TextEditingController();
  final TextEditingController _addressTwo = TextEditingController();
  final TextEditingController _alternatePhone = TextEditingController();
  final TextEditingController _displayName = TextEditingController();
  final TextEditingController _mailingAddress = TextEditingController();

  //use for veterinarian
  final TextEditingController _specialty = TextEditingController();
  final TextEditingController _qualification = TextEditingController();
  final TextEditingController _profileSummary = TextEditingController();
  final TextEditingController _licenseNo = TextEditingController();
  final TextEditingController _experience = TextEditingController();
  final TextEditingController _spokenLanguages = TextEditingController();
  final TextEditingController _consent = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _zipCode = TextEditingController();

  String? _imagePath = '';
  String _gender = 'Male';
  String _birthDate = DateFormat('yyyy-MM-dd').format(
    DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day - 1,
    ),
  );
  String _age = "0";
  String _expirationDate = '';
  File? _pickedFile;
  var _accountType = 1;

  String? _pickedCode = CountryCode.fromCountryCode("AE").dialCode;
  String? _pickedCodeSecondary = CountryCode.fromCountryCode("AE").dialCode;

  String? _firstNameError;
  String? _lastNameError;
  String? _emailError;
  String? _phoneNumberError;
  String? _passwordError;

  String? get imagePath => _imagePath;
  String get gender => _gender;
  String get birthDate => _birthDate;
  String get age => _age;
  int get accountType => _accountType;

  String? get firstNameError => _firstNameError;
  String? get lastNameError => _lastNameError;
  String? get emailError => _emailError;
  String? get phoneNumberError => _phoneNumberError;
  String? get passwordError => _passwordError;
  bool get resendingAuth => _resendingAuth;

  TextEditingController get city => _city;
  TextEditingController get province => _province;

  GlobalKey<FormState> get registerKey => _registerKey;
  TextEditingController get firstName => _firstName;
  TextEditingController get lastName => _lastName;
  TextEditingController get email => _email;
  TextEditingController get phoneNumber => _phoneNumber;
  TextEditingController get password => _password;
  TextEditingController get addressOne => _addressOne;
  TextEditingController get addressTwo => _addressTwo;
  TextEditingController get alternatePhone => _alternatePhone;
  TextEditingController get displayName => _displayName;
  TextEditingController get mailingAddress => _mailingAddress;

  String? get pickedCode => _pickedCode;
  String? get pickedCodeSecondary => _pickedCodeSecondary;

  //Veterinarian
  String get expirationDate => _expirationDate;
  File? get pickedFile => _pickedFile;
  TextEditingController get specialty => _specialty;
  TextEditingController get qualification => _qualification;
  TextEditingController get profileSummary => _profileSummary;
  TextEditingController get licenseNo => _licenseNo;
  TextEditingController get experience => _experience;
  TextEditingController get spokenLanguages => _spokenLanguages;
  TextEditingController get consent => _consent;
  TextEditingController get address => _address;
  TextEditingController get location => _location;
  TextEditingController get country => _country;
  TextEditingController get zipCode => _zipCode;

  //used in verification
  Timer? _timer;
  int remainSeconds = 120;
  final time = '02.00'.obs;
  var isOtpSent = false.obs;
  var firebaseVerificationId = "";

  final TextEditingController _authCodeController = TextEditingController();
  StreamController<ErrorAnimationType>? _errorController;

  TextEditingController get authCodeController => _authCodeController;
  StreamController<ErrorAnimationType>? get errorController => _errorController;

  RegisterController({
    required this.repository,
  });

  void onToggleType(int index) {
    if (index == 0) {
      _accountType = index;
      update();
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

  void openDatePicker(int pickerType) async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day - 1,
      ),
      firstDate: pickerType == 1
          ? DateTime.now().subtract(const Duration(days: 1))
          : DateTime(
              DateTime.now().year - 60,
              DateTime.now().month,
              DateTime.now().day,
            ),
      lastDate: pickerType == 1
          ? DateTime(
              DateTime.now().year + 100,
              DateTime.now().month,
              DateTime.now().day,
            )
          : DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day - 1,
            ),
    );
    if (picked != null) {
      if (pickerType == 1) {
        _expirationDate = DateFormat('DD/MM/yyyy').format(picked);
      } else {
        _birthDate = DateFormat('yyyy-MM-dd').format(picked);
        _age = (DateTime.now().year - picked.year).toString();
      }
      update();
    }
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

  void openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      _pickedFile = File(result.files.single.path!);
      update();
    }
  }

  Future<void> validatePhoneNumber() async {
    _phoneNumberError = null;
    String fullNumber = '$pickedCode ${phoneNumber.text}';
    bool isValid = await CommonHelper.isPhoneValid(fullNumber);
    if (!isValid) {
      _phoneNumberError = "phone_not_valid".tr;
    } else {
      _phoneNumberError = null;
    }
    update();
  }

  ///
  ///Use below code for verification concept
  ///

  String phoneNumberWithCode() {
    return '$pickedCode ${CommonHelper.parseNumber('$pickedCode ${phoneNumber.text}')}';
  }

  void sendAuthCode() {
    _resendingAuth = true;
    update();
    stopTimer();
    _auth.verifyPhoneNumber(
      phoneNumber: '$pickedCode ${phoneNumber.text}',
      // phoneNumber: "+91 9978986902",
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        _resendingAuth = false;
        update();
      },
      codeSent: (String verificationId, int? resendToken) {
        _resendingAuth = false;
        update();
        firebaseVerificationId = verificationId;
        isOtpSent.value = true;
        startTimer();
        Get.snackbar(
          "code_sent".tr,
          "code_sent_msg".tr,
          backgroundColor: AppColors.greenColor,
          colorText: AppColors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void resendOtp() async {
    _resendingAuth = true;
    update();
    _auth.verifyPhoneNumber(
      phoneNumber: '$pickedCode ${phoneNumber.text}',
      // phoneNumber: "+91 7016155202",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        _resendingAuth = false;
        update();

        e.printInfo();
        if (e.code == 'invalid-phone-number') {
          AppLog.e('The provided phone number is not valid.');
        }
        Get.snackbar(
          "code_sent".tr,
          "code_sent_msg".tr,
          backgroundColor: AppColors.greenColor,
          colorText: AppColors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        _resendingAuth = false;
        update();
        remainSeconds = 120;
        firebaseVerificationId = verificationId;
        isOtpSent.value = true;
        startTimer();
        Get.snackbar(
          "code_sent".tr,
          "code_sent_msg".tr,
          backgroundColor: AppColors.greenColor,
          colorText: AppColors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void onCodeSubmit(String authCode) async {
    try {
      isLoading = true;
      update();
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: firebaseVerificationId,
        smsCode: authCode,
      );
      // Sign the user in (or link) with the credential
      var response = await _auth.signInWithCredential(credential);
      if (response.user != null) {
        stopTimer();
        registerNewUser();
        AppLog.e("Verification success!");
      } else {
        isLoading = false;
        update();
        Get.snackbar(
          "error_in_request".tr,
          "common_auth_error".tr,
          backgroundColor: AppColors.redColor,
          colorText: AppColors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      update();
      if (e.code == 'invalid-verification-code') {
        AppLog.e('The provided code is not valid.');
        Get.snackbar(
          "error_in_request".tr,
          "auth_code_invalid".tr,
          backgroundColor: AppColors.redColor,
          colorText: AppColors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "error_in_request".tr,
          "common_auth_error".tr,
          backgroundColor: AppColors.redColor,
          colorText: AppColors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      AppLog.e("Error ${e.toString()}");
      AppLog.e("Code ${e.code}");
    }
  }

  /// Start Timer
  void startTimer() {
    const duration = Duration(seconds: 1);
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainSeconds == 0) {
        timer.cancel();
        update();
      } else {
        int minutes = remainSeconds ~/ 60;
        int seconds = remainSeconds % 60;
        time.value =
            "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainSeconds--;
      }
    });
  }

  /// Stop Timer
  void stopTimer({bool rest = true}) {
    if (rest) {
      resetTimer();
      update();
    }
    _timer?.cancel();
    update();
  }

  /// Reset Timer
  void resetTimer() {
    remainSeconds = 120;
    update();
  }

  ///
  ///Use below code for verification concept
  ///

  void registerNewUser() async {
    _firstNameError = null;
    _lastNameError = null;
    _emailError = null;
    _phoneNumberError = null;
    _passwordError = null;

    isLoading = true;
    update();

    Map<String, dynamic> bodyMap = {
      "parent_fname": firstName.text,
      "parent_lname": lastName.text,
      "user_email": email.text,
      "password": password.text,
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

    if (imagePath != null && imagePath != '') {
      fData.files.add(
        MapEntry(
          "profile_picture",
          await MultipartFile.fromFile(
            imagePath!,
          ),
        ),
      );
    }

    final result = await repository.registerParent(fData);

    result.fold<void>(
      (failure) {
        String errorMessage = failure.message;

        if (failure.errorData != null) {
          errorMessage = "error_msg".tr;

          final errorResponse = ErrorResponseDto.fromJson(failure.errorData!);

          if (errorResponse.parentFname != null &&
              errorResponse.parentFname!.isNotEmpty) {
            _firstNameError = errorResponse.parentFname!.join("\n");
          }
          if (errorResponse.parentLname != null &&
              errorResponse.parentLname!.isNotEmpty) {
            _lastNameError = errorResponse.parentLname!.join("\n");
          }

          if (errorResponse.userEmail != null &&
              errorResponse.userEmail!.isNotEmpty) {
            _emailError = errorResponse.userEmail!.join("\n");
          }

          if (errorResponse.password != null &&
              errorResponse.password!.isNotEmpty) {
            _passwordError = errorResponse.password!.join("\n");
          }

          if (errorResponse.parentContactCountryCode != null &&
              errorResponse.parentContactCountryCode!.isNotEmpty) {
            _phoneNumberError =
                errorResponse.parentContactCountryCode!.join("\n");
          }

          if (errorResponse.parentContactNumber != null &&
              errorResponse.parentContactNumber!.isNotEmpty) {
            _phoneNumberError = errorResponse.parentContactNumber!.join("\n");
          }
        }

        isLoading = false;
        update();
        Get.snackbar(
          "error_in_request".tr,
          errorMessage,
          backgroundColor: AppColors.redColor,
          colorText: AppColors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      (success) {
        resetFields();
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
        _registerKey.currentState!.reset();
        Future.delayed(const Duration(seconds: 3), () {
          Get.offAllNamed(login);
        });
      },
    );
  }

  void resetFields() {
    _city.clear();
    _province.clear();

    //use for parent
    _firstName.clear();
    _lastName.clear();
    _email.clear();
    _phoneNumber.clear();
    _password.clear();
    _addressOne.clear();
    _addressTwo.clear();
    _alternatePhone.clear();
    _displayName.clear();
    _mailingAddress.clear();

    //use for veterinarian
    _specialty.clear();
    _qualification.clear();
    _profileSummary.clear();
    _licenseNo.clear();
    _experience.clear();
    _spokenLanguages.clear();
    _consent.clear();
    _address.clear();
    _location.clear();
    _country.clear();
    _zipCode.clear();

    _imagePath = '';
    _gender = 'Male';
    _birthDate = DateFormat('yyyy-MM-dd').format(
      DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day - 1,
      ),
    );
    _age = "0";
    _expirationDate = '';
    _pickedFile;
    _accountType = 1;
    _pickedCode = CountryCode.fromCountryCode("AE").dialCode;
    _pickedCodeSecondary = CountryCode.fromCountryCode("AE").dialCode;

    _firstNameError = null;
    _lastNameError = null;
    _emailError = null;
    _phoneNumberError = null;
    _passwordError = null;
  }
}
