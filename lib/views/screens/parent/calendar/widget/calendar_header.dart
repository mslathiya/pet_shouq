import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';

import '../../../../../theme/theme.dart';

class CalendarHeader extends StatelessWidget {
  final DateTime focusedDay;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;

  const CalendarHeader({
    super.key,
    required this.focusedDay,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
  });

  @override
  Widget build(BuildContext context) {
    final headerText = DateFormat.yMMM().format(focusedDay);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: onLeftArrowTap,
            icon: Icon(
              AntDesign.arrowleft,
              size: 26.sp,
              color: AppColors.fontMain,
            ),
          ),
          Expanded(
            child: Text(
              textAlign: TextAlign.center,
              headerText,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 16.sp,
                    height: 2,
                    color: AppColors.secondary,
                  ),
            ),
          ),
          IconButton(
            onPressed: onRightArrowTap,
            icon: Icon(
              AntDesign.arrowright,
              size: 26.sp,
              color: AppColors.fontMain,
            ),
          ),
        ],
      ),
    );
  }
}
