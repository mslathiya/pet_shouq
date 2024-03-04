import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pet_shouq/controller/auth_controller.dart';
import 'package:pet_shouq/data/model/calender_list_reponse_model.dart';
import 'package:pet_shouq/service/repository/calender_list_repository.dart';

class PetCalenderController extends GetxController implements GetxService {
  final CalenderListRepositoryImpl repository;

  PetCalenderController({
    required this.repository,
  });

  bool loadingCalenderData = false;
  int limit = 10;
  int currentPage = 1;
  String selectedCalenderDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  final List<CalenderListData> petCalenderArray = [];
  bool haveMoreResult = false;
  ScrollController controller = ScrollController();

  setCalenderDate({required DateTime dateTime}){
    selectedCalenderDate =  DateFormat('yyyy-MM-dd').format(dateTime);
    getCalenderData();

  }

  void setScrollListener() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        if (haveMoreResult) {
          currentPage += 1;
          getCalenderData();
        }
      }
    });
  }

  Future<void> getCalenderData() async {
    loadingCalenderData = true;
    update();
    final requestParams = {
      "current_page": currentPage,
      "limit": limit,
      "date": selectedCalenderDate,
    };
    petCalenderArray.clear();

  debugPrint("requestParams -- $requestParams");

    final result = await repository.getCalenderList(requestParams);

    result.fold<void>((failure) {
      loadingCalenderData = false;
      update();
      Get.find<AuthController>().handleUnAuthorized(failure);
    }, (success) {
      loadingCalenderData = false;
      if (success.success == true) {
        final meta = success.data?.meta;
        if (meta != null) {
          haveMoreResult = meta.haveMoreRecords ?? false;
        }
        final arrayList = success.data?.data ?? [];
        if (currentPage == 1) {
          petCalenderArray.clear();
          petCalenderArray.addAll(arrayList);
        } else {
          petCalenderArray.addAll(arrayList);
        }
        update();
      }
    });
  }
}
