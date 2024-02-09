import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart' hide FormData;

import '../data/model/models.dart';
import '../service/repository/repository.dart';
import '../theme/theme.dart';
import 'auth_controller.dart';

class NutritionController extends GetxController implements GetxService {
  final NutritionRepositoryImpl repository;
  final int petId;
  int nutritionId = -1;
  bool inEditMode = false;
  bool isLoading = false;
  /* -------------------------------------------------------------------------- */
  /*                              PetNutritionList                              */
  /* -------------------------------------------------------------------------- */
  bool _loadingNutrition = false;
  bool _removingNutrition = false;
  final List<NutritionBean> _nutritionListArray = [];
  ScrollController controller = ScrollController();
  int limit = 10;
  int _currentPage = 1;
  bool haveMoreResult = false;

  List<NutritionBean> get nutritionListArray => _nutritionListArray;
  bool get loadingNutrition => _loadingNutrition;
  bool get removingNutrition => _removingNutrition;
  int get currentPage => _currentPage;

  /* -------------------------------------------------------------------------- */
  /*                           Pet Nutrition Add/Edit                           */
  /* -------------------------------------------------------------------------- */
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<String> nutritionType = ['Dry Kibble', 'Wet'];
  String? _nutFoodType = 'Dry Kibble';
  String? _foodNameError;

  final TextEditingController _nutFoodName = TextEditingController();
  final TextEditingController _nutBrand = TextEditingController();
  final TextEditingController _nutLifeStage = TextEditingController();
  final TextEditingController _nutSpecies = TextEditingController();
  final TextEditingController _nutIngredients = TextEditingController();
  final TextEditingController _nutProtein = TextEditingController();
  final TextEditingController _nutFat = TextEditingController();
  final TextEditingController _nutCarbohydrate = TextEditingController();
  final TextEditingController _nutFiber = TextEditingController();
  final TextEditingController _nutCalories = TextEditingController();
  final TextEditingController _nutVitamins = TextEditingController();
  final TextEditingController _nutMinerals = TextEditingController();
  final TextEditingController _nutOmegaThreeFatty = TextEditingController();
  final TextEditingController _nutOmegaSixFatty = TextEditingController();
  final TextEditingController _nutFeedingGuidelines = TextEditingController();
  final TextEditingController _nutSpecialFeatures = TextEditingController();
  final TextEditingController _nutPrice = TextEditingController();

  TextEditingController get nutFoodName => _nutFoodName;
  TextEditingController get nutBrand => _nutBrand;
  TextEditingController get nutLifeStage => _nutLifeStage;
  TextEditingController get nutSpecies => _nutSpecies;
  TextEditingController get nutIngredients => _nutIngredients;
  TextEditingController get nutProtein => _nutProtein;
  TextEditingController get nutFat => _nutFat;
  TextEditingController get nutCarbohydrate => _nutCarbohydrate;
  TextEditingController get nutFiber => _nutFiber;
  TextEditingController get nutCalories => _nutCalories;
  TextEditingController get nutVitamins => _nutVitamins;
  TextEditingController get nutMinerals => _nutMinerals;
  TextEditingController get nutOmegaThreeFatty => _nutOmegaThreeFatty;
  TextEditingController get nutOmegaSixFatty => _nutOmegaSixFatty;
  TextEditingController get nutFeedingGuidelines => _nutFeedingGuidelines;
  TextEditingController get nutSpecialFeatures => _nutSpecialFeatures;
  TextEditingController get nutPrice => _nutPrice;

  GlobalKey<FormState> get formKey => _formKey;

  String? get nutFoodType => _nutFoodType;
  String? get foodNameError => _foodNameError;

  NutritionController({
    required this.repository,
    required this.petId,
  });

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

  void disposeController() {
    controller.removeListener(() {});
  }

  Future<void> getNutritionList() async {
    _currentPage = 1;
    _nutritionListArray.clear();
    getNutrition();
  }

  void getNutrition() async {
    _loadingNutrition = true;
    update();
    final requestParams = {
      "current_page": _currentPage,
      "limit": limit,
    };
    final result = await repository.getNutritionList(petId, requestParams);

    result.fold<void>((failure) {
      _loadingNutrition = false;
      update();
      Get.find<AuthController>().handleUnAuthorized(failure);
    }, (success) {
      _loadingNutrition = false;
      if (success.success == true) {
        final meta = success.data?.meta;
        if (meta != null) {
          haveMoreResult = meta.haveMoreRecords ?? false;
        }
        final arrayList = success.data?.data ?? [];
        if (currentPage == 1) {
          _nutritionListArray.clear();
          _nutritionListArray.addAll(arrayList);
        } else {
          _nutritionListArray.addAll(arrayList);
        }
        update();
      }
    });
  }

  Future<NutritionData?> getNutritionDetail(int nutritionId) async {
    _removingNutrition = true;
    update();
    final result = await repository.getNutritionDetail(nutritionId);
    NutritionData? information;
    result.fold<void>(
      (failure) {
        _removingNutrition = false;
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
        _removingNutrition = false;
        update();
        if (success.success == true) {
          information = success.data;
        }
      },
    );
    return information;
  }

