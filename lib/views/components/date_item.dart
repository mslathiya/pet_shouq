import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class DateItem extends StatelessWidget {
  const DateItem({
    super.key,
    required this.date,
    required this.day,
    required this.isSelected,
    required this.isDisabled,
  });
  final String date;
  final String day;
  final bool isSelected;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.sp,
      width: 55.sp,
      padding: EdgeInsets.all(9.sp),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '01',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 16.sp,
                  color: isDisabled
                      ? AppColors.disableFieldText
                      : isSelected
                          ? AppColors.white
                          : AppColors.hintColor,
                ),
          ),
          Text(
            'Tue',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: isDisabled
                      ? AppColors.disableFieldText
                      : isSelected
                          ? AppColors.white
                          : AppColors.hintColor,
                ),
          ),
        ],
      ),
    );
  }
}