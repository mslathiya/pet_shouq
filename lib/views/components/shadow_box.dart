import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class ShadowBox extends StatelessWidget {
  const ShadowBox({
    super.key,
    required this.childWidget,
    this.isExpanded = false,
    this.withPadding = true,
  });
  final Widget childWidget;
  final bool? isExpanded;
  final bool? withPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10.sp,
        right: 10.sp,
        bottom: 15.sp,
      ),
      padding: withPadding == true
          ? isExpanded!
              ? EdgeInsets.symmetric(
                  vertical: 5.sp,
                  horizontal: 10.sp,
                )
              : EdgeInsets.symmetric(
                  horizontal: 12.sp,
                  vertical: 10.sp,
                )
          : EdgeInsets.zero,
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
