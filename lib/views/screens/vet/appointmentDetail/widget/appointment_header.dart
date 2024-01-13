import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class AppointmentInfo extends StatelessWidget {
  const AppointmentInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10.sp,
        right: 10.sp,
        top: 10.sp,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 8.h,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'BBM555B1',
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(fontSize: 14.sp, height: 1.5),
          ),
          const LabelWithIcon(
            asset: AppAssets.icPetPaw,
            value: 'Bella',
            padding: EdgeInsets.zero,
          ),
          SizedBox(
            height: 5.h,
          ),
          const LabelWithIcon(
            asset: AppAssets.icAppointmentCard,
            value: 'XBM555B1',
            padding: EdgeInsets.zero,
          ),
          SizedBox(
            height: 5.h,
          ),
          const LabelWithIcon(
            asset: AppAssets.icEmail,
            value: 'roselynfelton@gmail.com',
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
