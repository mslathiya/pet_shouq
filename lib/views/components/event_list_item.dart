import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helper/helpers.dart';
import '../../theme/theme.dart';
import 'label_with_icon.dart';

class EventListItem extends StatelessWidget {
  const EventListItem({
    super.key,
    required this.eventType,
  });
  final EventType eventType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.sp,
      ),
      margin: EdgeInsets.only(
        left: 10.sp,
        right: 10.sp,
        bottom: 15.sp,
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.w, right: 12.w),
                  child: Text(
                    'HB0053K05',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 15.sp, height: 1.5),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                  ),
                  child: eventType == EventType.typeAppointment
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const LabelWithIcon(
                              asset: AppAssets.icHospital,
                              value: 'Rimadyl',
                            ),
                            const LabelWithIcon(
                              asset: AppAssets.icPetPaw,
                              value: 'Max',
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 115.sp,
                                  child: const LabelWithIcon(
                                    asset: AppAssets.icCalendar,
                                    value: '04-Jan-2024',
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
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      : const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            LabelWithIcon(
                              asset: AppAssets.icPetPaw,
                              value: 'Max',
                            ),
                            LabelWithIcon(
                              asset: AppAssets.icCalendar,
                              value: '04-Jan-2024',
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
