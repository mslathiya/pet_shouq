import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/theme.dart';

class SpotInfo extends StatelessWidget {
  final String icon;
  final String title;
  final TextStyle? textStyle;
  final Color? boxColor;

  const SpotInfo({
    super.key,
    required this.icon,
    required this.title,
    this.textStyle,
    this.boxColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        color: boxColor ?? AppColors.primary,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            height: 28.sp,
            width: 28.sp,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            title,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(
                  fontSize: 14.sp,
                )
                .merge(textStyle),
          ),
        ],
      ),
    );
  }
}
