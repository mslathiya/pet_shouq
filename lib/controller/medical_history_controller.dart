import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart' hide FormData;

import '../data/model/models.dart';
import '../helper/helpers.dart';
import '../service/repository/repository.dart';
import '../theme/theme.dart';
import 'auth_controller.dart';

class MedicalHistoryController extends GetxController implements GetxService {
  final MedicalHistoryRepositoryImpl repository;
  final int petId;
  final PetInformation information;
  final AppPreferences preferences;

  bool inEditMode = false;
  bool isLoading = false;

  List<RecordTypeBean> recordTypeList = [
    RecordTypeBean(
      key: "medications",
      name: "Medications",
    ),
    RecordTypeBean(
      key: "vaccination_record",
      name: "Vaccination",
    ),
    RecordTypeBean(
      key: "allergies",
      name: "Allergies",
    ),
    RecordTypeBean(
      key: "chronic_conditions",
      name: "Chronic Conditions",
    ),
    RecordTypeBean(
      key: "dietary_information",
      name: "Dietary Information",
    ),
    RecordTypeBean(
      key: "parasite_control",
      name: "Parasite Control",
    ),
    RecordTypeBean(
      key: "dental_care",
      name: "Dental Care",
    ),
    RecordTypeBean(
      key: "vet_visits",
      name: "Vet Visits",
    ),
    RecordTypeBean(
      key: "emergency_contact_information",
      name: "Emergency Contact Information",
    ),
    RecordTypeBean(
      key: "behavior_and_training",
      name: "Behavior and Training",
    ),
    RecordTypeBean(
      key: "grooming_and_hygiene",
      name: "Grooming and Hygiene",
    ),
    RecordTypeBean(
      key: "miscellaneous_notes",
      name: "Miscellaneous Notes",
    ),
  ];

  final GlobalKey<FormState> _historyAddEditKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  UserBean? _userData;

  final List<HistoryRequestBean> _historyList = [];

  GlobalKey<FormState> get historyAddEditKey => _historyAddEditKey;
  ScrollController? get scrollController => _scrollController;
  UserBean? get userData => _userData;
  List<HistoryRequestBean> get historyList => _historyList;

  /* -------------------------------------------------------------------------- */
  /*                               listing module                               */
  /* -------------------------------------------------------------------------- */
  bool _loadingHistory = false;
  bool _removingHistory = false;
  final List<HistoryListItemBean> _historyLogArray = [];
  ScrollController controller = ScrollController();
  int limit = 10;
  int _currentPage = 1;
  bool haveMoreResult = false;

  List<HistoryListItemBean> get historyLogArray => _historyLogArray;
  bool get loadingDietLog => _loadingHistory;
  bool get removingHistory => _removingHistory;
  int get currentPage => _currentPage;

  MedicalHistoryController({
    required this.information,
    required this.repository,
    required this.petId,
    required this.preferences,
  });

  // @override
  // void initState() async {
  //
  //   super.initState();
  // }

  @override
  void onInit() async {
    _userData = await preferences.getUserData();
    super.onInit();
  }

  void initializeProcess() async {
    _historyList.clear();
    _historyList.add(
      HistoryRequestBean(
        listArray: [
          HistoryRequestListItem(label: "", value: ""),
        ],
      ),
    );
    update();
  }

