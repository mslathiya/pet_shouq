import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../../../data/model/models.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';

class AddAvailability extends StatefulWidget {
  const AddAvailability({super.key});

  @override
  State<AddAvailability> createState() => AddAvailabilityState();
}

class AddAvailabilityState extends State<AddAvailability> {
  Availability availability = Availability(
    day: "monday",
    isClosed: false,
    timing: [
      AvailabilityTiming(startTime: "", endTime: ""),
    ],
  );

  void addNewTime() {
    List<AvailabilityTiming> timing = availability.timing;
    timing.add(
      AvailabilityTiming(endTime: "", startTime: ""),
    );
    setState(() {
      availability;
    });
  }

  void removeTime(int childIndex) {
    List<AvailabilityTiming> timing = availability.timing;
    timing.removeAt(childIndex);
    setState(() {
      availability;
    });
  }

  Future<void> openTimePicker(
    BuildContext superContext,
    int childIndex,
    int type,
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
      setState(() {
        availability;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: HeaderWithBack(
        title: "add_availability".tr,
        onPressBack: () => Get.back(),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 8.h,
            ),
            ListTileItem(
              item: availability,
              onSelectTime: (childIndex, type) =>
                  openTimePicker(context, childIndex, type),
              onAddTime: () => addNewTime(),
              onRemoveTime: (childIndex) => removeTime(childIndex),
            ),
            const Spacer(),
            SizedBox(
              height: 15.h,
            ),
            Align(
              alignment: Alignment.center,
              child: ButtonView(
                onTap: () => Get.back(),
                buttonTitle: "btn_save".tr,
                width: width - 20,
                buttonStyle: TextStyle(
                  fontSize: 8.sp,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileItem extends StatelessWidget {
  const ListTileItem({
    super.key,
    required this.item,
    required this.onSelectTime,
    required this.onAddTime,
    required this.onRemoveTime,
  });

  final Availability item;
  final Function(int, int) onSelectTime;
  final VoidCallback onAddTime;
  final Function(int) onRemoveTime;

  @override
  Widget build(BuildContext context) {
    return ShadowBox(
      withPadding: false,
      isExpanded: true,
      childWidget: ListTileTheme(
        contentPadding: EdgeInsets.zero,
        minVerticalPadding: 0.0,
        horizontalTitleGap: 0,
        dense: true,
        child: ExpansionTile(
          childrenPadding: EdgeInsets.zero,
          tilePadding: EdgeInsets.symmetric(
            horizontal: 12.w,
          ),
          initiallyExpanded: false,
          collapsedShape: const Border(),
          shape: const Border(),
          iconColor: AppColors.fontMain,
          title: Text(
            item.day.tr,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 15.sp,
                ),
          ),
          expandedAlignment: Alignment.topLeft,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.maximumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
                  value: item.isClosed,
                  onChanged: (value) {},
                  activeColor: AppColors.secondary,
                ),
                Expanded(
                  child: Text(
                    "closed".tr,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          height: 1.2,
                          fontWeight: FontWeight.w600,
                          fontSize: 13.sp,
                        ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: item.timing.asMap().entries.map((e) {
                int index = e.key.toInt();
                AvailabilityTiming item = e.value;

                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SelectorField(
                              inputHint: item.startTime != ''
                                  ? item.startTime
                                  : "start_time".tr,
                              suffixIcon: SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: Icon(
                                  FontAwesome5Solid.clock,
                                  color: AppColors.hintColor,
                                  size: 20.sp,
                                ),
                              ),
                              onSelectItem: () => onSelectTime(index, 0),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: SelectorField(
                              inputHint: item.endTime != ''
                                  ? item.endTime
                                  : "end_time".tr,
                              suffixIcon: SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: Icon(
                                  FontAwesome5Solid.clock,
                                  color: AppColors.hintColor,
                                  size: 20.sp,
                                ),
                              ),
                              onSelectItem: () => onSelectTime(index, 1),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          index == 0
                              ? GestureDetector(
                                  onTap: onAddTime,
                                  child: Container(
                                    height: 45.sp,
                                    width: 32.sp,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.sp),
                                      ),
                                    ),
                                    child: Icon(
                                      Entypo.plus,
                                      color: AppColors.secondary,
                                      size: 20.sp,
                                    ),
                                  ),
                                )
                              : const SizedBox()
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      index > 0
                          ? Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: () => onRemoveTime(index),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      AntDesign.delete,
                                      color: AppColors.redColor,
                                      size: 22.sp,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "remove".tr,
                                      textAlign: TextAlign.left,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: AppColors.redColor,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
