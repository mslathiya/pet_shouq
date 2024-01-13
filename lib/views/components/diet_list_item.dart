import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../theme/theme.dart';
import 'label_with_icon.dart';

class DietListItem extends StatelessWidget {
  final VoidCallback onViewDetail;

  const DietListItem({
    super.key,
    required this.onViewDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.sp,
        vertical: 10.sp,
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
                  'Dry dog food (Brand X)',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 14.sp,
                      ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.start,
                  direction: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 110.sp,
                      child: const LabelWithIcon(
                        asset: AppAssets.icCalendar,
                        value: '2023-10-15',
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    SizedBox(
                      width: 100.sp,
                      child: const LabelWithIcon(
                        asset: AppAssets.icWaterGlass,
                        value: 'Yes',
                        padding: EdgeInsets.zero,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: InkWell(
              onTap: onViewDetail,
              child: Container(
                width: 35.w,
                height: 35.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.sp),
                  ),
                  color: AppColors.primary.withOpacity(0.4),
                ),
                child: Icon(
                  Entypo.chevron_right,
                  size: 18.sp,
                  color: AppColors.fontMain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
