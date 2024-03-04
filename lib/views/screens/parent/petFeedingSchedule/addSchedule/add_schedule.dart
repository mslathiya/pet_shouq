import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:pet_shouq/controller/pet_feeding_schedules_controller.dart';

import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';
import 'widgets/day_view.dart';

class AddSchedule extends StatefulWidget {
  const AddSchedule({super.key});

  @override
  State<AddSchedule> createState() => _AddScheduleState();
}

class _AddScheduleState extends State<AddSchedule> {
  int selectedOption = 1;
  int activeTab = 1;
  PetFeedingSchedulesController feedingSchedulesController = Get.find();
  TimeOfDay selectedTime = TimeOfDay.now();
  String selectedTimeFormat = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        activeTab = 1;
        selectedTimeFormat = selectedTime.format(context);
        feedingSchedulesController.resetFieldData();
        feedingSchedulesController.selectedFeedingTime =
            "${selectedTime.hour}:${selectedTime.minute}:00";
        feedingSchedulesController.frequency = "one_day";
      });
    });
  }

  List dayList = [
    {"title": "S", "value": "sun", "index": 1},
    {"title": "M", "value": "mon", "index": 2},
    {"title": "T", "value": "tue", "index": 3},
    {"title": "W", "value": "wed", "index": 4},
    {"title": "T", "value": "thu", "index": 5},
    {"title": "F", "value": "fri", "index": 6},
    {"title": "S", "value": "sat", "index": 7},
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double idealSize = width / 7 - 12.w;
    return Scaffold(
      appBar: HeaderWithBack(
        title: "screen_add_feed_schedule".tr,
        onPressBack: () => Get.back(),
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.only(left: 12.w, right: 12.w),
                  child: GetBuilder<PetFeedingSchedulesController>(
                    builder: (controller) {
                      return Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            Center(
                              child: SizedBox(
                                height: width * 0.55,
                                width: width * 0.55,
                                child: GestureDetector(
                                  onTap: () => openTimePicker(context),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Image.asset(
                                          AppAssets.timeContainer,
                                          height: width * 0.6,
                                          width: width * 0.6,
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(12.sp),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  selectedTimeFormat.split(" ").first,
                                                  textAlign: TextAlign.left,
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium
                                                      ?.copyWith(
                                                        fontSize: 28.sp,
                                                        fontWeight: FontWeight.w900,
                                                        height: 1.5,
                                                      ),
                                                ),
                                                Text(
                                                  selectedTimeFormat.split(" ").last,
                                                  textAlign: TextAlign.left,
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium
                                                      ?.copyWith(
                                                        fontSize: 18.sp,
                                                        fontWeight: FontWeight.w900,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: ButtonView(
                                    onTap: () => {
                                      setState(() {
                                        activeTab = 1;
                                        feedingSchedulesController.frequency = "one_day";
                                        feedingSchedulesController.feedingDaysList
                                            .clear();
                                        feedingSchedulesController.selectedName.clear();
                                        feedingSchedulesController.showName.clear();
                                      })
                                    },
                                    buttonTitle: "type_single".tr,
                                    width: width * 0.44,
                                    buttonColor: activeTab == 2
                                        ? AppColors.timeSelector
                                        : AppColors.secondary,
                                    buttonStyle: TextStyle(
                                      fontSize: 7.sp,
                                      color: activeTab == 2
                                          ? AppColors.grayFaded
                                          : AppColors.white,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: ButtonView(
                                    onTap: () => {
                                      setState(() {
                                        activeTab = 2;
                                        feedingSchedulesController.frequency = "custom";
                                      })
                                    },
                                    buttonTitle: "type_multiple".tr,
                                    width: width * 0.44,
                                    buttonColor: activeTab == 1
                                        ? AppColors.timeSelector
                                        : AppColors.secondary,
                                    buttonStyle: TextStyle(
                                      fontSize: 7.sp,
                                      color: activeTab == 1
                                          ? AppColors.grayFaded
                                          : AppColors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            activeTab == 2
                                ? Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.sp,
                                    ),
                                    margin: EdgeInsets.only(
                                      bottom: 15.sp,
                                      top: 15.sp,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.sp),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.fontMain.withOpacity(0.13),
                                          blurRadius: 5.sp,
                                          offset: const Offset(0, 0),
                                        )
                                      ],
                                    ),
                                    child: ListTileTheme(
                                      contentPadding: EdgeInsets.zero,
                                      minVerticalPadding: 0.0,
                                      horizontalTitleGap: 0,
                                      dense: true,
                                      child: ExpansionTile(
                                        childrenPadding:
                                            EdgeInsets.symmetric(vertical: 8.sp),
                                        tilePadding: EdgeInsets.zero,
                                        initiallyExpanded: true,
                                        collapsedShape: const Border(),
                                        shape: const Border(),
                                        iconColor: AppColors.fontMain,
                                        title: RichText(
                                          textAlign: TextAlign.left,
                                          text: TextSpan(
                                            text: "repeat".tr,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium
                                                ?.copyWith(fontSize: 14.sp),
                                            children: [
                                              TextSpan(
                                                text: '*',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall
                                                    ?.copyWith(color: Colors.red),
                                              ),
                                              WidgetSpan(
                                                child: SizedBox(
                                                  width: 5.w,
                                                ),
                                              ),
                                              TextSpan(
                                                text: controller.showName.isNotEmpty
                                                    ? "(${controller.showName.join(', ')})"
                                                    : "",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall
                                                    ?.copyWith(
                                                      fontSize: 14.sp,
                                                      color: AppColors.hintColor,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: List.generate(
                                              dayList.length,
                                              (index) => DayView(
                                                onTap: () {
                                                  controller.setDayInCustomFeed(
                                                      dayList[index]['value'],
                                                      dayList[index]);
                                                },
                                                idealSize: idealSize,
                                                dayName: "${dayList[index]['title']}",
                                                isActive: feedingSchedulesController
                                                    .feedingDaysList
                                                    .contains(dayList[index]['value']),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    height: 15.h,
                                  ),
                            InputField(
                              editingController: controller.feedingTitle,
                              validator: MultiValidator(
                                [
                                  RequiredValidator(
                                    errorText: "dynamic_field_required".trParams(
                                      {"field": "lbl_title".tr},
                                    ),
                                  ),
                                ],
                              ).call,
                              headerWidget: InputHeader(
                                compulsory: true,
                                headerLabel: "lbl_title".tr,
                              ),
                              inputHint: "hint_title".tr,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            InputField(
                              editingController: controller.feedingNotes,
                              headerWidget: InputHeader(
                                compulsory: false,
                                headerLabel: "lbl_note".tr,
                              ),
                              validator: MultiValidator(
                                [
                                  RequiredValidator(
                                    errorText: "dynamic_field_required".trParams(
                                      {"field": "lbl_note".tr},
                                    ),
                                  ),
                                ],
                              ).call,
                              inputHint: "hint_note".tr,
                              isMultiline: true,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: ButtonView(
                                isLoading: controller.isLoading,
                                onTap: () {
                                  if (controller.formKey.currentState!.validate()) {
                                    FocusManager.instance.primaryFocus?.unfocus();
                                    if (activeTab == 2 &&
                                        feedingSchedulesController
                                            .feedingDaysList.isEmpty) {
                                      Get.snackbar(
                                        "error_in_request".tr,
                                        "Please select a days",
                                        backgroundColor: AppColors.redColor,
                                        colorText: AppColors.white,
                                        snackPosition: SnackPosition.BOTTOM,
                                      );
                                    } else {
                                      controller.saveFeedingSchedulesData();
                                    }
                                    debugPrint(
                                        "feedingDaysList ** ${controller.feedingDaysList}");
                                  }
                                },
                                buttonTitle: "btn_save".tr,
                                width: width - 20,
                                buttonStyle: TextStyle(
                                  fontSize: 8.sp,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> openTimePicker(BuildContext superContext) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
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

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
        selectedTimeFormat = selectedTime.format(context);
        feedingSchedulesController.selectedFeedingTime =
            "${selectedTime.hour}:${selectedTime.minute}:00";
      });
    }
  }
}
