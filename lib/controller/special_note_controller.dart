import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart' hide FormData;
import 'package:quill_html_editor/quill_html_editor.dart';

import '../data/model/models.dart';
import '../helper/helpers.dart';
import '../service/repository/repository.dart';
import '../theme/theme.dart';
import 'auth_controller.dart';

class SpecialNoteController extends GetxController implements GetxService {
  final SpecialNoteRepositoryImpl repository;
  final int petId;
  bool inEditMode = false;
  bool isLoading = false;

  final QuillEditorController _controller = QuillEditorController();

  QuillEditorController get controller => _controller;

  SpecialNoteController({
    required this.repository,
    required this.petId,
  });

  void editFieldInfo() async {
    dynamic argumentData = Get.arguments;
    if (argumentData != null) {
      String? info = argumentData[0]['info'];
      AppLog.e("info $info");
      Future.delayed(
        const Duration(seconds: 2),
        () {
          controller.setText(info!);
        },
      );
    }
  }

  void saveSpecialNotes() async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    update();

    Map<String, dynamic> bodyMap = {
      "pet_id": petId,
      "pet_special_need": await controller.getText(),
    };

    FormData fData = FormData.fromMap(bodyMap);

    dynamic result = await repository.updateSpecialNotes(petId, fData);

    result.fold<void>(
      (failure) {
        isLoading = false;
        update();

        if (!Get.find<AuthController>().handleUnAuthorized(failure)) {
          String errorMessage = failure.message;
          if (failure.errorData != null) {
            errorMessage = "error_msg".tr;
            final errorResponse = ErrorResponseDto.fromJson(failure.errorData!);

            if (errorResponse.errors != null) {
              errorMessage = errorResponse.errors?.title ?? "";
            }
          }

          Get.snackbar(
            "error_in_request".tr,
            errorMessage,
            backgroundColor: AppColors.redColor,
            colorText: AppColors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      },
      (success) {
        controller.clear();
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
          const Duration(seconds: 3),
          () {
            Get.back(closeOverlays: true);
          },
        );
      },
    );
  }
}
