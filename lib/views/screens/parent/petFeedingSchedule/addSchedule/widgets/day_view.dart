import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../theme/theme.dart';

class DayView extends StatelessWidget {
  const DayView({
    super.key,
    required this.idealSize,
    required this.dayName,
    required this.isActive, this.onTap,
  });
  final String dayName;
  final bool isActive;
  final double idealSize;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: idealSize,
        width: idealSize,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(100),
          ),
          border: Border.all(
            color: isActive ? AppColors.secondary : AppColors.gray,
            width: 2,
          ),
          color: isActive ? AppColors.secondary : AppColors.white,
        ),
        child: Center(
          child: Text(
            dayName,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 16.sp,
                  color: isActive ? AppColors.white : AppColors.gray,
                ),
          ),
        ),
      ),
    );
  }
}
