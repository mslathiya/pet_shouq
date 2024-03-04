import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pet_shouq/controller/availability_controller.dart';

import '../../../../../data/model/models.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.item,
    required this.onAddTime,
    required this.controller,
  });

  final Availability item;
  final VoidCallback onAddTime;
  final AvailabilityController controller;

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
                  fontSize: 14.sp,
                ),
          ),
          expandedAlignment: Alignment.topLeft,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 12.w,
                      right: 5.w,
                      bottom: 8.h,
                    ),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 5.w,
                      runSpacing: 8.h,
                      children: [
                        ...List.generate(
                          item.timing.length,
                          (index) => Text(
                            controller
                                    .convertTo12HourFormat(
                                        item.timing[index].startTime)
                                    .isEmpty
                                ? ""
                                : '${controller.convertTo12HourFormat(item.timing[index].startTime)} To ${controller.convertTo12HourFormat(item.timing[index].endTime)},',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 12.sp,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: onAddTime,
                    child: Container(
                      height: 40.sp,
                      width: 40.sp,
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10.sp),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          AppAssets.icPencil,
                          height: 22.sp,
                          width: 22.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  //
  // String getTimeIn12HrFormat(String time) {
  //   // Convert time from 24-hour format to 12-hour format and add AM or PM
  //   final DateTime dateTime = DateTime.parse("2022-01-01 $time");
  //   final int hour = dateTime.hour;
  //   final String period = hour < 12 ? 'AM' : 'PM';
  //   final int displayHour = hour == 0 || hour == 12 ? 12 : hour % 12;
  //
  //   return "$displayHour:${dateTime.minute.toString().padLeft(2, '0')} $period";
  // }
}
