import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_shouq/theme/theme.dart';

import 'notification_widget.dart';

class TabHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onPressBack;

  const TabHeader({
    super.key,
    required this.title,
    required this.onPressBack,
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
