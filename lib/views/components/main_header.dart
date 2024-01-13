import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/config.dart';
import '../../theme/theme.dart';
import 'notification_widget.dart';

class MainHeader extends StatelessWidget implements PreferredSizeWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        t.translate("location"),
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.hintColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      SvgPicture.asset(
                        AppAssets.icLocation,
                        height: 18.sp,
                        width: 18.sp,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Text(
                    'Venkatesa Gramani Street',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 14.sp,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            SvgPicture.asset(
              AppAssets.icSearch,
              height: 25.sp,
              width: 25.sp,
            ),
            SizedBox(
              width: 8.w,
            ),
            NotificationWidget(
              iconColor: AppColors.fontMain,
            ),
            SizedBox(
              width: 5.w,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
