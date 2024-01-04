import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../theme/theme.dart';

class SpotInfo extends StatelessWidget {
  final String icon;
  final String title;
  const SpotInfo({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        color: AppColors.lightBrown,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Column(
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
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 16.sp,
                ),
          ),
        ],
      ),
    );
  }
}
