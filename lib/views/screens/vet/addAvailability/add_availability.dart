import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:pet_shouq/controller/availability_controller.dart';

import '../../../../data/model/models.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';

class AddAvailability extends StatefulWidget {
  const AddAvailability({super.key});

  @override
  State<AddAvailability> createState() => AddAvailabilityState();
}

class AddAvailabilityState extends State<AddAvailability> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: HeaderWithBack(
        title: Get.parameters['name'] != null
            ? '${Get.parameters['name']}'
            : "add_availability".tr,
        onPressBack: () => Get.back(),
      ),
      body: GetBuilder<AvailabilityController>(
        builder: (controller) {
          Availability? availability;

          try {
            if (Get.parameters['index'] != null) {
              availability = controller
                  .vetUpdateAvailability[int.parse(Get.parameters['index']!)];
              if (availability.timing.isEmpty) {
                availability.timing = [
                  AvailabilityTiming(startTime: "", endTime: "", id: "")
                ];
              }
            }
          } catch (e) {}
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 8.h,
                        ),
                        Get.parameters['index'] == null
                            ? addAvailabilityWidget(controller)
                            : editAvailabilityWidget(controller, availability!),
                        SizedBox(
                          height: 15.h,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: ButtonView(
                      isLoading: controller.isLoading,
                      onTap: () {
                        if (Get.parameters['index'] == null) {
                          controller.addAvailability();
                        } else {
                          controller.updateAvailability(availability!);
                        }
                      },
                      buttonTitle: "btn_save".tr,
                      width: width - 20,
                      buttonStyle: TextStyle(
                        fontSize: 8.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  ListView addAvailabilityWidget(AvailabilityController controller) {
    return ListView.builder(
      itemCount: controller.vetAddAvailability.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, mainIndex) {
        return ListTileItem(
          availabilityController: controller,
          item: controller.vetAddAvailability[mainIndex],
          onSelectTime: (childIndex, type) => controller.openTimePicker(context,
              childIndex, type, controller.vetAddAvailability[mainIndex]),
          onAddTime: () =>
              controller.addNewTime(controller.vetAddAvailability[mainIndex]),
          onRemoveTime: (childIndex) => controller.removeTime(
              context: context,
              childIndex,
              controller.vetAddAvailability[mainIndex]),
          updateClosed: (p0) => controller.updateClosedValue(
              controller.vetAddAvailability[mainIndex], p0),
        );
      },
    );
  }

  editAvailabilityWidget(
      AvailabilityController controller, Availability availability) {
    return ListTileItem(
      availabilityController: controller,
      item: availability,
      onSelectTime: (childIndex, type) =>
          controller.openTimePicker(context, childIndex, type, availability),
      onAddTime: () => controller.addNewTime(availability),
      onRemoveTime: (childIndex) => controller.removeTime(
          childIndex, availability,
          context: context, isCallApi: true),
      updateClosed: (p0) => controller.updateClosedValue(availability, p0),
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
    required this.updateClosed,
    required this.availabilityController,
  });

  final Availability item;
  final Function(int, int) onSelectTime;
  final VoidCallback onAddTime;
  final Function(int) onRemoveTime;
  final Function(bool) updateClosed;
  final AvailabilityController availabilityController;

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
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontSize: 15.sp, color: AppColors.secondary),
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
                  onChanged: (value) => updateClosed(value!),
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
                                  ? item.startTime.contains('AM') ||
                                          item.startTime.contains('PM')
                                      ? item.startTime
                                      : availabilityController
                                          .convertTo12HourFormat(item.startTime)
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
                                  ? item.endTime.contains('AM') ||
                                          item.endTime.contains('PM')
                                      ? item.endTime
                                      : availabilityController
                                          .convertTo12HourFormat(item.endTime)
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
