import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../config/config.dart';
import '../../theme/theme.dart';

class NotificationWidget extends StatelessWidget {
  final Color iconColor;
  const NotificationWidget({
    super.key,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(notifications),
      behavior: HitTestBehavior.opaque,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            child: SvgPicture.asset(
              AppAssets.notificationBell,
              height: 27.sp,
              width: 27.sp,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            ),
          ),
          Positioned(
            right: -8,
            top: -5,
            child: Container(
              height: 20.sp,
              width: 20.sp,
              decoration: BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.all(
                  Radius.elliptical(
                    22.sp,
                    22.sp,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  "9+",
                  textAlign: TextAlign.center,
                  textScaler: const TextScaler.linear(1),
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: AppColors.white,
                        fontSize: 10.sp,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
