import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart' hide FormData;
import 'package:pet_shouq/data/model/error_response_dto.dart';
import 'package:pet_shouq/data/model/vat_details_response_model.dart';
import 'package:pet_shouq/data/model/vet_list_response_model.dart';
import 'package:pet_shouq/data/model/vet_slot_data_response_mode;.dart';
import 'package:pet_shouq/helper/logger.dart';
import 'package:pet_shouq/service/repository/vet_data_repository.dart';
import 'package:pet_shouq/theme/app.colors.dart';

import 'auth_controller.dart';

class VetDataController extends GetxController {
  final VetDataRepositoryImpl repository;

  VetDataController({
    required this.repository,
  });

  bool _loadingVet = false;

  bool get loadingVet => _loadingVet;
  bool haveMoreResult = false;
  int _currentPage = 1;

  int get currentPage => _currentPage;

  final List<VetDataDatum> _vetDataList = [];

  List<VetDataDatum> get vetDataList => _vetDataList;

  void getVetData({required String latitude, required String longitude}) async {
    _loadingVet = true;
    update();
    final result = await repository.getVetList(latitude, longitude);

    result.fold<void>((failure) {
      _loadingVet = false;
      update();
      Get.find<AuthController>().handleUnAuthorized(failure);
    }, (success) {
      _loadingVet = false;
      if (success.success == true) {
        final vetDataList = success.data;

        if (vetDataList != null) {
          haveMoreResult = vetDataList.meta?.haveMoreRecords ?? false;
        }
        final arrayList = success.data?.data ?? [];
        if (currentPage == 1) {
          _vetDataList.clear();
          _vetDataList.addAll(arrayList);
        } else {
          _vetDataList.addAll(arrayList);
        }
        update();
      }
    });
  }

  bool loadingVetDetails = false;

  Future<VetDetailsData?> getVetDetailsData({required String veterinarianId}) async {
    loadingVetDetails = true;
    update();
    final result = await repository.getVetDetails(veterinarianId);
    VetDetailsData? information;

    result.fold<void>((failure) {
      loadingVetDetails = false;
      update();
      Get.find<AuthController>().handleUnAuthorized(failure);
    }, (success) {
      loadingVetDetails = false;
      if (success.success == true) {
        information = success.data;
        update();
      }
    });

    return information;
  }

  bool loadingGetSlot = false;
  List<VetSlotDataList> slotDataList = [];
  int selectedDateIndex = 0;
  String selectionDate = "";
  String selectedSlotIndex = "";
  String selectionSlotTime = "";
  String vaId = "";

  setDateSelected(
      {required int index, required String selectedDate, required String vetId}) {
    selectedDateIndex = index;
    selectionDate = selectedDate;
    update();
    getSlotListData(date: selectedDate, vetId: vetId);
  }

  setTimeSelected(
      {required String index,
      required String selectedSlotTime,
      required String vatIdValue}) {
    selectedSlotIndex = index;
    selectionSlotTime = selectedSlotTime;
    vaId = vatIdValue;
    update();
  }

  void getSlotListData({required String date, required String vetId}) async {
    loadingGetSlot = true;
    update();
    final result = await repository.getVetSlotList(date, vetId);

    result.fold<void>((failure) {
      loadingGetSlot = false;
      update();
      Get.find<AuthController>().handleUnAuthorized(failure);
    }, (success) {
      loadingGetSlot = false;
      if (success.success == true) {
        slotDataList.clear();
        slotDataList.addAll(success.data ?? []);
        update();
      }
    });
  }

  bool isLoading = false;
  String selectedDogName = "";
  String petId = "";

  setSelectedItems({required String value, required String petIdValue}) {
    selectedDogName = value;
    petId = petIdValue;
    update();
  }

  TextEditingController diseaseTextController = TextEditingController();
  TextEditingController specialNotesController = TextEditingController();
  String vetId = "";
  GlobalKey<FormState> bookingKey = GlobalKey();

  void bookVetSlot() async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    update();

    Map<String, dynamic> bodyMap = {
      "pet_id": petId,
      "vet_id": vetId,
      "va_id": vaId,
      "disease": diseaseTextController.text.toString(),
      "special_notes": specialNotesController.text.toString(),
      "booking_date": selectionDate,
      "time_slot": selectionSlotTime,
    };
    AppLog.e("bodyMap $bodyMap");

    FormData fData = FormData.fromMap(bodyMap);

    dynamic result;

    result = await repository.bookVetSlot(fData);

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
    diseaseTextController.clear();
    specialNotesController.clear();
  }
}