  void addNewRecord() {
    bool isAnyEmpty = _historyList.any((element) => element.recordType == null);
    if (isAnyEmpty) {
      Get.snackbar(
        "incomplete_fields".tr,
        "complete_current".tr,
        backgroundColor: AppColors.redColor,
        colorText: AppColors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    _historyList.add(
      HistoryRequestBean(
        listArray: [
          HistoryRequestListItem(label: "", value: ""),
        ],
      ),
    );

    scrollToEnd();
    update();
  }

  void removeRecord(int itemIndex) async {
    if (itemIndex > _historyList.length) {
      return;
    }
    _historyList.removeAt(itemIndex);
    update();
  }

  void onSelectRecordType(int itemIndex, RecordTypeBean item) {
    if (itemIndex > _historyList.length) {
      return;
    }
    HistoryRequestBean beanItem = _historyList[itemIndex];
    beanItem.recordType = item;
    update();
  }

  void openRecordTypeSelector(int itemIndex) async {
    List<RecordTypeBean> updatedList = recordTypeList
        .where(
          (element) => !_historyList.any(
            (history) => history.recordType?.key == element.key,
          ),
        )
        .toList();

    Get.bottomSheet(
      Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 15.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: updatedList
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    Get.back();
                    onSelectRecordType(itemIndex, e);
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Text(
                      e.name,
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

  void addValueToRecord(
    int itemIndex,
    int childIndex,
    int type,
    String value,
  ) {
    if (itemIndex > _historyList.length) {
      return;
    }
    HistoryRequestBean beanItem = _historyList[itemIndex];

    if (childIndex > beanItem.listArray.length) {
      return;
    }
    HistoryRequestListItem dataBean = beanItem.listArray[childIndex];
    if (type == 1) {
      dataBean.label = value;
    } else {
      dataBean.value = value;
    }
    update();
  }

  void removeItemRecord(int itemIndex, int childIndex) async {
    if (itemIndex > _historyList.length) {
      return;
    }
    HistoryRequestBean beanItem = _historyList[itemIndex];

    if (childIndex > beanItem.listArray.length) {
      return;
    }
    beanItem.listArray.removeAt(childIndex);
    update();
  }

  void addItemRecord(int itemIndex, int childIndex) async {
    if (itemIndex > _historyList.length) {
      return;
    }
    HistoryRequestBean beanItem = _historyList[itemIndex];

    if (childIndex > beanItem.listArray.length) {
      return;
    }

    bool isAnyEmpty = beanItem.listArray.any(
      (element) =>
          !CommonHelper.isNotEmpty(element.value) ||
          !CommonHelper.isNotEmpty(element.value),
    );
    if (isAnyEmpty) {
      Get.snackbar(
        "incomplete_fields".tr,
        "incomplete_fields_msg".tr,
        backgroundColor: AppColors.redColor,
        colorText: AppColors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    beanItem.listArray.add(
      HistoryRequestListItem(label: "", value: ""),
    );
    scrollToEnd();
    update();
  }

  void scrollToEnd() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 500),
    );
  }

  void saveInformation() async {
    Map<String, List<HistoryRequestListItem>> typeObject = {};

    _historyList.map((e) {
      AppLog.e("message");
      List<HistoryRequestListItem> tempList = [];

      e.listArray.map((e) {
        if (CommonHelper.isNotEmpty(e.label) &&
            CommonHelper.isNotEmpty(e.value)) {
          tempList.add(e);
        }
      }).toList();
      if (tempList.isNotEmpty) {
        typeObject[e.recordType!.key] = tempList;
      }
    }).toList();

    if (typeObject.isNotEmpty) {
      isLoading = true;
      update();

      Map<String, dynamic> requestParams = {
        "pet_id": petId,
        "type": typeObject,
      };
      dynamic result = await repository.addMedicalHistory(requestParams);
      result.fold<void>(
        (failure) {
          isLoading = false;
          update();

          if (!Get.find<AuthController>().handleUnAuthorized(failure)) {
            String errorMessage = failure.message;
            if (failure.errorData != null) {
              errorMessage = "error_msg".tr;
              final errorResponse =
                  ErrorResponseDto.fromJson(failure.errorData!);

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
            },
          );
        },
      );
    } else {}
  }

  /* -------------------------------------------------------------------------- */
  /*                               listing module                               */
  /* -------------------------------------------------------------------------- */
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

  Future<void> getHistoryList() async {
    _currentPage = 1;
    _historyLogArray.clear();
    getDietLog();
  }

  void getDietLog() async {
    _loadingHistory = true;
    update();
    final requestParams = {
      "current_page": _currentPage,
      "limit": limit,
    };
    final result = await repository.getMedicalHistory(petId, requestParams);

    result.fold<void>((failure) {
      _loadingHistory = false;
      update();
      Get.find<AuthController>().handleUnAuthorized(failure);
    }, (success) {
      _loadingHistory = false;
      if (success.success == true) {
        final meta = success.data?.meta;
        if (meta != null) {
          haveMoreResult = meta.haveMoreRecords ?? false;
        }
        final arrayList = success.data?.data ?? [];
        if (currentPage == 1) {
          _historyLogArray.clear();
          _historyLogArray.addAll(arrayList);
        } else {
          _historyLogArray.addAll(arrayList);
        }
        update();
      }
    });
  }

  /* -------------------------------------------------------------------------- */
  /*                                 delete log                                 */
  /* -------------------------------------------------------------------------- */
  void deleteHistoryLog(int historyId) async {
    _removingHistory = true;
    update();
    final result = await repository.removeHistory(historyId);
    result.fold<void>(
      (failure) {
        _removingHistory = false;
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
        _removingHistory = false;
        update();
        getHistoryList();
      },
    );
  }

  /* -------------------------------------------------------------------------- */
  /*                                detail module                               */
  /* -------------------------------------------------------------------------- */
  Future<HistoryDetails?> getHistoryDetails(int historyId) async {
    _removingHistory = true;
    update();
    final result = await repository.getHistoryDetail(historyId);
    HistoryDetails? information;
    result.fold<void>(
      (failure) {
        _removingHistory = false;
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
        _removingHistory = false;
        update();
        if (success.success == true) {
          information = success.data;
        }
      },
    );
    return information;
  }
}
