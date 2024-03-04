import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart' hide FormData;
import 'package:intl/intl.dart' as intl;
import 'package:pet_shouq/data/model/availability_bean.dart';
import 'package:pet_shouq/service/repository/availability_repository.dart';
import 'package:pet_shouq/theme/app.colors.dart';

class AvailabilityController extends GetxController implements GetxService {
  final AvailabilityRepositoryImpl repository;
  AvailabilityController({required this.repository});

  bool _isLoading = false;
  bool? get isLoading => _isLoading;

  List<Availability> vetAvailability = [
    Availability(
      day: "monday",
      isClosed: false,
      timing: [],
    ),
    Availability(
      day: "tuesday",
      isClosed: false,
      timing: [],
    ),
    Availability(
      day: "wednesday",
      isClosed: false,
      timing: [],
    ),
    Availability(
      day: "thursday",
      isClosed: false,
      timing: [],
    ),
    Availability(
      day: "friday",
      isClosed: false,
      timing: [],
    ),
    Availability(
      day: "saturday",
      isClosed: false,
      timing: [],
    ),
    Availability(
      day: "sunday",
      isClosed: false,
      timing: [],
    )
  ];
  List<Availability> vetAddAvailability = [];
  List<Availability> vetUpdateAvailability = [];
  duplicateVetAvailableList({bool isClear = true}) {
    if (isClear) {
      vetAddAvailability = [...vetAvailability];

      for (var element in vetAddAvailability) {
        element.timing = [
          AvailabilityTiming(startTime: "", endTime: "", id: "")
        ];
        element.isClosed = false;
      }
    } else {
      vetUpdateAvailability = [...vetAvailability];
    }
    update();
  }

  duplicateVetUpdateAvailableList() {
    update();
  }
  /* -------------------------------------------------------------------------- */
  /*                            GET AVAILABILITY                                */
  /* -------------------------------------------------------------------------- */

  Map<String, dynamic>? getAvailabilityResponseBean;
  getAvailability({bool isBack = false}) async {
    _isLoading = true;
    update();
    final result = await repository.getAvailability();

    result.fold<void>((failure) {
      _isLoading = false;
      update();
    }, (success) async {
      getAvailabilityResponseBean = success;
      try {
        _setAvailability(getAvailabilityResponseBean?['data']);
      } catch (e) {}
      if (isBack) {
        Get.back();
      }
      _isLoading = false;
      update();
    });
  }

  void _setAvailability(Map<String, dynamic> responseData) {
    for (var existingAvailability in vetAvailability) {
      String day = existingAvailability.day;

      if (responseData.containsKey(day)) {
        List<AvailabilityTiming> timingList = [];
        bool isClosed = true;

        responseData[day]?.forEach((timingData) {
          timingList.add(AvailabilityTiming(
            startTime: timingData['va_start_time'],
            endTime: timingData['va_end_time'],
            id: timingData['va_id'].toString(),
          ));

          if (timingData['va_is_available'] == 0) {
            isClosed = false;
          }
        });

        existingAvailability.timing = timingList;
        existingAvailability.isClosed = isClosed;
      }
    }
  }

  void addNewTime(Availability availability) {
    List<AvailabilityTiming> timing = availability.timing;
    timing.add(
      AvailabilityTiming(endTime: "", startTime: "", id: ""),
    );
    availability;
    update();
  }

  Future<void> removeTime(int childIndex, Availability availability,
      {bool isCallApi = false, BuildContext? context}) async {
    print("::::::::::::::::${availability.timing[childIndex].id}");

    if (isCallApi) {
      if (availability.timing[childIndex].id.isNotEmpty) {
        await deleteAvailability(
            context: context,
            availabilityId: availability.timing[childIndex].id);
      }
    }
    List<AvailabilityTiming> timing = availability.timing;
    timing.removeAt(childIndex);
    availability;
    update();
  }

  void updateClosedValue(Availability availabilitys, bool val) {
    Availability availability = availabilitys;
    availability.isClosed = val;
    availability;
    update();
  }

  String convertTo24HourFormat(String time) {
    if (time.isEmpty) return "";
    final intl.DateFormat format12 = intl.DateFormat('h:mm a');
    final intl.DateFormat format24 = intl.DateFormat('HH:mm');

    final DateTime dateTime = format12.parse(time);
    final String formattedTime = format24.format(dateTime);

    return formattedTime;
  }

  String convertTo12HourFormat(String time24Hr) {
    try {
      final intl.DateFormat format24 = intl.DateFormat('HH:mm:ss');
      final intl.DateFormat format12 = intl.DateFormat('h:mm a');

      final DateTime dateTime = format24.parse(time24Hr);
      final String formattedTime = format12.format(dateTime);

      return formattedTime;
    } catch (e) {
      return '';
    }
  }

