import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/theme.dart';

class NotificationListItem extends StatelessWidget {
  const NotificationListItem({
    super.key,
    required this.itemIndex,
  });
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          itemIndex == 0
              ? Padding(
                  padding: EdgeInsets.only(
                    left: 12.w,
                    right: 12.w,
                    bottom: 15.h,
                  ),
                  child: Text(
                    'Today',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 16.sp,
                        ),
                  ),
                )
              : const SizedBox(),
          Padding(
            padding: EdgeInsets.only(
              bottom: 10.sp,
              left: 10.sp,
              right: 10.sp,
            ),
            child: Slidable(
              key: Key(itemIndex.toString()),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                extentRatio: 0.3,
                children: [
                  CustomSlidableAction(
                    onPressed: (context) => {},
                    child: Container(
                      width: 50.w,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                        color: AppColors.deleteBackground,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          AppAssets.icDelete,
                          height: 25.sp,
                          width: 25.sp,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.sp,
                      horizontal: 10.sp,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40.sp,
                          width: 40.sp,
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.sp),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(7.sp),
                            child: SvgPicture.asset(
                              AppAssets.icDiscount,
                              height: 22.sp,
                              width: 22.sp,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.sp,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Various versions have evolved over",
                                  textAlign: TextAlign.left,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 15.sp),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  "Mauris ut erat ut urna rhoncus",
                                  textAlign: TextAlign.left,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                        fontSize: 13.sp,
                                        color: AppColors.hintColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "2 hour ago",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 11.sp,
                            color: AppColors.hintColor,
                          ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
