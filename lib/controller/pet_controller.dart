import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:image_cropper/image_cropper.dart';
import 'package:intl/intl.dart';

import '../data/model/models.dart';
import '../helper/helpers.dart';
import '../service/repository/repository.dart';
import '../theme/theme.dart';

class PetController extends GetxController implements GetxService {
  PetRepositoryImpl repository;
  bool isLoading = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> spayedList = ['Yes', "No"];

  final TextEditingController _petName = TextEditingController();
  final TextEditingController _marking = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _height = TextEditingController();
  final TextEditingController _chipNumber = TextEditingController();
  final TextEditingController _pedigreeFront = TextEditingController();
  final TextEditingController _pedigreeBack = TextEditingController();
  final TextEditingController _allergy = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _qrCode = TextEditingController();
  final TextEditingController _petCareAddress = TextEditingController();

  String? _imagePath = '';
  String? _isSpayed = "No";
  String? _birthDate = DateFormat('yyyy-MM-dd').format(
    DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day - 1,
    ),
  );
  String? _breed = breedList[0];
  String? _petNameError;
  String? _birthDateError;
  bool _differentAddress = false;

  GlobalKey<FormState> get formKey => _formKey;

  String? get imagePath => _imagePath;
  String? get isSpayed => _isSpayed;
  String? get birthDate => _birthDate;
  String? get breed => _breed;
  String? get petNameError => _petNameError;
  String? get birthDateError => _birthDateError;

  bool get differentAddress => _differentAddress;

  TextEditingController get petName => _petName;
  TextEditingController get marking => _marking;
  TextEditingController get weight => _weight;
  TextEditingController get height => _height;
  TextEditingController get chipNumber => _chipNumber;
  TextEditingController get pedigreeFront => _pedigreeFront;
  TextEditingController get pedigreeBack => _pedigreeBack;
  TextEditingController get allergy => _allergy;
  TextEditingController get description => _description;
  TextEditingController get qrCode => _qrCode;
  TextEditingController get petCareAddress => _petCareAddress;

  /* -------------------------------------------------------------------------- */
  /*                                   petList                                  */
  /* -------------------------------------------------------------------------- */
  bool _loadingPetList = false;
  bool _removingPet = false;
  final List<PetItemBean> _petListArray = [];
  ScrollController controller = ScrollController();
  int limit = 10;
  int _currentPage = 1;
  bool haveMoreResult = false;

  List<PetItemBean> get petListArray => _petListArray;
  bool get loadingPetList => _loadingPetList;
  bool get removingPet => _removingPet;
  int get currentPage => _currentPage;

  PetController({required this.repository});

  void onPickImage(CroppedFile file) {
    _imagePath = file.path;
    update();
  }

  void onChangeType(String type) {
    _isSpayed = type;
    update();
  }

  void onSelectBreed(String breed) {
    _breed = breed;
    update();
  }

  void haveDifferentAddress() {
    _differentAddress = !_differentAddress;
    update();
  }

  void openSpayedPicker() {
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
          children: spayedList
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    Get.back();
                    onChangeType(e);
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

  void openBreedPicker() {
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
            children: breedList
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      Get.back();
                      onSelectBreed(e);
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

  void openDatePicker() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day - 1,
      ),
      firstDate: DateTime(
        DateTime.now().year - 60,
        DateTime.now().month,
        DateTime.now().day,
      ),
      lastDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day - 1,
      ),
    );
    if (picked != null) {
      _birthDate = DateFormat('yyyy-MM-dd').format(picked);
      update();
    }
  }

  void savePetData() async {
    isLoading = true;
    update();

    Map<String, dynamic> bodyMap = {
      "pet_name": _petName.text,
      "pet_breed": _breed,
      "pet_color": _marking.text,
      "pet_dob": _birthDate,
      "pet_height": _height.text,
      "pet_weight": _weight.text,
      "pet_microchip_number": _chipNumber.text,
      "pet_is_neutered": _isSpayed,
      "pet_pedigree_info_frontside": _pedigreeFront.text,
      "pet_pedigree_info_backside": _pedigreeBack,
      "pet_allergies": _allergy.text,
      "pet_takecare_address": _petCareAddress.text,
      "pet_description": _description.text,
      "pet_qr_code_number": _qrCode.text,
    };

    FormData fData = FormData.fromMap(bodyMap);

    if (imagePath != null &&
        imagePath != '' &&
        !imagePath.toString().hasValidUrl()) {
      fData.files.add(
        MapEntry(
          "pet_profile_photo",
          await MultipartFile.fromFile(
            imagePath!,
          ),
        ),
      );
    }

    final result = await repository.addPet(fData);

    result.fold<void>(
      (failure) {
        String errorMessage = failure.message;

        if (failure.errorData != null) {
          errorMessage = "error_msg".tr;

          final errorResponse = ErrorResponseDto.fromJson(failure.errorData!);

          if (errorResponse.petName != null &&
              errorResponse.petName!.isNotEmpty) {
            _petNameError = errorResponse.petName!.join("\n");
          }
          if (errorResponse.petDob != null &&
              errorResponse.petDob!.isNotEmpty) {
            _birthDateError = errorResponse.petDob!.join("\n");
          }
        }

        isLoading = false;
        update();
        Get.snackbar(
          "error_in_request".tr,
          errorMessage,
          backgroundColor: AppColors.redColor,
          colorText: AppColors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
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
            resetRequest();
          },
        );
      },
    );
  }

  /* -------------------------------------------------------------------------- */
  /*                                   Get Pet                                  */
  /* -------------------------------------------------------------------------- */

  void resetRequest() {
    _loadingPetList = true;
    _currentPage = 1;
    getPetList();
  }

  void setScrollListener() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        if (haveMoreResult) {
          _currentPage += 1;
          getPetList();
        }
      }
    });
  }

  void getPetList() async {
    _loadingPetList = true;
    update();
    final requestParams = {
      "current_page": _currentPage,
      "limit": limit,
    };
    final result = await repository.getPetList(requestParams);

    result.fold<void>((failure) {
      _loadingPetList = false;
      update();
    }, (success) {
      _loadingPetList = false;
      // update();
      if (success.success == true) {
        final meta = success.data?.meta;
        if (meta != null) {
          haveMoreResult = meta.haveMoreRecords ?? false;
        }
        final arrayList = success.data?.data ?? [];
        if (currentPage == 1) {
          _petListArray.clear();
          _petListArray.addAll(arrayList);
        } else {
          _petListArray.addAll(arrayList);
        }
        update();
      }
    });
  }

  void deletePet(int petId) async {
    _removingPet = true;
    update();
    final result = await repository.removePet(petId);
    result.fold<void>(
      (failure) {
        _removingPet = false;
        update();
        Get.snackbar(
          "error_in_request".tr,
          failure.message,
          backgroundColor: AppColors.redColor,
          colorText: AppColors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      (success) {
        _removingPet = false;
        update();
        resetRequest();
      },
    );
  }
}
