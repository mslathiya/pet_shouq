import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart' hide FormData;
import 'package:intl/intl.dart' hide TextDirection;
import '../data/model/models.dart';
import '../service/repository/repository.dart';
import '../theme/theme.dart';
import 'auth_controller.dart';

class DietLogController extends GetxController implements GetxService {
  final DietLogRepositoryImpl repository;
  final int petId;
  int dietId = -1;
  bool inEditMode = false;
  bool isLoading = false;

  /* -------------------------------------------------------------------------- */
  /*                             Pet Diet List
  */
  /* -------------------------------------------------------------------------- */
  List<String> withWaterArray = ["Yes", "No"];
  bool _loadingDietLog = false;
  bool _removingDietLog = false;
  final List<DietLogInfo> _dietLogListArray = [];
  ScrollController controller = ScrollController();
  int limit = 10;
  int _currentPage = 1;
  bool haveMoreResult = false;

  List<DietLogInfo> get dietLogListArray => _dietLogListArray;
  bool get loadingDietLog => _loadingDietLog;
  bool get removingDietLog => _removingDietLog;
  int get currentPage => _currentPage;

  /* -------------------------------------------------------------------------- */
  /*                             Diet Add/Edit                            
  */
  /* -------------------------------------------------------------------------- */
  final GlobalKey<FormState> _dietAddEditKey = GlobalKey<FormState>();

  String _date = DateFormat('yyyy-MM-dd').format(
    DateTime.now(),
  );
  DateTime _time = DateTime.now();
  String _water = "Yes";

  String? _foodNameError;
  String? _waterError;

  final TextEditingController _foodName = TextEditingController();
  final TextEditingController _portionSize = TextEditingController();
  final TextEditingController _specialInstructions = TextEditingController();
  final TextEditingController _weight = TextEditingController();

  TextEditingController get foodName => _foodName;
  TextEditingController get portionSize => _portionSize;
  TextEditingController get specialInstructions => _specialInstructions;
  TextEditingController get weight => _weight;

  String? get water => _water;
  String? get date => _date;
  String? get time => DateFormat.jm().format(
        _time,
      );
  String? get foodNameError => _foodNameError;
  String? get waterError => _waterError;

  GlobalKey<FormState> get dietAddEditKey => _dietAddEditKey;

  DietLogController({
    required this.repository,
    required this.petId,
  });

  void setScrollListener() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        if (haveMoreResult) {
          _currentPage += 1;
          getDietLog();
        }
      }
    });
  }

  Future<void> getDietLogList() async {
    _currentPage = 1;
    _dietLogListArray.clear();
    getDietLog();
  }

  void getDietLog() async {
    _loadingDietLog = true;
    update();
    final requestParams = {
      "current_page": _currentPage,
      "limit": limit,
    };
    final result = await repository.getDietLogList(petId, requestParams);

    result.fold<void>((failure) {
      _loadingDietLog = false;
      update();
      Get.find<AuthController>().handleUnAuthorized(failure);
    }, (success) {
      _loadingDietLog = false;
      if (success.success == true) {
        final meta = success.data?.meta;
        if (meta != null) {
          haveMoreResult = meta.haveMoreRecords ?? false;
        }
        final arrayList = success.data?.data ?? [];
        if (currentPage == 1) {
          _dietLogListArray.clear();
          _dietLogListArray.addAll(arrayList);
        } else {
          _dietLogListArray.addAll(arrayList);
        }
        update();
      }
    });
  }

  Future<DietDetailBean?> getDietDetail(int dietId) async {
    _removingDietLog = true;
    update();
    final result = await repository.getDietLogDetail(dietId);
    DietDetailBean? information;
    result.fold<void>(
      (failure) {
        _removingDietLog = false;
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
        _removingDietLog = false;
        update();
        if (success.success == true) {
          information = success.data;
        }
      },
    );
    return information;
  }

  void deleteDietLog(int petId) async {
    _removingDietLog = true;
    update();
    final result = await repository.removeDietLog(petId);
    result.fold<void>(
      (failure) {
        _removingDietLog = false;
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
        _removingDietLog = false;
        update();
        getDietLogList();
      },
    );
  }

  /* -------------------------------------------------------------------------- */
  /*                               Add/Edit module                              */
  /* -------------------------------------------------------------------------- */

  void editDietLog() {
    resetFieldData();

    dynamic argumentData = Get.arguments;
    if (argumentData != null && argumentData[0]['mode'] == "Edit") {
      inEditMode = true;
      DietDetailBean info = argumentData[1]['info'];
      dietId = info.dietId!;

      _foodName.text = info.dietFoodName ?? "";
      _portionSize.text = info.dietPortionSize ?? "";
      _specialInstructions.text = info.dietSpecialInstructions ?? "";
      _weight.text = info.dietWeight ?? "";

      _date = DateFormat('yyyy-MM-dd').format(
        info.dietDate ?? DateTime.now(),
      );

      _time = DateTime.parse("$_date ${info.dietTime ?? ""}");
      _water = info.dietWater ?? "Yes";

      _foodNameError = null;
      _waterError = null;
    }
    update();
  }

  void openDatePicker() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(
        DateTime.now().year + 100,
        DateTime.now().month,
        DateTime.now().day,
      ),
    );
    if (picked != null) {
      _date = DateFormat('yyyy-MM-dd').format(picked);
      update();
    }
  }

  void openTimePicker() async {
    final TimeOfDay? picked = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dialOnly,
      orientation: Orientation.portrait,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                alwaysUse24HourFormat: false,
              ),
              child: child!,
            ),
          ),
        );
      },
    );
    if (picked != null) {
      _time = DateTime.parse(
          "$_date ${picked.hour < 10 ? "0${picked.hour}" : picked.hour}:${picked.minute < 10 ? "0${picked.minute}" : picked.minute}:00");

      update();
    }
  }

  void selectWithWater() {
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
          children: withWaterArray
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    Get.back();
                    _water = e;
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
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  void saveDietInfo() async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    update();

    Map<String, dynamic> bodyMap = {
      "pet_id": petId,
      "diet_food_name": _foodName.text,
      "diet_date": _date,
      "diet_time": DateFormat("hh:mm:ss").format(
        _time,
      ),
      "diet_portion_size": _portionSize.text,
      "diet_special_instructions": _specialInstructions.text,
      "diet_water": _water,
      "diet_weight": _weight.text,
    };

    FormData fData = FormData.fromMap(bodyMap);

    dynamic result;

    if (inEditMode) {
      result = await repository.updateDietLog(dietId, fData);
    } else {
      result = await repository.addDietLog(fData);
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

            if (errorResponse.dietFoodName != null &&
                errorResponse.dietFoodName!.isNotEmpty) {
              _foodNameError = errorResponse.dietFoodName!.join("\n");
            }

            if (errorResponse.dietWater != null &&
                errorResponse.dietWater!.isNotEmpty) {
              _waterError = errorResponse.dietWater!.join("\n");
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
            getDietLogList();
          },
        );
      },
    );
  }

  void resetFieldData() {
    inEditMode = false;

    _date = DateFormat('yyyy-MM-dd').format(
      DateTime.now(),
    );
    _time = DateTime.now();

    _water = "Yes";

    _foodNameError = null;
    _waterError = null;

    _foodName.clear();
    _portionSize.clear();
    _specialInstructions.clear();
    _weight.clear();
  }
}