  void deleteNutrition(int petId) async {
    if (_removingNutrition) {
      return;
    }
    _removingNutrition = true;
    update();
    final result = await repository.removeNutrition(petId);
    result.fold<void>(
      (failure) {
        _removingNutrition = false;
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
        _removingNutrition = false;
        update();
        getNutritionList();
      },
    );
  }

  /* -------------------------------------------------------------------------- */
  /*                               Add/Edit Module                              */
  /* -------------------------------------------------------------------------- */

  void onSelectNutritionType() {
    Get.bottomSheet(
      Container(
        height: 450.h,
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 15.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: nutritionType
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      Get.back();
                      _nutFoodType = e;
                      update();
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
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  void editNutritionInfo() {
    resetFieldData();
    dynamic argumentData = Get.arguments;
    if (argumentData != null && argumentData[0]['mode'] == "Edit") {
      inEditMode = true;
      NutritionData info = argumentData[1]['info'];
      nutritionId = info.nutId!;
      _nutFoodName.text = info.nutFoodName ?? "";
      _nutBrand.text = info.nutBrand ?? "";
      _nutLifeStage.text = info.nutLifeStage ?? "";
      _nutSpecies.text = info.nutSpecies ?? "";
      _nutIngredients.text = info.nutIngredients ?? "";
      _nutProtein.text = info.nutProtein ?? "";
      _nutFat.text = info.nutFat ?? "";
      _nutCarbohydrate.text = info.nutCarbohydrate ?? "";
      _nutFiber.text = info.nutFiber ?? "";
      _nutCalories.text = info.nutCalories ?? "";
      _nutVitamins.text = info.nutVitamins ?? "";
      _nutMinerals.text = info.nutMinerals ?? "";
      _nutOmegaThreeFatty.text = info.nutOmega3Fatty ?? "";
      _nutOmegaSixFatty.text = info.nutOmega6Fatty ?? "";
      _nutFeedingGuidelines.text = info.nutFeedingGuidelines ?? "";
      _nutSpecialFeatures.text = info.nutSpecialFeatures ?? "";
      _nutPrice.text = info.nutPrice.toString();
      _nutFoodType = info.nutFoodType ?? "";
    }
    update();
  }

  void saveNutritionInfo() async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    update();

    Map<String, dynamic> bodyMap = {
      "pet_id": petId,
      "nut_food_name": _nutFoodName.text,
      "nut_brand": _nutBrand.text,
      "nut_food_type": _nutFoodType,
      "nut_life_stage": _nutLifeStage.text,
      "nut_species": _nutSpecies.text,
      "nut_ingredients": _nutIngredients.text,
      "nut_protein": _nutProtein.text,
      "nut_fat": _nutFat.text,
      "nut_carbohydrate": _nutCarbohydrate.text,
      "nut_fiber": _nutFiber.text,
      "nut_calories": _nutCalories.text,
      "nut_vitamins": _nutVitamins.text,
      "nut_minerals": _nutMinerals.text,
      "nut_omega_3_fatty": _nutOmegaThreeFatty.text,
      "nut_omega_6_fatty": _nutOmegaSixFatty.text,
      "nut_feeding_guidelines": _nutFeedingGuidelines.text,
      "nut_special_features": _nutSpecialFeatures.text,
      "nut_price": _nutPrice.text,
    };

    FormData fData = FormData.fromMap(bodyMap);

    dynamic result;

    if (inEditMode) {
      result = await repository.editNutrition(nutritionId, fData);
    } else {
      result = await repository.addNutrition(fData);
    }

    result.fold<void>(
      (failure) {
        isLoading = false;
        update();

        if (!Get.find<AuthController>().handleUnAuthorized(failure)) {
          String errorMessage = failure.message;
          if (failure.errorData != null) {
            errorMessage = "error_msg".tr;
            final errorResponse = ErrorResponseDto.fromJson(failure.errorData!);

            if (errorResponse.foodName != null &&
                errorResponse.foodName!.isNotEmpty) {
              _foodNameError = errorResponse.foodName!.join("\n");
            }

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
            getNutritionList();
          },
        );
      },
    );
  }

  void resetFieldData() {
    _nutFoodType = 'Dry Kibble';
    _foodNameError = null;
    inEditMode = false;
    _nutFoodName.clear();
    _nutBrand.clear();
    _nutLifeStage.clear();
    _nutSpecies.clear();
    _nutIngredients.clear();
    _nutProtein.clear();
    _nutFat.clear();
    _nutCarbohydrate.clear();
    _nutFiber.clear();
    _nutCalories.clear();
    _nutVitamins.clear();
    _nutMinerals.clear();
    _nutOmegaThreeFatty.clear();
    _nutOmegaSixFatty.clear();
    _nutFeedingGuidelines.clear();
    _nutSpecialFeatures.clear();
    _nutPrice.clear();
  }
}
