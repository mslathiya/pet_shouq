import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../data/model/models.dart';
import '../../theme/theme.dart';
import 'label_with_icon.dart';
import 'view_button.dart';

class DietListItem extends StatelessWidget {
  final VoidCallback onViewDetail;
  final VoidCallback onDeleteLog;
  final int itemIndex;
  final DietLogInfo info;
  const DietListItem({
    super.key,
    required this.onViewDetail,
    required this.itemIndex,
    required this.info,
    required this.onDeleteLog,
  });

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
              onPressed: (context) => onDeleteLog(),
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
            horizontal: 12.sp,
            vertical: 10.sp,
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
                      info.dietFoodName ?? "",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
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
                          child: LabelWithIcon(
                            asset: AppAssets.icCalendar,
                            value: info.dietDate != null
                                ? DateFormat("dd/MM/yyyy")
                                    .format(info.dietDate!)
                                : "",
                            padding: EdgeInsets.zero,
                          ),
                        ),
                        SizedBox(
                          width: 100.sp,
                          child: LabelWithIcon(
                            asset: AppAssets.icWaterGlass,
                            value: info.dietWater ?? "",
                            padding: EdgeInsets.zero,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ViewButton(onPressView: onViewDetail),
            ],
          ),
        ),
      ),
    );
  }
}
