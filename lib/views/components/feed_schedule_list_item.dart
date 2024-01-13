import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';
import 'label_with_icon.dart';
import 'switch_component.dart';

class FeedScheduleListItem extends StatelessWidget {
  const FeedScheduleListItem({
    super.key,
    required this.onToggleSwitch,
  });

  final Function(bool isToggled) onToggleSwitch;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.sp,
        horizontal: 12.w,
      ),
      margin: EdgeInsets.only(
        left: 10.sp,
        right: 10.sp,
        bottom: 10.sp,
      ),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '12:00 Pm',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 14.sp),
                ),
                SizedBox(
                  height: 5.h,
                ),
                const LabelWithIcon(
                  asset: AppAssets.icFeedTag,
                  value: 'Morning Feeding',
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
          StyledSwitch(
            onToggled: onToggleSwitch,
            isActive: false,
          ),
        ],
      ),
    );
  }
}
