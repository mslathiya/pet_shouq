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

class VaccinationController extends GetxController implements GetxService {
  final VaccinationRepositoryImpl repository;
  final int petId;
  int vaccinationId = -1;
  bool inEditMode = false;
  bool isLoading = false;
  /* -------------------------------------------------------------------------- */
  /*                            Pet Vaccination List                           */
  /* -------------------------------------------------------------------------- */

  bool _loadingVaccination = false;
  bool _removingVaccination = false;
  final List<VaccinationBean> _vaccinationListArray = [];
  ScrollController controller = ScrollController();
  int limit = 10;
  int _currentPage = 1;
  bool haveMoreResult = false;

  List<VaccinationBean> get vaccinationListArray => _vaccinationListArray;
  bool get loadingVaccination => _loadingVaccination;
  bool get removingVaccination => _removingVaccination;
  int get currentPage => _currentPage;

  /* -------------------------------------------------------------------------- */
  /*                          Pet Vaccination Add/Edit                          */
  /* -------------------------------------------------------------------------- */

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<String> vaccinationType = ['Core', 'Non-core'];
  String? _vacType = 'Core';
  String? _vacTypeError;
  String? _vacNameError;

  String? _vacDate = DateFormat('yyyy-MM-dd').format(
    DateTime.now(),
  );
  String? _vacDueDate = DateFormat('yyyy-MM-dd').format(
    DateTime.now(),
  );

  final TextEditingController _vacName = TextEditingController();
  final TextEditingController _vacPetSpecies = TextEditingController();
  final TextEditingController _vacProvider = TextEditingController();
  final TextEditingController _vacLotNo = TextEditingController();
  final TextEditingController _vacCertificateId = TextEditingController();

  TextEditingController get vacName => _vacName;
  TextEditingController get vacPetSpecies => _vacPetSpecies;
  TextEditingController get vacProvider => _vacProvider;
  TextEditingController get vacLotNo => _vacLotNo;
  TextEditingController get vacCertificateId => _vacCertificateId;

  GlobalKey<FormState> get formKey => _formKey;

  String? get vacType => _vacType;
  String? get vecTypeError => _vacTypeError;
  String? get vacNameError => _vacNameError;
  String? get vacDate => _vacDate;
  String? get vacDueDate => _vacDueDate;

  VaccinationController({
    required this.repository,
    required this.petId,
  });

  void setScrollListener() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        if (haveMoreResult) {
          _currentPage += 1;
          getVaccination();
        }
      }
    });
  }

  void disposeController() {
    controller.removeListener(() {});
  }

  Future<void> getVaccinationList() async {
    _currentPage = 1;
    _vaccinationListArray.clear();
    getVaccination();
  }

  void getVaccination() async {
    _loadingVaccination = true;
    update();
    final requestParams = {
      "current_page": _currentPage,
      "limit": limit,
    };
    final result = await repository.getVaccinationList(petId, requestParams);

    result.fold<void>((failure) {
      _loadingVaccination = false;
      update();
      Get.find<AuthController>().handleUnAuthorized(failure);
    }, (success) {
      _loadingVaccination = false;
      if (success.success == true) {
        final meta = success.data?.meta;
        if (meta != null) {
          haveMoreResult = meta.haveMoreRecords ?? false;
        }
        final arrayList = success.data?.data ?? [];
        if (currentPage == 1) {
          _vaccinationListArray.clear();
          _vaccinationListArray.addAll(arrayList);
        } else {
          _vaccinationListArray.addAll(arrayList);
        }
        update();
      }
    });
  }

  Future<VaccinationDetail?> getVaccinationDetails(int vaccinationId) async {
    _removingVaccination = true;
    update();
    final result = await repository.getVaccinationDetail(vaccinationId);
    VaccinationDetail? information;
    result.fold<void>(
      (failure) {
        _removingVaccination = false;
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
        _removingVaccination = false;
        update();
        if (success.success == true) {
          information = success.data;
        }
      },
    );
    return information;
  }

  void deleteVaccination(int petId) async {
    if (_removingVaccination) {
      return;
    }
    _removingVaccination = true;
    update();
    final result = await repository.removeVaccination(petId);
    result.fold<void>(
      (failure) {
        _removingVaccination = false;
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
        _removingVaccination = false;
        update();
        getVaccinationList();
      },
    );
  }

  /* -------------------------------------------------------------------------- */
  /*                               Add/Edit Module                              */
  /* -------------------------------------------------------------------------- */

  void onSelectVaccinationType() {
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
            children: vaccinationType
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      Get.back();
                      _vacType = e;
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

  void editVaccinationInfo() {
    resetFieldData();
    dynamic argumentData = Get.arguments;
    if (argumentData != null && argumentData[0]['mode'] == "Edit") {
      inEditMode = true;
      VaccinationBean info = argumentData[1]['info'];
      vaccinationId = info.vacId!;
      _vacName.text = info.vacName ?? "";
      _vacPetSpecies.text = "";
      _vacProvider.text = "";
      _vacCertificateId.text = "";
      _vacType = info.vacType ?? "";
    }
    update();
  }

  void saveVaccinationInfo() async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    update();

    Map<String, dynamic> bodyMap = {
      "pet_id": petId,
      "vac_pet_species": _vacPetSpecies.text,
      "vac_name": _vacName.text,
      "vac_type": _vacType,
      "vac_date": _vacDate,
      "vac_due_date": _vacDueDate,
      "vac_provider": _vacProvider.text,
      "vac_lot_number": _vacLotNo.text,
      "vac_certificate_id": _vacCertificateId.text,
    };

    FormData fData = FormData.fromMap(bodyMap);

    dynamic result;

    if (inEditMode) {
      result = await repository.editVaccination(vaccinationId, fData);
    } else {
      result = await repository.addVaccination(fData);
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
              _vacTypeError = errorResponse.foodName!.join("\n");
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
            getVaccinationList();
          },
        );
      },
    );
  }

  void openDatePicker(int viewType) async {
    DateTime firstDate = DateTime.now();

    if (viewType == 2) {
      if (_vacDate != '') {
        firstDate = DateTime.parse(_vacDate!);
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
      if (viewType == 1) {
        _vacDate = DateFormat('yyyy-MM-dd').format(picked);
      } else {
        _vacDueDate = DateFormat('yyyy-MM-dd').format(picked);
      }
      update();
    }
  }

  void resetFieldData() {
    _vacType = 'Core';
    _vacTypeError = null;
    _vacNameError = null;
    inEditMode = false;
    _vacName.clear();
    _vacPetSpecies.clear();
    _vacProvider.clear();
    _vacCertificateId.clear();
    _vacDate = DateFormat('yyyy-MM-dd').format(
      DateTime.now(),
    );
    _vacDueDate = DateFormat('yyyy-MM-dd').format(
      DateTime.now(),
    );
  }
}
