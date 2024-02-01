import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart' hide FormData;
import 'package:intl/intl.dart';

import '../data/model/models.dart';
import '../service/repository/repository.dart';
import '../theme/theme.dart';
import 'auth_controller.dart';

class MedicationController extends GetxController implements GetxService {
  final MedicationRepositoryImpl repository;
  final int petId;
  int medicationId = -1;
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

  /* -------------------------------------------------------------------------- */
  /*                             Medication Add/Edit                            */
  /* -------------------------------------------------------------------------- */
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> medicationTypeList = ['Liquid', "Tablet"];
  String? _mediType = "Liquid";

  String? _mediStartDate = DateFormat('yyyy-MM-dd').format(
    DateTime.now(),
  );
  String? _mediEndDate = DateFormat('yyyy-MM-dd').format(
    DateTime.now(),
  );

  String? _mediNameError;

  final TextEditingController _mediName = TextEditingController();
  final TextEditingController _mediPreVeterinarian = TextEditingController();
  final TextEditingController _mediPetSpecies = TextEditingController();
  final TextEditingController _mediDosage = TextEditingController();
  final TextEditingController _mediFrequency = TextEditingController();
  final TextEditingController _mediDuration = TextEditingController();
  final TextEditingController _mediReasonPrescription = TextEditingController();
  final TextEditingController _mediAdminInstruction = TextEditingController();
  final TextEditingController _mediRefills = TextEditingController();
  final TextEditingController _mediSpecialNotes = TextEditingController();

  TextEditingController get mediName => _mediName;
  TextEditingController get mediPreVeterinarian => _mediPreVeterinarian;
  TextEditingController get mediPetSpecies => _mediPetSpecies;
  TextEditingController get mediDosage => _mediDosage;
  TextEditingController get mediFrequency => _mediFrequency;
  TextEditingController get mediDuration => _mediDuration;
  TextEditingController get mediReasonPrescription => _mediReasonPrescription;
  TextEditingController get mediAdminInstruction => _mediAdminInstruction;
  TextEditingController get mediRefills => _mediRefills;
  TextEditingController get mediSpecialNotes => _mediSpecialNotes;

  String? get mediType => _mediType;
  String? get mediStartDate => _mediStartDate;
  String? get mediEndDate => _mediEndDate;
  String? get mediNameError => _mediNameError;
  GlobalKey<FormState> get formKey => _formKey;

  MedicationController({
    required this.repository,
    required this.petId,
  });

  @override
  void onInit() {
    getMedicationList();
    super.onInit();
  }

  void setScrollListener() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        if (haveMoreResult) {
          _currentPage += 1;
          getMedication();
        }
      }
    });
  }

  Future<void> getMedicationList() async {
    _loadingMedication = true;
    _currentPage = 1;
    update();
    getMedication();
  }

  void getMedication() async {
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

  Future<NutritionData?> getMedicationDetail(int nutritionId) async {
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

  void deleteMedication(int petId) async {
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
        getMedicationList();
      },
    );
  }

  /* -------------------------------------------------------------------------- */
  /*                               Add/Edit module                              */
  /* -------------------------------------------------------------------------- */

  void selectMedicationType() {
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
          children: medicationTypeList
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    Get.back();
                    _mediType = e;
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

  void openDatePicker(int pickType) async {
    DateTime firstDate = DateTime.now();

    if (pickType == 2) {
      if (_mediStartDate != '') {
        firstDate = DateTime.parse(_mediStartDate!);
      }
    }

    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: firstDate,
      firstDate: firstDate,
      lastDate: DateTime(
        DateTime.now().year + 100,
        DateTime.now().month,
        DateTime.now().day,
      ),
    );
    if (picked != null) {
      if (pickType == 1) {
        _mediStartDate = DateFormat('yyyy-MM-dd').format(picked);
      } else {
        _mediEndDate = DateFormat('yyyy-MM-dd').format(picked);
      }
      update();
    }
  }

  void saveMedicationInfo() async {
    isLoading = true;
    update();

    Map<String, dynamic> bodyMap = {
      "pet_id": petId,
      "medi_name": _mediName.text,
      "medi_type": _mediType,
      "medi_pre_veterinarian": _mediPreVeterinarian.text,
      "medi_pet_species": _mediPetSpecies.text,
      "medi_dosage": _mediDosage.text,
      "medi_frequency": _mediFrequency.text,
      "medi_duration": _mediDuration.text,
      "medi_reason_prescription": _mediReasonPrescription.text,
      "medi_admin_instruction": _mediAdminInstruction.text,
      "medi_start_date": _mediStartDate,
      "medi_end_date": _mediEndDate,
      "medi_refills": _mediRefills.text,
      "medi_special_notes": _mediSpecialNotes.text,
    };

    FormData fData = FormData.fromMap(bodyMap);

    dynamic result;

    if (inEditMode) {
      result = await repository.updateMedication(petId, fData);
    } else {
      result = await repository.addMedication(fData);
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

            if (errorResponse.mediName != null &&
                errorResponse.mediName!.isNotEmpty) {
              _mediNameError = errorResponse.mediName!.join("\n");
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
            getMedicationList();
          },
        );
      },
    );
  }
}
