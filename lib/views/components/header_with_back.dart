import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/theme.dart';

class HeaderWithBack extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onPressBack;

  const HeaderWithBack({
    super.key,
    required this.title,
    required this.onPressBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: InkWell(
        onTap: onPressBack,
        child: Padding(
          padding: EdgeInsets.only(
            left: 12.sp,
            right: 12.sp,
          ),
          child: SvgPicture.asset(
            AppAssets.arrowLeft,
          ),
        ),
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              height: 2,
              letterSpacing: 0,
            ),
      ),
      actions: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              child: SvgPicture.asset(
                AppAssets.notificationBell,
                height: 27.sp,
                width: 27.sp,
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
        SizedBox(
          width: 5.w,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
