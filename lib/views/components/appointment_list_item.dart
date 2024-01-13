import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../config/config.dart';
import '../../theme/theme.dart';
import 'label_with_icon.dart';

class AppointmentListItem extends StatelessWidget {
  final VoidCallback onViewDetail;
  final ApplicationLocalizations t;
  const AppointmentListItem({
    super.key,
    required this.onViewDetail,
    required this.t,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 12.w,
                    right: 12.w,
                    top: 2.h,
                  ),
                  child: Text(
                    'HB0053K05',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 14.sp, height: 2),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.only(
                    left: 10.w,
                    right: 10.w,
                    top: 4.h,
                    bottom: 4.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.h),
                    ),
                    color: const Color.fromRGBO(32, 113, 30, 1),
                  ),
                  child: Text(
                    'Reschedule',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.white,
                          fontSize: 12.sp,
                        ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12.w,
              right: 12.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const LabelWithIcon(
                            asset: AppAssets.icHospital,
                            value: 'Rimadyl',
                            padding: EdgeInsets.zero,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          const LabelWithIcon(
                            asset: AppAssets.icPetPaw,
                            value: 'Max',
                            padding: EdgeInsets.zero,
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
                SizedBox(
                  height: 5.h,
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  runAlignment: WrapAlignment.start,
                  direction: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 115.sp,
                      child: const LabelWithIcon(
                        asset: AppAssets.icCalendar,
                        value: '04-Jan-2024',
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    SizedBox(
                      width: 170.sp,
                      child: const LabelWithIcon(
                        asset: AppAssets.icClock,
                        value: '11:00 Am To 11:30 AM',
                        padding: EdgeInsets.zero,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
