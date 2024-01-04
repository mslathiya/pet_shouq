import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/config.dart';
import '../../../../theme/theme.dart';
import 'time_label.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({
    super.key,
    required this.localizations,
  });

  final ApplicationLocalizations localizations;

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
            localizations.translate("opening_time"),
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
          const TimeLabel(
            day: 'Monday',
            time: '09:00 Am To 8:00 Pm',
          ),
          const TimeLabel(
            day: 'Tuesday',
            time: '09:00 Am To 8:00 Pm',
          ),
          const TimeLabel(
            day: 'Wednesday',
            time: '09:00 Am To 8:00 Pm',
          ),
          const TimeLabel(
            day: 'Thursday',
            time: '09:00 Am To 8:00 Pm',
          ),
          const TimeLabel(
            day: 'Friday',
            time: '09:00 Am To 8:00 Pm',
          ),
          const TimeLabel(
            day: 'Saturday',
            time: '09:00 Am To 8:00 Pm',
          ),
          const TimeLabel(
            day: 'Sunday',
            time: 'Close',
          )
        ],
      ),
    );
  }
}
