import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart' hide FormData;
import 'package:intl/intl.dart';

import '../data/model/models.dart';
import '../helper/helpers.dart';
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
  List<MedicationType> medicationTypeList = [];
  MedicationType? _mediType;

  String? _mediStartDate = DateFormat('yyyy-MM-dd').format(
    DateTime.now(),
  );
  String? _mediEndDate = DateFormat('yyyy-MM-dd').format(
    DateTime.now(),
  );

  String? _mediNameError;
  String? _mediTypeError;

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

  MedicationType? get mediType => _mediType;
  String? get mediStartDate => _mediStartDate;
  String? get mediEndDate => _mediEndDate;
  String? get mediNameError => _mediNameError;
  String? get mediTypeError => _mediTypeError;
  GlobalKey<FormState> get formKey => _formKey;

  MedicationController({
    required this.repository,
    required this.petId,
  });

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

  void disposeController() {
    controller.removeListener(() {});
  }

  Future<void> getMedicationList() async {
    _currentPage = 1;
    _medicationListArray.clear();
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

  Future<MedicationInfo?> getMedicationDetail(int medicationId) async {
    _removingMedication = true;
    update();
    final result = await repository.getMedicationDetail(medicationId);
    MedicationInfo? information;
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

  void deleteMedication(int medicationId) async {
    if (_removingMedication) {
      return;
    }
    _removingMedication = true;
    update();
    final result = await repository.removeMedication(medicationId);
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

  void editMedicationDetail() async {
    dynamic argumentData = Get.arguments;
    if (argumentData != null && argumentData[0]['mode'] == "Edit") {
      inEditMode = true;
      MedicationInfo info = argumentData[1]['info'];
      medicationId = info.mediId ?? -1;
      _mediName.text = info.mediName ?? "";
      _mediPreVeterinarian.text = info.mediPreVeterinarian ?? "";
      _mediPetSpecies.text = info.mediPetSpecies ?? "";
      _mediDosage.text = info.mediDosage ?? "";
      _mediFrequency.text = info.mediFrequency ?? "";
      _mediDuration.text = info.mediDuration ?? "";
      _mediReasonPrescription.text = info.mediReasonPrescription ?? "";
      _mediAdminInstruction.text = info.mediAdminInstruction ?? "";
      _mediRefills.text = info.mediRefills ?? "";
      _mediSpecialNotes.text = info.mediSpecialNotes ?? "";

      _mediType = info.typeDetail;

      _mediStartDate = DateFormat('yyyy-MM-dd').format(
        info.mediStartDate ?? DateTime.now(),
      );
      _mediEndDate = DateFormat('yyyy-MM-dd').format(
        info.mediEndDate ?? DateTime.now(),
      );
      _mediNameError = null;
      _mediTypeError = null;
    }
  }

  void getMedicationTypeList() async {
    final result = await repository.getMedicationTypeList();
    result.fold<void>(
      (failure) {
        if (!Get.find<AuthController>().handleUnAuthorized(failure)) {
          editMedicationDetail();
          update();
        }
      },
      (success) {
        if (success.success == true) {
          medicationTypeList = success.data ?? List.empty();
          _mediType = medicationTypeList[0];
          resetFieldData();
          Future.delayed(
            const Duration(seconds: 1),
            () {
              editMedicationDetail();
              update();
            },
          );
        }
      },
    );
  }

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
                    _mediTypeError = null;
                    update();
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Text(
                      e.title ?? "",
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
    if (mediType == null) {
      _mediTypeError = "dynamic_field_required".trParams({
        "field": "lbl_medication_type".tr,
      });
      update();
      return;
    }

    if (isLoading) {
      return;
    }
    isLoading = true;
    update();

    Map<String, dynamic> bodyMap = {
      "pet_id": petId,
      "medi_name": _mediName.text,
      "medi_type": _mediType?.id ?? "",
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

    AppLog.e("bodyMap $bodyMap");

    FormData fData = FormData.fromMap(bodyMap);

    dynamic result;

    if (inEditMode) {
      result = await repository.updateMedication(medicationId, fData);
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
            getMedicationList();
          },
        );
      },
    );
  }

  void resetFieldData() {
    _mediType = medicationTypeList.isNotEmpty ? medicationTypeList[0] : null;
    _mediStartDate = DateFormat('yyyy-MM-dd').format(
      DateTime.now(),
    );
    _mediEndDate = DateFormat('yyyy-MM-dd').format(
      DateTime.now(),
    );
    _mediNameError = null;

    _mediName.clear();
    _mediPreVeterinarian.clear();
    _mediPetSpecies.clear();
    _mediDosage.clear();
    _mediFrequency.clear();
    _mediDuration.clear();
    _mediReasonPrescription.clear();
    _mediAdminInstruction.clear();
    _mediRefills.clear();
    _mediSpecialNotes.clear();
  }
}
