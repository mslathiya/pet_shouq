import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class TimeView extends StatelessWidget {
  final bool isActive;
  final String time;
  const TimeView({
    super.key,
    this.isActive = false,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      width: 100.w,
      margin: EdgeInsets.all(5.sp),
      decoration: BoxDecoration(
        color: isActive ? AppColors.secondary : AppColors.timeSelector,
        borderRadius: BorderRadius.all(
          Radius.circular(10.sp),
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.sp,
            vertical: 8.sp,
          ),
          child: Text(
            time,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: isActive ? AppColors.white : AppColors.grayFaded,
                  fontSize: 14.sp,
                ),
          ),
        ),
      ),
    );
  }
}
