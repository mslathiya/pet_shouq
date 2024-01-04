import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../theme/theme.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final String iconName;
  final VoidCallback onPressMenu;
  const MenuItem({
    super.key,
    required this.title,
    required this.iconName,
    required this.onPressMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onPressMenu,
        child: Container(
          margin: EdgeInsets.only(bottom: 5.h),
          padding: EdgeInsets.symmetric(
            horizontal: 12.sp,
            vertical: 5.sp,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                iconName,
                height: 36.sp,
                width: 36.sp,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    title,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          height: 1.2,
                          letterSpacing: 0.20,
                          fontWeight: FontWeight.w700,
                          fontSize: 15.sp,
                        ),
                  ),
                ),
              ),
              Icon(
                Entypo.chevron_right,
                size: 18.sp,
                color: AppColors.fontMain,
              )
            ],
          ),
        ),
      ),
    );
  }
}
