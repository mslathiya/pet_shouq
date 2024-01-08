import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class TimeItem extends StatelessWidget {
  const TimeItem({
    super.key,
    required this.isSelected,
    required this.time,
    required this.isDisabled,
  });
  final bool isSelected;
  final bool isDisabled;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      padding: EdgeInsets.all(4.sp),
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: isDisabled
              ? AppColors.disableFieldBorder
              : isSelected
                  ? AppColors.secondary
                  : AppColors.hintColor,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10.sp),
        ),
        color: isDisabled
            ? AppColors.disableFieldColor
            : isSelected
                ? AppColors.secondary
                : AppColors.white,
      ),
      child: Center(
        child: Text(
          time,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: isDisabled
                    ? AppColors.disableFieldText
                    : isSelected
                        ? AppColors.white
                        : AppColors.hintColor,
                fontSize: 12.sp,
              ),
        ),
      ),
    );
  }
}
