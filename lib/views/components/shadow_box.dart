import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class ShadowBox extends StatelessWidget {
  const ShadowBox({
    super.key,
    required this.childWidget,
    this.isExpanded = false,
  });
  final Widget childWidget;
  final bool? isExpanded;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10.sp,
        right: 10.sp,
        bottom: 15.sp,
      ),
      padding: isExpanded!
          ? EdgeInsets.symmetric(
              vertical: 5.sp,
              horizontal: 10.sp,
            )
          : EdgeInsets.symmetric(
              horizontal: 12.sp,
              vertical: 10.sp,
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
      child: childWidget,
    );
  }
}
