import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../theme/theme.dart';
import '../../../../../components/components.dart';

class DosageInfo extends StatelessWidget {
  const DosageInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10.sp,
        right: 10.sp,
        bottom: 10.sp,
        top: 5.sp,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Expanded(
            flex: 1,
            child: SpotInfo(
              icon: AppAssets.icCalendarRemainder,
              title: 'Once daily',
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const SpotInfo(
                icon: AppAssets.icDosage,
                title: ' 25mg',
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: SpotInfo(
              icon: AppAssets.icDosageLiquid,
              title: 'None',
            ),
          )
        ],
      ),
    );
  }
}
