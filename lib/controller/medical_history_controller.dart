import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' hide FormData;

import '../data/model/models.dart';
import '../helper/helpers.dart';
import '../service/repository/repository.dart';
import '../theme/theme.dart';

class MedicalHistoryController extends GetxController implements GetxService {
  final MedicalHistoryRepositoryImpl repository;
  final int petId;
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

  final List<MedicalHistoryBean> _historyList = [];

  GlobalKey<FormState> get historyAddEditKey => _historyAddEditKey;
  ScrollController? get scrollController => _scrollController;

  List<MedicalHistoryBean> get historyList => _historyList;

  MedicalHistoryController({
    required this.repository,
    required this.petId,
  });

  void initializeProcess() async {
    _historyList.clear();
    _historyList.add(
      MedicalHistoryBean(
        listArray: [
          HistoryDataBean(label: "", value: ""),
        ],
      ),
    );
  }

  void addNewRecord() {
    bool isAnyEmpty = _historyList.any((element) => element.recordType == null);
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

    _historyList.add(
      MedicalHistoryBean(
        listArray: [
          HistoryDataBean(label: "", value: ""),
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
    MedicalHistoryBean beanItem = _historyList[itemIndex];
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
    MedicalHistoryBean beanItem = _historyList[itemIndex];

    if (childIndex > beanItem.listArray.length) {
      return;
    }
    HistoryDataBean dataBean = beanItem.listArray[childIndex];
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
    MedicalHistoryBean beanItem = _historyList[itemIndex];

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
    MedicalHistoryBean beanItem = _historyList[itemIndex];

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
      HistoryDataBean(label: "", value: ""),
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

  void saveInformation() {
    Map<String, List<HistoryDataBean>> typeObject = {};
    AppLog.e("size ${_historyList.length}");

    _historyList.map((e) {
      AppLog.e("message");
      typeObject[e.recordType!.key] = e.listArray;
    }).toList();
    AppLog.e("Json ${jsonDecode(jsonEncode(typeObject))}");
  }
}
