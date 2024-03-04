import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pet_shouq/controller/booking_history_controller.dart';
import 'package:pet_shouq/controller/vet_data_controller.dart';
import 'package:pet_shouq/views/screens/parent/clinicDetail/widgets/slot_list_loading.dart';

import '../../theme/theme.dart';
import 'button_view.dart';
import 'date_item.dart';
import 'input_header.dart';
import 'selector_field.dart';
import 'time_item.dart';

class ReScheduleAppointment extends StatefulWidget {
  ReScheduleAppointment({super.key, this.selectDoctor = true});

  final bool? selectDoctor;

  @override
  State<ReScheduleAppointment> createState() => _ReScheduleAppointmentState();
}

class _ReScheduleAppointmentState extends State<ReScheduleAppointment> {
  DateTime now = DateTime.now();
  VetDataController vetDataController = Get.find();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getSlotDateData();
    });
    super.initState();
  }

  getSlotDateData() {
    String todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    vetDataController.setDateSelected(
        index: 0,
        selectedDate: todayDate,
        vetId: vetDataController.vetDataList.first.veterinarianId.toString());
    vetDataController.setTimeSelected(index: "", selectedSlotTime: "", vatIdValue: "");
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List<DateTime> next30Days = [];

    for (int i = 0; i < 30; i++) {
      next30Days.add(now.add(Duration(days: i)));
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {},
      child: Center(
        child: GetBuilder<BookingHistoryController>(
          builder: (controller) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Material(
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp)),
                  child: Container(
                    height: height * .75,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: width,
                          padding: EdgeInsets.all(6.sp),
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.sp),
                              topRight: Radius.circular(10.sp),
                            ),
                          ),
                          child: Text(
                            "btn_reschedule_appointment".tr,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 16.sp,
                                  height: 2,
                                  color: AppColors.white,
                                ),
                          ),
                        ),
                        Expanded(
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return ConstrainedBox(
                                constraints: BoxConstraints(
                                  minHeight: constraints.maxHeight,
                                  minWidth: constraints.maxWidth,
                                ),
                                child: IntrinsicHeight(
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 10.w,
                                        right: 10.w,
                                        top: 15.h,
                                      ),
                                      child: GetBuilder<VetDataController>(
                                        builder: (vetController) {
                                          return Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.sp),
                                                  ),
                                                  border: Border.all(
                                                    color: AppColors.inputBorder,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: DropdownButton<String>(
                                                  hint: Text(
                                                    "hint_dog_name".tr,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium
                                                        ?.copyWith(
                                                          color: AppColors.hintColor,
                                                        ),
                                                  ),
                                                  value: controller.selectedVetName,
                                                  underline: const SizedBox(),
                                                  icon: Icon(
                                                    Entypo.chevron_down,
                                                    size: 26.sp,
                                                    color: AppColors.hintColor,
                                                  ),
                                                  onChanged: (String? newValue) {
                                                    String vetId = vetController
                                                        .vetDataList
                                                        .where((element) =>
                                                            element.vetFname == newValue)
                                                        .toList()
                                                        .first
                                                        .veterinarianId
                                                        .toString();
                                                    controller.setSelectedItems(
                                                        value: newValue!,
                                                        vetIdValue: vetId);
                                                    vetDataController.setDateSelected(
                                                        index: vetController
                                                            .selectedDateIndex,
                                                        selectedDate:
                                                            vetController.selectionDate,
                                                        vetId: vetId);
                                                  },
                                                  isExpanded: true,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 15.w),
                                                  items: vetController.vetDataList
                                                      .map<DropdownMenuItem<String>>(
                                                          (value) {
                                                    return DropdownMenuItem<String>(
                                                      value: value.vetFname,
                                                      child: Text(value.vetFname!,
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .bodyMedium),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15.h,
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "date".tr,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displayMedium
                                                          ?.copyWith(
                                                            fontSize: 16.sp,
                                                          ),
                                                    ),
                                                    WidgetSpan(
                                                      child: SizedBox(width: 5.w),
                                                    ),
                                                    TextSpan(
                                                      text: '*',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineSmall
                                                          ?.copyWith(color: Colors.red),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15.h,
                                              ),
                                              SizedBox(
                                                height: 55.sp,
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: next30Days.length,
                                                  physics: const ClampingScrollPhysics(),
                                                  scrollDirection: Axis.horizontal,
                                                  itemBuilder: (context, index) {
                                                    // return SizedBox();
                                                    DateTime currentDate =
                                                        next30Days[index];

                                                    return GestureDetector(
                                                      onTap: () {
                                                        vetController.setDateSelected(
                                                            vetId: controller.vetId,
                                                            index: index,
                                                            selectedDate:
                                                                DateFormat('yyyy-MM-dd')
                                                                    .format(currentDate));
                                                      },
                                                      child: DateItem(
                                                        isSelected: vetController
                                                                .selectedDateIndex ==
                                                            index,
                                                        index: index,
                                                        date: DateFormat('EEE')
                                                            .format(currentDate),
                                                        day: DateFormat('dd')
                                                            .format(currentDate),
                                                        isDisabled: false,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15.h,
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "time".tr,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displayMedium
                                                          ?.copyWith(
                                                            fontSize: 16.sp,
                                                          ),
                                                    ),
                                                    WidgetSpan(
                                                      child: SizedBox(width: 5.w),
                                                    ),
                                                    TextSpan(
                                                      text: '*',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineSmall
                                                          ?.copyWith(color: Colors.red),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15.h,
                                              ),
                                              if (vetController.loadingGetSlot)
                                                const SlotListLoading()
                                              else if (vetController.slotDataList.isEmpty)
                                                const Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      Text('No Slot Available'),
                                                    ],
                                                  ),
                                                )
                                              else
                                                GridView.builder(
                                                  shrinkWrap: true,
                                                  itemCount:
                                                      vetController.slotDataList.length,
                                                  primary: false,
                                                  padding: EdgeInsets.zero,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    mainAxisSpacing: 10,
                                                    mainAxisExtent: 42.sp,
                                                  ),
                                                  itemBuilder: (context, index) {
                                                    DateTime parsedStartTime =
                                                        DateFormat('HH:mm:ss').parse(
                                                            vetController
                                                                .slotDataList[index]
                                                                .vaStartTime
                                                                .toString());
                                                    DateTime parsedEndTime =
                                                        DateFormat('HH:mm:ss').parse(
                                                            vetController
                                                                .slotDataList[index]
                                                                .vaEndTime
                                                                .toString());
                                                    String formattedStartTime =
                                                        DateFormat('hh:mm a')
                                                            .format(parsedStartTime);
                                                    String formattedEndTime =
                                                        DateFormat('hh:mm a')
                                                            .format(parsedEndTime);
                                                    return GestureDetector(
                                                      onTap: () {
                                                        if (vetController
                                                            .slotDataList[index]
                                                            .isAvailable!) {
                                                          vetController.setTimeSelected(
                                                              index: index.toString(),
                                                              vatIdValue: vetController
                                                                  .slotDataList[index]
                                                                  .vaId
                                                                  .toString(),
                                                              selectedSlotTime:
                                                                  "${vetController.slotDataList[index].vaStartTime} to ${vetController.slotDataList[index].vaEndTime}");
                                                        }
                                                      },
                                                      child: TimeItem(
                                                        isSelected: vetController
                                                                .selectedSlotIndex ==
                                                            index.toString(),
                                                        time:
                                                            "$formattedStartTime To $formattedEndTime",
                                                        isDisabled: vetController
                                                                    .slotDataList[index]
                                                                    .isAvailable ==
                                                                true
                                                            ? false
                                                            : true,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              SizedBox(
                                                height: 15.h,
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.sp,
                            vertical: 10.sp,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: ButtonView(
                                  onTap: () => Get.back(),
                                  buttonTitle: "btn_cancel".tr,
                                  width: width * .41,
                                  buttonStyle: TextStyle(
                                    color: AppColors.hintColor,
                                  ),
                                  buttonColor: AppColors.inputBorder,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: ButtonView(
                                  onTap: () {
                                    if (controller.selectedVetName.isEmpty) {
                                      Get.snackbar(
                                        "error_in_request".tr,
                                        "Please select doctor name",
                                        backgroundColor: AppColors.redColor,
                                        colorText: AppColors.white,
                                        snackPosition: SnackPosition.BOTTOM,
                                      );
                                    } else if (vetDataController.selectionDate.isEmpty) {
                                      Get.snackbar(
                                        "error_in_request".tr,
                                        "Please select date",
                                        backgroundColor: AppColors.redColor,
                                        colorText: AppColors.white,
                                        snackPosition: SnackPosition.BOTTOM,
                                      );
                                    } else if (vetDataController
                                        .selectionSlotTime.isEmpty) {
                                      Get.snackbar(
                                        "error_in_request".tr,
                                        "Please select time slot",
                                        backgroundColor: AppColors.redColor,
                                        colorText: AppColors.white,
                                        snackPosition: SnackPosition.BOTTOM,
                                      );
                                    } else {
                                      Get.back();
                                      controller.rescheduleAppointmentSlot();
                                    }
                                  },
                                  buttonTitle: "btn_reschedule".tr,
                                  width: width * .41,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
