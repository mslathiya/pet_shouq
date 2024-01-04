import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_shouq/config/config.dart';
import 'package:pet_shouq/views/components/components.dart';

import '../../theme/theme.dart';

class MainHeader extends StatelessWidget implements PreferredSizeWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  t.translate("location"),
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.hintColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                SizedBox(
                  height: 5.w,
                ),
                Text(
                  'Venkatesa Gramani Street sadsad sadsadsadsad asd sad sad',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 15.sp,
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
            height: 27.sp,
            width: 27.sp,
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
