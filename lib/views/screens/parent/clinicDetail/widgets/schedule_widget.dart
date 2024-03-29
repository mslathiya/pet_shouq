import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 12.sp,
        vertical: 10.sp,
      ),
      margin: EdgeInsets.all(
        10.sp,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "opening_time".tr,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(fontSize: 16.sp, height: 2),
          ),
          SizedBox(
            height: 10.h,
          ),
          const InfoLabel(
            title: 'Monday',
            description: '09:00 Am To 8:00 Pm',
          ),
          const InfoLabel(
            title: 'Tuesday',
            description: '09:00 Am To 8:00 Pm',
          ),
          const InfoLabel(
            title: 'Wednesday',
            description: '09:00 Am To 8:00 Pm',
          ),
          const InfoLabel(
            title: 'Thursday',
            description: '09:00 Am To 8:00 Pm',
          ),
          const InfoLabel(
            title: 'Friday',
            description: '09:00 Am To 8:00 Pm',
          ),
          const InfoLabel(
            title: 'Saturday',
            description: '09:00 Am To 8:00 Pm',
          ),
          const InfoLabel(
            title: 'Sunday',
            description: 'Close',
          )
        ],
      ),
    );
  }
}
