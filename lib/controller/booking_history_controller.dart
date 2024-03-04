import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart' hide FormData;
import 'package:pet_shouq/controller/auth_controller.dart';
import 'package:pet_shouq/controller/vet_data_controller.dart';
import 'package:pet_shouq/data/model/booking_history_details_response_model.dart';
import 'package:pet_shouq/data/model/booking_history_reponse_model.dart';
import 'package:pet_shouq/data/model/error_response_dto.dart';
import 'package:pet_shouq/helper/logger.dart';
import 'package:pet_shouq/service/repository/booking_repository.dart';
import 'package:pet_shouq/theme/app.colors.dart';

class BookingHistoryController extends GetxController implements GetxService {
  final BookingHistoryRepositoryImpl repository;

  BookingHistoryController({
    required this.repository,
  });

  bool loadingHistory = false;
  int limit = 10;
  int currentPage = 1;
  final List<BookingHistoryDatum> bookingHistoryArray = [];
  bool haveMoreResult = false;
  ScrollController controller = ScrollController();

  void setScrollListener() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        if (haveMoreResult) {
          currentPage += 1;
          getBookingHistory();
        }
      }
    });
  }

  Future<void> getBookingHistory() async {
    loadingHistory = true;
    update();
    final requestParams = {
      "current_page": currentPage,
      // "limit": limit,
    };
    final result = await repository.getBookingHistoryList(requestParams);

    result.fold<void>((failure) {
      loadingHistory = false;
      update();
      Get.find<AuthController>().handleUnAuthorized(failure);
    }, (success) {
      loadingHistory = false;
      if (success.success == true) {
        final meta = success.data?.meta;
        if (meta != null) {
          haveMoreResult = meta.haveMoreRecords ?? false;
        }
        final arrayList = success.data?.data ?? [];
        if (currentPage == 1) {
          bookingHistoryArray.clear();
          bookingHistoryArray.addAll(arrayList);
        } else {
          bookingHistoryArray.addAll(arrayList);
        }
        update();
      }
    });
  }

  bool loadingHistoryDetails = false;

  Future<BookingHistoryDetailsData?> getBookingHistoryDetails(
      {required String bookingId}) async {
    loadingHistoryDetails = true;
    update();
    final result = await repository.getBookingHistoryDetailsList(bookingId);
    BookingHistoryDetailsData? information;

    result.fold<void>((failure) {
      loadingHistoryDetails = false;
      update();
      Get.find<AuthController>().handleUnAuthorized(failure);
    }, (success) {
      loadingHistoryDetails = false;
      if (success.success == true) {
        information = success.data;
        update();
      }
    });
    return information;
  }

  bool isLoading = false;
  String selectedVetName = "";
  String vetId = "";
  String petId = "";

  setSelectedItems({required String value, required String vetIdValue}) {
    selectedVetName = value;
    vetId = vetIdValue;
    update();
  }


  void rescheduleAppointmentSlot() async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    update();

    Map<String, dynamic> bodyMap = {
      "id": petId,
      "vet_id": vetId,
      "va_id": Get.find<VetDataController>().vaId,
      "booking_date": Get.find<VetDataController>().selectionDate,
      "time_slot": Get.find<VetDataController>().selectionSlotTime,
    };
    AppLog.e("bodyMap $bodyMap");

    FormData fData = FormData.fromMap(bodyMap);

    dynamic result;

    result = await repository.rescheduleAppointmentSlot(fData);

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
        resetFields();
        isLoading = false;
        update();

        Get.snackbar(
          "Slot Book".tr,
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
      },
    );
  }

  resetFields() {

  }
}
