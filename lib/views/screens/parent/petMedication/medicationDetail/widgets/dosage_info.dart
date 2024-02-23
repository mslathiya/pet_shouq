import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../data/model/models.dart';
import '../../../../../../helper/helpers.dart';
import '../../../../../../theme/theme.dart';
import '../../../../../components/components.dart';

class DosageInfo extends StatelessWidget {
  const DosageInfo({
    super.key,
    required this.info,
  });
  final MedicationInfo info;

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
          if (CommonHelper.isNotEmpty(info.mediDuration))
            Expanded(
              flex: 1,
              child: SpotInfo(
                icon: AppAssets.icCalendarRemainder,
                title: info.mediDuration ?? "",
              ),
            ),
          if (CommonHelper.isNotEmpty(info.mediDosage))
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: SpotInfo(
                  icon: AppAssets.icDosage,
                  title: info.mediDosage ?? "",
                ),
              ),
            ),
          if (CommonHelper.isNotEmpty(info.mediFrequency))
            Expanded(
              flex: 1,
              child: SpotInfo(
                icon: AppAssets.icDosageLiquid,
                title: info.mediFrequency ?? "",
              ),
            )
        ],
      ),
    );
  }
}
