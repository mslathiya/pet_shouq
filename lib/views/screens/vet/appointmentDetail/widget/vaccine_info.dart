import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class VaccinationDetails extends StatelessWidget {
  const VaccinationDetails({
    super.key,
  });

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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "pet_vaccination_detail".tr,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(fontSize: 15.sp, height: 1.5),
          ),
          SizedBox(
            height: 5.h,
          ),
          InfoLabel(
            title: "lbl_species".tr,
            description: 'Dog',
            padding: EdgeInsets.only(bottom: 5.h),
          ),
          InfoLabel(
            title: "vaccination_name".tr,
            description: 'Rabies',
            padding: EdgeInsets.only(bottom: 5.h),
          ),
          InfoLabel(
            title: "vaccination_type".tr,
            description: 'Core',
            padding: EdgeInsets.only(bottom: 5.h),
          ),
          InfoLabel(
            title: "vaccination_date".tr,
            description: '01-Jan-2024',
            padding: EdgeInsets.only(bottom: 5.h),
          ),
          InfoLabel(
            title: "next_due_date".tr,
            description: '01-Jan-2024',
            padding: EdgeInsets.only(bottom: 5.h),
          ),
          InfoLabel(
            title: "next_due_date".tr,
            description: '01-Jan-2024',
            padding: EdgeInsets.only(bottom: 5.h),
          ),
          InfoLabel(
            title: "vaccination_provider".tr,
            description: 'ABC Animal Clinic',
            padding: EdgeInsets.only(bottom: 5.h),
          ),
          InfoLabel(
            title: "vaccination_lot_no".tr,
            description: '12345',
            padding: EdgeInsets.only(bottom: 5.h),
          ),
          InfoLabel(
            title: "vaccination_id".tr,
            description: 'VC-2022-12345',
            padding: EdgeInsets.only(bottom: 5.h),
          ),
        ],
      ),
    );
  }
}
