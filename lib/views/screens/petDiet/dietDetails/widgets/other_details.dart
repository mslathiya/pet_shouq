import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/config.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class OtherDetails extends StatelessWidget {
  const OtherDetails({
    super.key,
    required this.t,
  });

  final ApplicationLocalizations t;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10.sp,
        right: 10.sp,
        bottom: 15.sp,
      ),
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
      child: Column(
        children: [
          InfoLabel(
            day: t.translate("food_type"),
            time: '900133000003382',
          ),
          InfoLabel(
            day: t.translate("portion_size"),
            time: 'Yes',
          ),
          InfoLabel(
            day: t.translate("special_instruction"),
            time: 'Lorem ipsum',
          ),
          InfoLabel(
            day: t.translate("weight"),
            time: 'Lorem ipsum',
          ),
        ],
      ),
    );
  }
}
