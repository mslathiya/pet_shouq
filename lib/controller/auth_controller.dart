import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart' hide FormData;

import '../config/config.dart';
import '../data/model/models.dart';
import '../helper/helpers.dart';
import '../service/repository/repository.dart';
import '../theme/theme.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepositoryImpl repository;
  final AppPreferences preferences;

  bool isLoading = false;

  final RxBool _isLoggedIn = false.obs;
  late RxBool isLoggedIn = _isLoggedIn;

  final Rx<UserBean> _userData = UserBean().obs;
  Rx<UserBean> get userData => _userData;

  /* -------------------------------------------------------------------------- */
  /*                               Change Password                              */
  /* -------------------------------------------------------------------------- */
  String? _oldPasswordError;
  String? _newPasswordError;
  String? _confirmPasswordError;
  final TextEditingController _oldPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController get oldPassword => _oldPassword;
  TextEditingController get newPassword => _newPassword;
  TextEditingController get confirmPassword => _confirmPassword;
  GlobalKey<FormState> get formKey => _formKey;

  String? get oldPasswordError => _oldPasswordError;
  String? get newPasswordError => _newPasswordError;
  String? get confirmPasswordError => _confirmPasswordError;

  AuthController({
    required this.repository,
    required this.preferences,
  });

  @override
  void onInit() async {
    bool values = await preferences.getIsLoggedIn();
    isLoggedIn.value = values;
    super.onInit();
  }

  Future<String> getLoginType() async {
    bool loggedIn = await preferences.getIsLoggedIn();
    if (loggedIn) {
      _userData.value = await preferences.getUserData();
      return await preferences.getUserType();
    }
    return "";
  }

  Future<void> logoutCurrentUser() async {
    await preferences.clearPreferences();
    isLoggedIn.value = false;
    Get.offNamed(intro);
  }

  Future<void> setLoginStatus() async {
    _userData.value = await preferences.getUserData();
    isLoggedIn.value = true;
  }

  void getUserProfile() async {
    final result = await repository.getProfile();
    result.fold<void>(
      (failure) {
        AppLog.e("Error ${failure.code}");
      },
      (success) {
        if (success.data != null) {
          _userData.value = success.data!;
        }
      },
    );
  }

  void updateProfileData(UserBean bean) {
    _userData.value = bean;
  }

  bool handleUnAuthorized(Failure error) {
    if (error.code == 401) {
      logoutCurrentUser();
      return true;
    }
    return false;
  }

  void changePassword() async {
    _oldPasswordError = null;
    _newPasswordError = null;
    _confirmPasswordError = null;

    isLoading = true;
    update();

    Map<String, dynamic> bodyMap = {
      "old_password": oldPassword.text,
      "password": newPassword.text,
      "password_confirmation": confirmPassword.text
    };

    FormData fData = FormData.fromMap(bodyMap);

    final result = await repository.changePassword(fData);

    result.fold<void>(
      (failure) {
        String errorMessage = failure.message;

        if (failure.errorData != null) {
          errorMessage = "error_msg".tr;

          final errorResponse = ErrorResponseDto.fromJson(failure.errorData!);

          if (errorResponse.oldPassword != null &&
              errorResponse.oldPassword!.isNotEmpty) {
            _oldPasswordError = errorResponse.oldPassword!.join("\n");
          }
          if (errorResponse.password != null &&
              errorResponse.password!.isNotEmpty) {
            _newPasswordError = errorResponse.password!.join("\n");
          }

          if (errorResponse.passwordConfirmation != null &&
              errorResponse.passwordConfirmation!.isNotEmpty) {
            _confirmPasswordError =
                errorResponse.passwordConfirmation!.join("\n");
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
        Future.delayed(
          const Duration(seconds: 2),
          () {
            Get.back(
              closeOverlays: true,
            );
          },
        );
      },
    );
  }
}
