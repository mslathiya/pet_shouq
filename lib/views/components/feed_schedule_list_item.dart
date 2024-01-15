import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/theme.dart';
import 'label_with_icon.dart';
import 'switch_component.dart';

class FeedScheduleListItem extends StatelessWidget {
  const FeedScheduleListItem({
    super.key,
    required this.onToggleSwitch,
    required this.itemIndex,
  });
  final int itemIndex;
  final Function(bool isToggled) onToggleSwitch;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10.sp,
        right: 10.sp,
        bottom: 10.sp,
      ),
      child: Slidable(
        key: Key(itemIndex.toString()),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.35,
          children: [
            CustomSlidableAction(
              onPressed: (context) => {},
              child: Container(
                width: 45.w,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.sp),
                  ),
                  color: AppColors.deleteBackground,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: SvgPicture.asset(
                    AppAssets.icDelete,
                    height: 20.sp,
                    width: 20.sp,
                  ),
                ),
              ),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 10.sp,
            horizontal: 12.w,
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
        ),
      ),
    );
  }
}