  String convertToTimeWithoutSeconds(String timeWithSeconds) {
    final intl.DateFormat formatWithSeconds = intl.DateFormat('HH:mm:ss');
    final intl.DateFormat formatWithoutSeconds = intl.DateFormat('HH:mm');

    final DateTime dateTime = formatWithSeconds.parse(timeWithSeconds);
    return formatWithoutSeconds.format(dateTime);
  }

  Future<void> openTimePicker(
    BuildContext context,
    int childIndex,
    int type,
    Availability availability,
  ) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
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

    if (!context.mounted) {
      return;
    }
    if (timeOfDay != null) {
      List<AvailabilityTiming> timing = availability.timing;
      AvailabilityTiming time = timing[childIndex];

      if (type == 0) {
        String timeValue = timeOfDay.format(context);
        time.startTime = timeValue;
      } else if (type == 1) {
        String timeValue = timeOfDay.format(context);
        time.endTime = timeValue;
      }
      availability;
      update();
    }
  }

  /* -------------------------------------------------------------------------- */
  /*                            ADD AVAILABILITY                                */
  /* -------------------------------------------------------------------------- */
  Map<String, dynamic> addAvailabilityBody() {
    Map<String, dynamic> convertedMap = {};
    vetAddAvailability.forEach((avail) {
      List<Map<String, String>> slots = [];
      avail.timing.forEach((timing) {
        if (timing.startTime.isNotEmpty && timing.endTime.isNotEmpty) {
          slots.add({
            "va_start_time": convertTo24HourFormat(timing.startTime),
            "va_end_time": convertTo24HourFormat(timing.endTime),
          });
        }
      });

      convertedMap[avail.day] = {
        "va_is_available": !avail.isClosed,
        "slot": slots,
      };
    });

    return convertedMap;
  }

  void addAvailability() async {
    _isLoading = true;
    update();

    Map<String, dynamic> requestBody = {
      "va_day_of_week": addAvailabilityBody()
    };

    final result = await repository.addAvailability(data: requestBody);

    result.fold<void>((failure) {
      _isLoading = false;
      update();
      Get.snackbar(
        "error_in_request".tr,
        failure.message,
        backgroundColor: AppColors.redColor,
        colorText: AppColors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }, (success) async {
      await getAvailability(isBack: true);
      Get.snackbar(
        "congratulations".tr,
        success['message'] ?? "",
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
      _isLoading = false;
      update();
    });
  }

  /* -------------------------------------------------------------------------- */
  /*                            UPDATE AVAILABILITY                                */
  /* -------------------------------------------------------------------------- */

  Map<String, dynamic> updateAvailabilityBody(Availability availability) {
    List<Map<String, dynamic>> slots = [];

    availability.timing.forEach((timing) {
      slots.add({
        "id": timing.id,
        "va_start_time":
            timing.startTime.contains('AM') || timing.startTime.contains('PM')
                ? convertTo24HourFormat(timing.startTime)
                : convertToTimeWithoutSeconds(timing.startTime),
        "va_end_time":
            timing.endTime.contains('AM') || timing.endTime.contains('PM')
                ? convertTo24HourFormat(timing.endTime)
                : convertToTimeWithoutSeconds(timing.endTime),
      });
    });
    return {
      "is_available": !availability.isClosed,
      "va_day_of_week": availability.day,
      "slot": slots,
    };
  }

  void updateAvailability(Availability availability) async {
    _isLoading = true;
    update();

    Map<String, dynamic> requestBody = updateAvailabilityBody(availability);

    final result = await repository.updateAvailability(data: requestBody);

    result.fold<void>((failure) {
      _isLoading = false;
      update();
      Get.snackbar(
        "error_in_request".tr,
        failure.message,
        backgroundColor: AppColors.redColor,
        colorText: AppColors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }, (success) async {
      await getAvailability(isBack: true);
      Get.snackbar(
        "congratulations".tr,
        success['message'] ?? "",
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
      _isLoading = false;
      update();
    });
  }

  /* -------------------------------------------------------------------------- */
  /*                            DELETE AVAILABILITY                                */
  /* -------------------------------------------------------------------------- */

  deleteAvailability({String? availabilityId, BuildContext? context}) async {
    showDeleteLoader(context!);

    final result =
        await repository.deleteAvailability(availabilityId: availabilityId);

    result.fold<void>((failure) {
      Get.back();
    }, (success) async {
      Get.back();
    });
  }

  showDeleteLoader(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
