import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:pet_shouq/data/model/error_response_dto.dart';
import 'package:pet_shouq/data/model/feeding_schedule_response_model.dart';
import 'package:pet_shouq/helper/helpers.dart';
import 'package:pet_shouq/service/repository/pet_feeding_schedule_repository.dart';
import 'package:pet_shouq/theme/app.colors.dart';

import 'auth_controller.dart';

class PetFeedingSchedulesController extends GetxController implements GetxService {
  final PetFeedingSchedulesRepositoryImpl repository;

  PetFeedingSchedulesController({
    required this.repository,
  });

  bool loadingFeedingData = false;
  int limit = 10;
  int currentPage = 1;
  String petId = "";

  final List<FeedingScheduleList> petFeedingSchedulesArray = [];
  bool haveMoreResult = false;
  ScrollController controller = ScrollController();

  void setScrollListener() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        if (haveMoreResult) {
          currentPage += 1;
          getFeedingSchedulesData();
        }
      }
    });
  }

  bool isLoading = false;

  Future<void> getFeedingSchedulesData() async {
    loadingFeedingData = true;
    update();

    petFeedingSchedulesArray.clear();
    final result = await repository.getFeedingSchedulesList(petId);
    result.fold<void>((failure) {
      loadingFeedingData = false;
      update();
      Get.find<AuthController>().handleUnAuthorized(failure);
    }, (success) {
      loadingFeedingData = false;
      if (success.success == true) {
        final meta = success.data?.meta;
        if (meta != null) {
          haveMoreResult = meta.haveMoreRecords ?? false;
        }
        final arrayList = success.data?.data ?? [];
        if (currentPage == 1) {
          petFeedingSchedulesArray.clear();
          petFeedingSchedulesArray.addAll(arrayList);
        } else {
          petFeedingSchedulesArray.addAll(arrayList);
        }
        update();
      }
    });
  }

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController feedingTitle = TextEditingController();
  TextEditingController feedingNotes = TextEditingController();
  String selectedFeedingTime = "";
  String frequency = "one_day";
  List feedingDaysList = [];
  List<Map<String, dynamic>> selectedName = [];
  List showName = [];

  getDaysName() {
    selectedName.sort((a, b) => a['index'].compareTo(b['index']));
    showName = [];
    for (var element in selectedName) {
      showName.add(element['value'].toString().capitalizeFirst);
    }
  }

  setDayInCustomFeed(value, allMap) {
    if (feedingDaysList.contains(value)) {
      feedingDaysList.remove(value);
      selectedName.remove(allMap);
    } else {
      feedingDaysList.add(value);
      selectedName.add(allMap);
    }
    getDaysName();
    update();
  }

  void saveFeedingSchedulesData() async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    update();

    Map<String, dynamic> bodyMap = {
      "pet_id": petId,
      "fs_title": feedingTitle.text.trim(),
      "fs_time": selectedFeedingTime,
      "fs_frequency": frequency,
      "fs_notes": feedingNotes.text.trim(),
      "fs_custom_days[]": feedingDaysList,
    };

    AppLog.e("bodyMap ${bodyMap.toString()}");

    FormData fData = FormData.fromMap(bodyMap);

    dynamic result;

    result = await repository.addFeedingSchedules(fData);

    result.fold<void>(
      (failure) {
        isLoading = false;
        update();

        if (!Get.find<AuthController>().handleUnAuthorized(failure)) {
          String errorMessage = "error_msg".tr;

          if (failure.errorData != null) {
            errorMessage = failure.message;

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
        resetFieldData();
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
            getFeedingSchedulesData();
          },
        );
      },
    );
  }

  resetFieldData() {
    feedingTitle.clear();
    feedingNotes.clear();
    selectedFeedingTime = "";
    frequency = "";
    feedingDaysList = [];
    update();
  }
}
