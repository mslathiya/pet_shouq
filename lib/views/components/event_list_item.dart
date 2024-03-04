import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pet_shouq/data/model/calender_list_reponse_model.dart';
import 'package:pet_shouq/helper/time_formater.dart';

import '../../data/enum/enums.dart';
import '../../theme/theme.dart';
import 'label_with_icon.dart';

class EventListItem extends StatelessWidget {
  const EventListItem({
    super.key,
    required this.eventType,
    required this.info,
  });

  final EventType eventType;
  final CalenderListData info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.sp,
      ),
      margin: EdgeInsets.only(
        left: 10.sp,
        right: 10.sp,
        bottom: 10.sp,
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
      child: Padding(
        padding: EdgeInsets.only(left: 12.w, right: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${info.bookingId}',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 14.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            eventType == EventType.typeAppointment
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      LabelWithIcon(
                        asset: AppAssets.icHospital,
                        value: '${info.vet!.vetFname}',
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      LabelWithIcon(
                        asset: AppAssets.icPetPaw,
                        padding: EdgeInsets.zero,
                        value: '${info.vet!.vetFname}',
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 115.sp,
                            child: LabelWithIcon(
                              asset: AppAssets.icCalendar,
                              value: DateFormat('dd-MMM-yyyy').format(info.bookingDate!),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          SizedBox(
                            width: 170.sp,
                            child: LabelWithIcon(
                              asset: AppAssets.icClock,
                              value:
                                  "${convertToAMPM(info.timeSlot.toString().split('to').first)} To ${convertToAMPM(info.timeSlot.toString().split('to').last)}",
                              padding: EdgeInsets.zero,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                : const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      LabelWithIcon(
                        asset: AppAssets.icPetPaw,
                        value: 'Max',
                      ),
                      LabelWithIcon(
                        asset: AppAssets.icCalendar,
                        value: '04-Jan-2024',
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
