import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/theme.dart';
import 'notification_widget.dart';

class TabHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? withSearch;
  const TabHeader({
    super.key,
    required this.title,
    this.withSearch = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: Container(),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              height: 2,
              letterSpacing: 0,
            ),
      ),
      actions: [
        withSearch == true
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppAssets.icSearch,
                    height: 25.sp,
                    width: 25.sp,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                ],
              )
            : const SizedBox(),
        NotificationWidget(
          iconColor: AppColors.fontMain,
        ),
        SizedBox(
          width: 15.w,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
