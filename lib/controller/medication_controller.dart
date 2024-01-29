import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;

import '../data/model/models.dart';
import '../helper/helpers.dart';
import '../service/repository/repository.dart';
import '../theme/theme.dart';
import 'auth_controller.dart';

class MedicationController extends GetxController implements GetxService {
  final MedicationRepositoryImpl repository;
  final int petId;
  bool inEditMode = false;
  bool isLoading = false;

  /* -------------------------------------------------------------------------- */
  /*                             Pet Medication List                            */
  /* -------------------------------------------------------------------------- */

  bool _loadingMedication = false;
  bool _removingMedication = false;
  final List<MedicationBean> _medicationListArray = [];
  ScrollController controller = ScrollController();
  int limit = 10;
  int _currentPage = 1;
  bool haveMoreResult = false;

  List<MedicationBean> get medicationListArray => _medicationListArray;
  bool get loadingMedication => _loadingMedication;
  bool get removingMedication => _removingMedication;
  int get currentPage => _currentPage;

  MedicationController({
    required this.repository,
    required this.petId,
  });

  @override
  void onInit() {
    getNutritionList();
    super.onInit();
  }

  void setScrollListener() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        if (haveMoreResult) {
          _currentPage += 1;
          getNutrition();
        }
      }
    });
  }

  void getNutritionList() async {
    _loadingMedication = true;
    _currentPage = 1;
    update();
    getNutrition();
  }

  void getNutrition() async {
    _loadingMedication = true;
    update();
    final requestParams = {
      "current_page": _currentPage,
      "limit": limit,
    };
    final result = await repository.getMedicationList(petId, requestParams);

    result.fold<void>((failure) {
      _loadingMedication = false;
      update();
      Get.find<AuthController>().handleUnAuthorized(failure);
    }, (success) {
      _loadingMedication = false;
      if (success.success == true) {
        final meta = success.data?.meta;
        if (meta != null) {
          haveMoreResult = meta.haveMoreRecords ?? false;
        }
        final arrayList = success.data?.data ?? [];

        AppLog.e("arrayList ${success.data?.data}");
        if (currentPage == 1) {
          _medicationListArray.clear();
          _medicationListArray.addAll(arrayList);
        } else {
          _medicationListArray.addAll(arrayList);
        }
        update();
      }
    });
  }

  Future<NutritionData?> getNutritionDetail(int nutritionId) async {
    _removingMedication = true;
    update();
    final result = await repository.getMedicationDetail(petId);
    NutritionData? information;
    result.fold<void>(
      (failure) {
        _removingMedication = false;
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
        _removingMedication = false;
        update();
        if (success.success == true) {
          information = success.data;
        }
      },
    );
    return information;
  }

  void deleteNutrition(int petId) async {
    _removingMedication = true;
    update();
    final result = await repository.removeMedication(petId);
    result.fold<void>(
      (failure) {
        _removingMedication = false;
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
        _removingMedication = false;
        update();
        getNutritionList();
      },
    );
  }
}
